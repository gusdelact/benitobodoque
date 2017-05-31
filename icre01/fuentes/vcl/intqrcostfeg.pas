unit IntQrCostFeg;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, IntGenCre,UnSQL2;

type
  TQrCostFeg = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    ColumnHeaderBand1: TQRBand;
    QRShape2: TQRShape;
    QRLabel13: TQRLabel;
    QRShape5: TQRShape;
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
    qyCostFeg: TQuery;
    QRShape1: TQRShape;
    QRLabel9: TQRLabel;
    QRChildBand1: TQRChildBand;
    qrDetalle: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText6: TQRDBText;
    QRShape4: TQRShape;
    QRLabel1: TQRLabel;
    QRShape12: TQRShape;
    QRLabel3: TQRLabel;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    FooAcred: TQRBand;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    qyCostFegID_CREDITO: TFloatField;
    qyCostFegID_TITULAR: TFloatField;
    qyCostFegNOMBRE: TStringField;
    qyCostFegF_VENCIMIENTO: TDateTimeField;
    QRExpr6: TQRExpr;
    QRDBText18: TQRDBText;
    qyCostFegF_PAGO: TDateTimeField;
    qyCostFegID_CONTROL_EXT: TStringField;
    qyCostFegIMP_COMISION: TFloatField;
    qyCostFegIMP_IVA: TFloatField;
    qyCostFegIMP_PAGADO: TFloatField;
    qyCostFegIMP_IVA_PAGADO: TFloatField;
    qyCostFegTOTAL: TFloatField;
    qyCostFegSIT_COMISION: TStringField;
    QRGroupGpoProducto: TQRGroup;
    QRGroup1: TQRGroup;
    QRShape24: TQRShape;
    QRLabel7: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText11: TQRDBText;
    QRFooterFPago: TQRBand;
    QRLabel11: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRLabel2: TQRLabel;
    QRShape3: TQRShape;
    QRDBText2: TQRDBText;
    QRLabel5: TQRLabel;
    procedure qrDetalleBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FooAcredBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFooterFPagoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);


  private
  public
    Function FormaQuery(sFIniVto, sFFinVto,sFIniPag, sFFinPag, sAcreditado, sDisposicion, sSituacion,
                        sEmpresa, sSucursal:String):String;
  end;
var
  QrCostFeg: TQrCostFeg;
  bGenArch: Boolean;
  sArchivo:String;
  F: TextFile;

Procedure RepCobCostoFEGA( sFIniVto, sFFinVto,sFIniPag, sFFinPag, sAcreditado, sDisposicion,
                           sSituacion, sNbrArch, sEmpresa, sSucursal :String;
                           pAPli     : TInterApli;
                           pPreview, bFVto, bFPago  : Boolean);

Implementation
{$R *.DFM}

Procedure RepCobCostoFEGA( sFIniVto, sFFinVto,sFIniPag, sFFinPag, sAcreditado, sDisposicion,
                           sSituacion, sNbrArch, sEmpresa, sSucursal :String;
                           pAPli     : TInterApli;
                           pPreview, bFVto, bFPago  : Boolean);
Var
   QrCosFeg: TQrCostFeg;
   VLTitulo : String;
   Preview     : TIntQRPreview;
