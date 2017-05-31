unit IntMQrGarFeg;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview;

type
  TQrGarFeg = class(TQuickRep)
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
    qyGarFeg: TQuery;
    QRShape1: TQRShape;
    QRLabel9: TQRLabel;
    QRChildBand1: TQRChildBand;
    qrDetalle: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText6: TQRDBText;
    QRShape4: TQRShape;
    QRLabel1: TQRLabel;
    QRShape11: TQRShape;
    QRLabel2: TQRLabel;
    QRShape12: TQRShape;
    QRLabel3: TQRLabel;
    QRShape14: TQRShape;
    QRLabel4: TQRLabel;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    FooAcred: TQRBand;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRLabel14: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    qyGarFegID_CREDITO: TFloatField;
    qyGarFegID_TITULAR: TFloatField;
    qyGarFegNOMBRE: TStringField;
    qyGarFegF_INICIO: TDateTimeField;
    qyGarFegF_VENCIMIENTO: TDateTimeField;
    qyGarFegIMP_CREDITO: TFloatField;
    qyGarFegSDO_INSOLUTO: TFloatField;
    qyGarFegIMP_INTERES_PAG: TFloatField;
    qyGarFegSIT_CREDITO: TStringField;
    qyGarFegPCT_GTIA_FEGA_EF: TFloatField;
    qyGarFegIMP_SOLICITAR: TFloatField;
    qyGarFegSIT_GAR_SOL_FEG: TStringField;
    qyGarFegIMP_RECUPERADO: TFloatField;
    qyGarFegIMPXRECUP: TFloatField;
    QRExpr1: TQRExpr;
    QRExpr6: TQRExpr;
    QRDBText18: TQRDBText;
    procedure qrDetalleBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FooAcredBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);


  private
  public
    Function FormaQuery(sFInicio,sFFin,sAcreditado,
                        sDisposicion, sPctFega,sSituacion,
                        sEmpresa, sSucursal:String):String;
  end;
var
  QrGarFeg: TQrGarFeg;
  bGenArch: Boolean;
  sArchivo:String;
  F: TextFile;

Procedure RepGarFEGA(sF_Inicio,sF_Fin,
                     sAcreditado, sDisposicion, sPctFega,
                     sSituacion, sNbrArch, sEmpresa, sSucursal :String;
                     pAPli     : TInterApli;
                     pPreview  : Boolean);
Implementation
{$R *.DFM}

Procedure RepGarFEGA(sF_Inicio,sF_Fin,
                     sAcreditado, sDisposicion, sPctFega,
                     sSituacion, sNbrArch, sEmpresa, sSucursal :String;
                     pAPli     : TInterApli;
                     pPreview  : Boolean);
Var
   QrGarFeg: TQrGarFeg;
   VLTitulo : String;
   Preview     : TIntQRPreview;
