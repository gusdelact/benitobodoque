unit IntMQrColProm;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, IntGenCre,UnSQL2;

type
  TQrColProm = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    qyConsulta: TQuery;
    QRBand1: TQRBand;
    QRFoot1: TQRBand;
    QRExpr1: TQRExpr;
    QRBand4: TQRBand;
    QRLabel38: TQRLabel;
    QRBand5: TQRBand;
    QRExpr6: TQRExpr;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRFoot2: TQRBand;
    QRLabel4: TQRLabel;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape2: TQRShape;
    QRLabel16: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel9: TQRLabel;
    qyConsultaID_CREDITO: TFloatField;
    qyConsultaID_CONTRATO: TFloatField;
    qyConsultaID_TITULAR: TFloatField;
    qyConsultaCLIENTE: TStringField;
    qyConsultaID_PERS_ASOCIAD: TFloatField;
    qyConsultaPROMASOC: TStringField;
    qyConsultaID_PROM_ADM: TFloatField;
    qyConsultaPROMADM: TStringField;
    qyConsultaF_AUTORIZA: TDateTimeField;
    qyConsultaF_INICIO: TDateTimeField;
    qyConsultaIMP_CREDITO: TFloatField;
    qyConsultaF_VENCIMIENTO: TDateTimeField;
    qyConsultaCVE_PRODUCTO_CRE: TStringField;
    qyConsultaDESC_L_PRODUCTO: TStringField;
    qyConsultaID_CRED_EXTERNO: TStringField;
    qyConsultaID_CONTROL_EXT: TStringField;
    QRFoot3: TQRBand;
    QRGroup3: TQRGroup;
    QRDBText5: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText16: TQRDBText;
    QRLabel10: TQRLabel;
    QRExpr4: TQRExpr;
    QRLabel11: TQRLabel;
    QRExpr5: TQRExpr;
    QRDBText13: TQRDBText;
    QRDBText8: TQRDBText;
    QRShape1: TQRShape;
    QRDBText15: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel2: TQRLabel;
    procedure QRGroup3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFoot3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFoot2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFoot1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
  public
     Apli : TInterApli;
     Function LlenaEncabezado(sFInicio,sFFin,sProducto,
                         sPromAsoc, sPromAdmon, sEmpresa, sSucursal : String) : String;

  end;

var
  QrColProm: TQrColProm;
  //easa4011 14.03.2008 consulta en excel
  bGenArch: Boolean;
  sArchivo:String;
  F: TextFile;
   sTitulo1, sTitulo2:String;
  //end easa 14.03.2008

Procedure EjecutarReporteColPromotor(  sF_Inicio,sF_Fin,sProducto,
                                       sPromAsoc,sPromAdmon, sEmpresa, sSucursal,sNbrArch :String; //easa4011 14.03.2008 consulta en excel
                                       pAPli     : TInterApli;
                                       pPreview  : Boolean);
Implementation
{$R *.DFM}

Procedure EjecutarReporteColPromotor(   sF_Inicio,sF_Fin,sProducto,
                            sPromAsoc,sPromAdmon, sEmpresa, sSucursal,sNbrArch  :String; //easa4011 14.03.2008 consulta en excel
                            pAPli     : TInterApli;
                            pPreview  : Boolean);
Var
    QrColProm   : TQrColProm;
    Preview     : TIntQRPreview;