Begin
   VLTitulo := '';
   QrCosFeg:=TQrCostFeg.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QrCosFeg);

   Try
      bGenArch:= False;
      sArchivo:= sNbrArch;
      QrCosFeg.QRInterEncabezado1.Apli:=pAPli;
      QrCosFeg.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
      QrCosFeg.QRInterEncabezado1.NomReporte:='IntQrCostFeg';
      QrCosFeg.QRInterEncabezado1.Titulo1:='Reporte de Cobro de Costo FEGA';

      if bFVto then
         QrCosFeg.QRInterEncabezado1.Titulo2:=' Vencimienton correspondientes del '+  sFIniVto + ' al ' + sFFinVto
      else if bFPago then
         QrCosFeg.QRInterEncabezado1.Titulo2:=' Pagos correspodientes del '+  sFIniPag + ' al ' + sFFinPag;

      If sSituacion = 'AC' then
         QrCosFeg.QRInterEncabezado1.Titulo2:= QrCosFeg.QRInterEncabezado1.Titulo2 + ' Activos '
      else If sSituacion = 'PA' then
         QrCosFeg.QRInterEncabezado1.Titulo2:= QrCosFeg.QRInterEncabezado1.Titulo2 + ' Pendientes de Activar '
      else If sSituacion = 'LQ' then
         QrCosFeg.QRInterEncabezado1.Titulo2:= QrCosFeg.QRInterEncabezado1.Titulo2 + ' Liquidados '
      else If sSituacion = 'IM' then
         QrCosFeg.QRInterEncabezado1.Titulo2:= QrCosFeg.QRInterEncabezado1.Titulo2 + ' Impagados ';

      QrCosFeg.qyCostFeg.Active:=False;
      QrCosFeg.qyCostFeg.DatabaseName := pApli.DataBaseName;
      QrCosFeg.qyCostFeg.SessionName := pApli.SessionName;
      QrCosFeg.qyCostFeg.SQL.Text:= QrCosFeg.FormaQuery( sFIniVto, sFFinVto,sFIniPag, sFFinPag,
                                                         sAcreditado, sDisposicion,
                                                         sSituacion, sEmpresa,    sSucursal);
      QrCosFeg.qyCostFeg.Active:=True;

      If Trim(sArchivo)<>'' Then Begin
         AssignFile(F, sArchivo);
         Rewrite(F);
         Writeln(F, QrCosFeg.QRInterEncabezado1.Titulo1);
         Writeln(F, QrCosFeg.QRInterEncabezado1.Titulo2);
         Writeln(F,  #09 );

         Writeln(F,'Disposición' +  #09+
             'Cliente' +  #09 +
             'Nombre Cliente' +  #09 +
             'Fecha Vto'+  #09 +
             'Fecha Pago' +  #09 +
             'Imp Costo FEGA' +  #09 +
             'Imp Pagado' +#09 +
             'Imp. IVA'+ #09+
             'Imp IVA Pagado'+#09 +
             'Total Pagado'+ #09 +
             'Situación');
         Writeln(F, '');
      End;
      If pPreview Then
         QrCosFeg.Preview
      Else
         QrCosFeg.Print;
    Finally
      If Trim(sArchivo)<>'' Then Begin
         bGenArch:= True;
         CloseFile(F);
      End;
      QrCosFeg.free;
      If Assigned(Preview) Then Preview.Free;
    End;
End;

Function TQrCostFeg.FormaQuery( sFIniVto, sFFinVto,sFIniPag, sFFinPag, sAcreditado, sDisposicion,
                                sSituacion, sEmpresa, sSucursal :String):String;
Var
    sSQL:String;
Begin
    sSQL:= ' SELECT P.ID_PERSONA, ' + coCRLF +
           '        CTO.ID_TITULAR, ' + coCRLF +
           '        P.NOMBRE, ' + coCRLF +
           '        CR.ID_CREDITO, ' + coCRLF +
           '        CR.ID_CONTROL_EXT, ' + coCRLF +
           '        CC.F_VENCIMIENTO, ' + coCRLF +
           '        CC.F_PAGO, ' + coCRLF +
           '        CC.IMP_COMISION, ' + coCRLF +
           '        CC.IMP_PAGADO, ' + coCRLF +
           '        CC.IMP_IVA, ' + coCRLF +
           '        CC.IMP_IVA_PAGADO, ' + coCRLF +
           '        ( CC.IMP_PAGADO + CC.IMP_IVA_PAGADO ) TOTAL, ' + coCRLF +
           '        CC.SIT_COMISION ' + coCRLF +
           ' FROM ( SELECT * FROM CR_CREDITO) CR, ' + coCRLF +
           '      CONTRATO    CTO, ' + coCRLF +
           '      CR_COMISION CC, ' + coCRLF +
           '      PERSONA     P ' + coCRLF +
           ' WHERE CC.CVE_COMISION = ''CUFEGA''' +// IN (SELECT CVE_COMIS_FEGA FROM CR_PARAM_AGRO WHERE CVE_PARAMETRO = ''CRE'') ' + coCRLF +
           '   AND CC.ID_CREDITO = CR.ID_CREDITO ' + coCRLF +
           '   AND CR.ID_CONTRATO = CTO.ID_CONTRATO ' + coCRLF +
           '   AND P.ID_PERSONA = CTO.ID_TITULAR ' + coCRLF;

    If (Trim( sFIniPag ) <> '' ) Then
        sSQL:= sSQL + '   AND CC.F_PAGO >= ' + SQLFecha( StrToDateTime( sFIniPag )) ;

    If (Trim( sFFinPag  ) <> '' ) Then
        sSQL:= sSQL + '   AND CC.F_PAGO <= ' + SQLFecha( StrToDateTime( sFFinPag ) ) ;

    If (Trim( sFIniVto ) <> '' ) Then Begin
        sSQL:= sSQL + '   AND CC.F_VENCIMIENTO >= ' + SQLFecha( StrToDateTime( sFIniVto ) ) ;
    End;

    If (Trim( sFIniVto ) <> '' ) Then Begin
        sSQL:= sSQL + '   AND CC.F_VENCIMIENTO <= ' + SqlFecha( StrToDateTime( sFFinVto ) ) ;
    End;

    If (Trim(sAcreditado)<>'') Then
        sSQL:= sSQL + ' AND  P.ID_PERSONA ='+ sAcreditado;
    If (Trim(sDisposicion)<>'') Then
        sSQL:= sSQL + ' AND CR.ID_CREDITO ='+ sDisposicion;

    If (Trim(sSituacion)<>'') Then
        sSQL:= sSQL + ' AND CC.SIT_COMISION ='+ SQLStr( sSituacion );

    If (Trim(sEmpresa)<>'') Then
        sSQL:= sSQL + ' AND CTO.ID_EMPRESA ='+ Trim(sEmpresa);

    sSQL:= sSQL + ' ORDER BY CC.F_PAGO, CC.F_VENCIMIENTO, P.NOMBRE ';

    Result:= sSQL;
End;

procedure TQrCostFeg.qrDetalleBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
   sFPago, sFVenc: String;
begin
   If sArchivo <>'' Then Begin
      If qyCostFeg.FieldByName('F_PAGO').AsDateTime > 0 Then
         sFPago:= FormatDateTime('dd/mm/yyyy',qyCostFeg.FieldByName('F_PAGO').AsDateTime);
      If qyCostFeg.FieldByName('F_VENCIMIENTO').AsDateTime > 0 Then
         sFVenc:= FormatDateTime('dd/mm/yyyy',qyCostFeg.FieldByName('F_VENCIMIENTO').AsDateTime);

      Writeln(F, qyCostFeg.FieldByName('ID_CREDITO').AsString + #09 +
                 qyCostFeg.FieldByName('ID_TITULAR').AsString + #09 +
                 qyCostFeg.FieldByName('NOMBRE').AsString + #09 +
                 sFPago + #09 +
                 sFVenc + #09 +
                 FormatFloat('###,###,###,###,###,##0.00',qyCostFeg.FieldByName('IMP_COMISION').AsFloat) + #09 +
                 FormatFloat('###,###,###,###,###,##0.00',qyCostFeg.FieldByName('IMP_PAGADO').AsFloat) + #09 +
                 FormatFloat('###,###,###,###,###,##0.00',qyCostFeg.FieldByName('IMP_IVA').AsFloat) + #09 +
                 FormatFloat('###,###,###,###,###,##0.00',qyCostFeg.FieldByName('IMP_IVA_PAGADO').AsFloat) + #09 +
                 FormatFloat('###,###,###,###,###,##0.00',qyCostFeg.FieldByName('TOTAL').AsFloat) + #09 +
                 qyCostFeg.FieldByName('SIT_COMISION').AsString);
   End;
end;

procedure TQrCostFeg.FooAcredBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If sArchivo <>'' Then Begin
      Writeln(F,  'TOTAL ACREDITADO' + #09#09#09#09 +
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr2.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr3.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr4.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr6.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr5.Value.dblResult));
   End;
end;

procedure TQrCostFeg.QRFooterFPagoBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If sArchivo <>'' Then Begin
      Writeln(F,  'TOTAL F_PAGO' + #09#09#09#09 +
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr10.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr7.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr1.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr8.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr9.Value.dblResult));
   End;
   If qyCostFeg.Eof Then Begin
      If Trim(sArchivo)<>'' Then Begin
         sArchivo:='';
         bGenArch:= True;
         CloseFile(F);
      End;
   End;
end;

End.