Begin
   VLTitulo := '';
   QrGarFeg:=TQrGarFeg.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QrGarFeg);
   Try
      bGenArch:= False;
      sArchivo:= sNbrArch;
      QrGarFeg.QRInterEncabezado1.Apli:=pAPli;
      QrGarFeg.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
      QrGarFeg.QRInterEncabezado1.NomReporte:='IntMQrGarFeg';
      QrGarFeg.QRInterEncabezado1.Titulo1:='Reporte de Garantías FEGA';
      QrGarFeg.QRInterEncabezado1.Titulo2:='Periodo del '+  sF_Inicio + ' al ' + sF_Fin;

      QrGarFeg.qyGarFeg.Active:=False;
      QrGarFeg.qyGarFeg.DatabaseName := pApli.DataBaseName;
      QrGarFeg.qyGarFeg.SessionName := pApli.SessionName;
      QrGarFeg.qyGarFeg.SQL.Text:= QrGarFeg.FormaQuery(sF_Inicio,sF_Fin,sAcreditado,
                                                       sDisposicion, sPctFega,sSituacion,
                                                       sEmpresa, sSucursal);
      QrGarFeg.qyGarFeg.Active:=True;

      If Trim(sArchivo)<>'' Then Begin
         AssignFile(F, sArchivo);
         Rewrite(F);
         Writeln(F, QrGarFeg.QRInterEncabezado1.Titulo1);
         Writeln(F, QrGarFeg.QRInterEncabezado1.Titulo2);
         Writeln(F,  #09 );

         Writeln(F,'Crédito' +  #09+
             'Cliente' +  #09 +
             'Nombre Cliente' +  #09 +
             'Fecha Inicio'+  #09 +
             'Fecha Vto' +  #09 +
             'Imp Crédito' +  #09 +
             'Saldo Insoluto' +#09 +
             'Imp. Interes'+ #09+
             '% FEGA'+ #09 +
             'Imp Garantía FEGA'+#09 +
             'Situación Garantia FEGA'+ #09 +
             'Garantía FEGA recuperada'+ #09 +
             'Garantía FEGA por recuperar');
         Writeln(F, '');
      End;
      If pPreview Then
         QrGarFeg.Preview
      Else
         QrGarFeg.Print;
    Finally
      If Trim(sArchivo)<>'' Then Begin
         bGenArch:= True;
         CloseFile(F);
      End;
      QrGarFeg.free;
      If Assigned(Preview) Then Preview.Free;
    End;
End;

Function TQrGarFeg.FormaQuery(sFInicio, sFFin,
                            sAcreditado, sDisposicion, sPctFega,
                            sSituacion, sEmpresa, sSucursal :String):String;
Var
    sSQL:String;
Begin
    sSQL:= ' SELECT CRD.ID_CREDITO,CONT.ID_TITULAR, PER.NOMBRE, CRD.F_INICIO, CRD.F_VENCIMIENTO, CRD.IMP_CREDITO, CRD.SDO_INSOLUTO, ' +
           '        CRD.IMP_INTERES_PAG, CRD.SIT_CREDITO, SOLFEG.PCT_GTIA_FEGA_EF, SOLFEG.IMP_SOLICITAR, ' +
           '        SOLFEG.SIT_GAR_SOL_FEG, SOLFEG.IMP_RECUPERADO, ' +
           '        (NVL(SOLFEG.IMP_APLICADO,0) - NVL(SOLFEG.IMP_RECUPERADO,0)) AS IMPXRECUP,' +
           '        CR_PRODUCTO.ID_EMPRESA '+
           ' FROM CR_CREDITO CRD, CONTRATO CONT, PERSONA PER, CR_GA_SOL_FEGA SOLFEG,  ' +
           '      CR_CONTRATO, CR_PRODUCTO '+
           ' WHERE CRD.ID_CONTRATO = CONT.ID_CONTRATO ' +
           ' AND CONT.ID_TITULAR = PER.ID_PERSONA ' +
           ' AND CRD.ID_CREDITO = SOLFEG.ID_CREDITO '+
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
    If (Trim(sPctFega)<>'') Then
        sSQL:= sSQL + ' AND SOLFEG.PCT_GTIA_FEGA_EF ='+ sPctFega;
    If (Trim(sSituacion)<>'') Then
        sSQL:= sSQL + ' AND SOLFEG.SIT_GAR_SOL_FEG ='''+ sSituacion + '''';
    If (Trim(sEmpresa)<>'') Then
        sSQL:= sSQL + ' AND CR_PRODUCTO.ID_EMPRESA ='+ Trim(sEmpresa);

    sSQL:= sSQL + ' ORDER BY PER.NOMBRE, CRD.ID_CREDITO ';
    Result:= sSQL;
End;

procedure TQrGarFeg.qrDetalleBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
   sFIni, sFVenc: String;
begin
   If sArchivo <>'' Then Begin
      If qyGarFeg.FieldByName('F_INICIO').AsDateTime > 0 Then
         sFIni:= FormatDateTime('dd/mm/yyyy',qyGarFeg.FieldByName('F_INICIO').AsDateTime);
      If qyGarFeg.FieldByName('F_VENCIMIENTO').AsDateTime > 0 Then
         sFVenc:= FormatDateTime('dd/mm/yyyy',qyGarFeg.FieldByName('F_VENCIMIENTO').AsDateTime);

      Writeln(F, qyGarFeg.FieldByName('ID_CREDITO').AsString + #09 +
                 qyGarFeg.FieldByName('ID_TITULAR').AsString + #09 +
                 qyGarFeg.FieldByName('NOMBRE').AsString + #09 +
                 sFIni + #09 +
                 sFVenc + #09 +
                 FormatFloat('###,###,###,###,###,##0.00',qyGarFeg.FieldByName('IMP_CREDITO').AsFloat) + #09 +
                 FormatFloat('###,###,###,###,###,##0.00',qyGarFeg.FieldByName('SDO_INSOLUTO').AsFloat) + #09 +
                 FormatFloat('###,###,###,###,###,##0.00',qyGarFeg.FieldByName('IMP_INTERES_PAG').AsFloat) + #09 +
                 FormatFloat('###,###,###,###,###,##0.00',qyGarFeg.FieldByName('PCT_GTIA_FEGA_EF').AsFloat) + #09 +
                 FormatFloat('###,###,###,###,###,##0.00',qyGarFeg.FieldByName('IMP_SOLICITAR').AsFloat) + #09 +
                 qyGarFeg.FieldByName('SIT_GAR_SOL_FEG').AsString + #09 +
                 FormatFloat('###,###,###,###,###,##0.00',qyGarFeg.FieldByName('IMP_RECUPERADO').AsFloat) + #09 +
                 FormatFloat('###,###,###,###,###,##0.00',qyGarFeg.FieldByName('IMPXRECUP').AsFloat) );
   End;
end;

procedure TQrGarFeg.FooAcredBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If sArchivo <>'' Then Begin
      Writeln(F,  'TOTAL' + #09#09#09#09 +
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr2.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr3.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr4.Value.dblResult)+#09+ #09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr5.Value.dblResult)+#09+ #09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr1.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr6.Value.dblResult));
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