Begin
      QrColProm   := TQrColProm.Create(Nil);
      Preview := TIntQRPreview.CreatePreview(Application, QrColProm);
      QrColProm.Apli := pAPli;
      sArchivo:= sNbrArch;      
      Try

        QrColProm.QRInterEncabezado1.Apli:=pApli;
        QrColProm.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
        QrColProm.QRInterEncabezado1.NomReporte:='IntMQrColProm';
        QrColProm.QRInterEncabezado1.Titulo1:='Reporte de Colocación por Promotor';
        QrColProm.QRInterEncabezado1.Titulo2:= 'Periodo del '+  sF_Inicio + ' al ' + sF_Fin;
        QrColProm.qyConsulta.DatabaseName := pApli.DataBaseName;
        QrColProm.qyConsulta.SessionName := pApli.SessionName;
        QrColProm.qyConsulta.Active:=False;
        QrColProm.qyConsulta.SQL.Text:= QrColProm.LlenaEncabezado( sF_Inicio, sF_Fin, sProducto,
                                                                   sPromAsoc, sPromAdmon, sEmpresa, sSucursal);

      If Trim(sArchivo)<>'' Then Begin
         AssignFile(F, sArchivo);
         Rewrite(F);
         Writeln(F, QrColProm.QRInterEncabezado1.Titulo1 + #09 );
         Writeln(F, QrColProm.QRInterEncabezado1.Titulo2 + #09 );
         Writeln(F,  #09 );
         Writeln(F,
             'ID CREDITO'+ #09 +
             'ID CONTRATO '+ #09 +
             'ID TITULAR '+ #09 +
             'CLIENTE '+ #09 +
             'ID PROM. ASOCIAD. '+ #09 +
             'NOMBRE PROM. ASOC.'+ #09 +
             'ID PROM. ADM.'+ #09 +
             'NOMBRE PROM. ADM.'+ #09 +
             'F. AUTORIZACION'+ #09 +
             'F. INICIO'+ #09 +
             'IMP. CREDITO'+ #09 +
             'F. VENCIMIENTO'+ #09 +
             'CVE. PRODUCTO'+ #09 +
             'DES. PRODUCTO');
      End;
        QrColProm.qyConsulta.Active:=True;
        If pPreview Then
            QrColProm.Preview
        Else
            QrColProm.Print;
    Finally
      If Trim(sArchivo)<>'' Then Begin
         bGenArch:= True;
         CloseFile(F);
      End;
        QrColProm.free;
        If Assigned(Preview) Then Preview.Free;
    End;
End;

Function TQrColProm.LlenaEncabezado(sFInicio,sFFin,sProducto,sPromAsoc,sPromAdmon,
                                    sEmpresa, sSucursal : String) : String;
Var
    sSQL:String;
Begin
    sSQL:= ' SELECT CRD.ID_CREDITO,CRD.ID_CONTRATO, CONT.ID_TITULAR, PER.NOMBRE AS CLIENTE, CONT.ID_PERS_ASOCIAD, PRAS.NOMBRE AS PROMASOC, ' +
           '        CRD.ID_PROM_ADM, PRAD.NOMBRE AS PROMADM, ' +
           '        CRD.F_AUTORIZA, CRD.F_INICIO, CRD.IMP_CREDITO, CRD.F_VENCIMIENTO, ' +
           '        CRCONT.CVE_PRODUCTO_CRE, PROD.DESC_L_PRODUCTO, ' +
           '        CRD.ID_CRED_EXTERNO, CRD.ID_CONTROL_EXT '+
           ' FROM CR_CREDITO CRD, CONTRATO CONT, PERSONA PER, PERSONA PRAS, '+
           '      PERSONA PRAD, CR_CONTRATO CRCONT,CR_PRODUCTO PROD ' +
           ' WHERE CRD.ID_CONTRATO = CONT.ID_CONTRATO ' +
           ' AND CONT.ID_TITULAR = PER.ID_PERSONA ' +
           ' AND CONT.ID_PERS_ASOCIAD = PRAS.ID_PERSONA ' +
           ' AND CRD.ID_PROM_ADM = PRAD.ID_PERSONA ' +
           ' AND CONT.ID_CONTRATO = CRCONT.ID_CONTRATO ' +
           ' AND CRCONT.CVE_PRODUCTO_CRE = PROD.CVE_PRODUCTO_CRE ' +
           ' AND CRD.SIT_CREDITO = ''AC''';

        If (Trim(sFInicio)<>'') Then Begin
            sSQL:= sSQL + ' AND CRD.F_INICIO >= TO_DATE('''+
                   FormatDateTime('DD/MM/YYYY',StrToDate(sFInicio))+''',''DD/MM/YYYY'')';
        End;
        If (Trim(sFFin)<>'') Then Begin
            sSQL:= sSQL + ' AND CRD.F_INICIO <= TO_DATE('''+
                   FormatDateTime('DD/MM/YYYY',StrToDate(sFFin))+''',''DD/MM/YYYY'')';
        End;
        If (Trim(sProducto)<>'') Then
            sSQL:= sSQL + ' AND  PROD.CVE_PRODUCTO_CRE ='''+sProducto+'''';
        If (Trim(sPromAsoc)<>'') Then
            sSQL:= sSQL + ' AND  CONT.ID_PERS_ASOCIAD ='+ sPromAsoc;
        If (Trim(sPromAdmon)<>'') Then
            sSQL:= sSQL + ' AND  CRD.ID_PROM_ADM ='+ sPromAdmon;
        If (Trim(sEmpresa)<>'') Then
            sSQL:= sSQL + ' AND  PROD.ID_EMPRESA ='+ Trim(sEmpresa);
       sSQL:= sSQL + ' ORDER BY PROMASOC, PROMADM, ID_TITULAR, F_INICIO, ID_CREDITO';
    Result:= sSQL;
End;


procedure TQrColProm.QRGroup3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If sArchivo <>'' Then Begin
         Writeln(F,
                  qyConsulta.FieldByName('id_credito').AsString + #09+
                  qyConsulta.FieldByName('id_contrato').AsString + #09+
                  qyConsulta.FieldByName('id_titular').AsString + #09+
                  qyConsulta.FieldByName('cliente').AsString + #09+
                  qyConsulta.FieldByName('ID_PERS_ASOCIAD').AsString + #09+
                  qyConsulta.FieldByName('promasoc').AsString + #09+
                  qyConsulta.FieldByName('ID_PROM_ADM').AsString + #09+
                  qyConsulta.FieldByName('promadm').AsString + #09+
                  FormatDateTime('dd/mm/yyyy',qyConsulta.FieldByName('f_autoriza').AsDateTime) + #09+
                  FormatDateTime('dd/mm/yyyy',qyConsulta.FieldByName('f_inicio').AsDateTime) + #09+
                  FormatFloat('###,###,###,###,###,##0.00',qyConsulta.FieldByName('imp_credito').AsFloat) + #09+
                  FormatDateTime('dd/mm/yyyy',qyConsulta.FieldByName('f_vencimiento').AsDateTime) + #09+
                  qyConsulta.FieldByName('cve_producto_cre').AsString + #09+
                  qyConsulta.FieldByName('desc_l_producto').AsString);
   End;
end;

procedure TQrColProm.QRFoot3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If sArchivo <>'' Then Begin
      Writeln(F, #09#09#09 + 'Total Reg. por Acreditado:'+ #09 +
                  FormatFloat('##0',QRExpr4.Value.intResult) +#09 +
                   #09#09#09 + 'Total Imp. Acreditado:'+ #09 +
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr5.Value.dblResult));
   End;
end;

procedure TQrColProm.QRFoot2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If sArchivo <>'' Then Begin
      Writeln(F, #09#09#09 + 'Total Reg. por Prom. Adm.:'+ #09 +
                  FormatFloat('##0',QRExpr2.Value.intResult) +#09 +
                   #09#09#09 + 'Total Imp. Adm.:'+ #09 +
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr5.Value.dblResult));
   End;
end;

procedure TQrColProm.QRFoot1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If sArchivo <>'' Then Begin
      Writeln(F, #09#09#09 + 'Total Reg. por Prom. Asoc.:'+ #09 +
                  FormatFloat('##0',QRExpr1.Value.intResult) +#09 +
                   #09#09#09 + 'Total Imp. Asoc.:'+ #09 +
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr6.Value.dblResult));
   End;

end;

End.

