unit IntMQrRepCrRel;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview,UnSQL2, IntGenCre;

type
  TQrRepCrRel = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    qyQuery: TQuery;
    QRLabel9: TQRLabel;
    QRDBText17: TQRDBText;
    QRDBText32: TQRDBText;
    BandEconomico: TQRBand;
    QRLabel17: TQRLabel;
    QRDBText6: TQRDBText;
    SummaryBand1: TQRBand;
    QRShape4: TQRShape;
    QRLabel1: TQRLabel;
    QRShape10: TQRShape;
    QRLabel2: TQRLabel;
    qrlCap: TQRLabel;
    qrPct: TQRLabel;
    qrlCapitalBasico: TQRLabel;
    qrlPctBasico: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape11: TQRShape;
    qrlProporcion: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRShape12: TQRShape;
    QRBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRExpr1: TQRExpr;
    QRDBText7: TQRDBText;
    QRDBText9: TQRDBText;
    qrlAcreditado: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel16: TQRLabel;
    QRExpr2: TQRExpr;
    QRDBText1: TQRDBText;
    QRLabel12: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel14: TQRLabel;
    QRShape3: TQRShape;
    QRLabel7: TQRLabel;
    QRShape5: TQRShape;
    QRLabel25: TQRLabel;
    QRShape6: TQRShape;
    QRLabel24: TQRLabel;
    QRShape7: TQRShape;
    QRLabel22: TQRLabel;
    QRShape8: TQRShape;
    QRLabel20: TQRLabel;
    QRShape9: TQRShape;
    QRLabel18: TQRLabel;
    QRShape13: TQRShape;
    QRLabel13: TQRLabel;
    QRShape14: TQRShape;
    QRLabel15: TQRLabel;
    QRLabel19: TQRLabel;
    qrlFEHA: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel21: TQRLabel;
    qrlFECHA_PAGO: TQRLabel;
    QRLabel26: TQRLabel;
    qrlF_VENCIMIENTO: TQRLabel;
    qrlF_INICIO: TQRLabel;
    qrlINVERS: TQRLabel;
    QRLabel28: TQRLabel;
    procedure SummaryBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroupEconomicoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRAcreditadoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure BandEconomicoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure ColumnHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    sFecha, sFIniMes, sFFinMes, sFCapBasico: String;
    dCapitalB, dPctB, dSdoAcreditado, dSdoTotal, dSdoGrupo: Double;
    APli: TInterApli;
    bImpEnc : Boolean; iIdAcred: Integer;
    Procedure ObtDatos;
  public
    Function FormaQuery(sFMensual:String;pAPli: TInterApli):String;
  end;
var
  QrRepCrRel: TQrRepCrRel;

Procedure RepCrRel(sFMensual: String; pAPli: TInterApli; pPreview: Boolean);

Implementation
{$R *.DFM}

Procedure RepCrRel(sFMensual: String; pAPli: TInterApli; pPreview: Boolean);
Var
    QrRepCrRel : TQrRepCrRel;
    VLTitulo  : String;
    Preview   : TIntQRPreview;
Begin
    VLTitulo := '';

    QrRepCrRel:=TQrRepCrRel.Create(Nil);
    Preview := TIntQRPreview.CreatePreview(Application, QrRepCrRel);
    Try
        QrRepCrRel.sFecha   := sFMensual;
        QrRepCrRel.sFIniMes := DateToStr(DameIniMes(StrToDateTime(sFMensual)));
        QrRepCrRel.sFFinMes := DateToStr(DameFinMes(StrToDateTime(sFMensual)));

        QrRepCrRel.APli:= pAPli;
        QrRepCrRel.bImpEnc:= True;
//        QrRepCrRel.QRInterEncabezado1.Apli:=pApli;
//        QrRepCrRel.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
//        QrRepCrRel.QRInterEncabezado1.NomReporte:='IntMQrRepCrRel';
//        QrRepCrRel.QRInterEncabezado1.Titulo3:='CREDITO RELACIONADO';

        QrRepCrRel.qyQuery.DatabaseName := pApli.DataBaseName;
        QrRepCrRel.qyQuery.SessionName := pApli.SessionName;
        QrRepCrRel.qyQuery.Active:=False;
        QrRepCrRel.qyQuery.SQL.Text:= QrRepCrRel.FormaQuery(sFMensual, pAPli);

        If (Trim(sFMensual)<>'') Then
//            VLTitulo := VLTitulo + ' Al '+ Trim(sFMensual);
        QrRepCrRel.qrlFEHA.Caption := VLTitulo + FormatDateTime('"Al " d "de " MMMM " de "yyyy',StrToDateTime(sFMensual));
//        QrRepCrRel.QRInterEncabezado1.Titulo1 := VLTitulo;
//        QrRepCrRel.QRInterEncabezado1.Titulo2 := 'CRIFRAS EN MILES DE PESOS (VALORIZADO)';

        QrRepCrRel.qyQuery.Active:=False;
        QrRepCrRel.qyQuery.Active:=True;
        If pPreview Then
            QrRepCrRel.Preview
        Else
            QrRepCrRel.Print;
    Finally
        QrRepCrRel.free;
    End;
End;

Function TQrRepCrRel.FormaQuery(sFMensual: String; pAPli: TInterApli):String;
Var
    sSQL:String;
Begin
    sSQL:=  'SELECT REP.ID_ACREDITADO                   ,       A73.NOMBRE_ACRED NOMBRE, '+
            '       ROUND((REP.IMP_AUTORIZADO /1000)) IMP_AUTORIZADO,'+
            '       ROUND((REP.SDO_INSOLUTO /1000)) SDO_INSOLUTO,'+
            '       A73.TX_REL_EMPRESA                  ,       A73.TX_REL_GPO_GFI, '+
            '       REP.TIPO_CREDITO                    ,       CTO.F_INICIO /* ARA.F_INICIO*/ , '+
            '       REP.F_VENCIMIENTO                   ,       ARA.CVE_MONEDA,'+
            '       A73.CVE_GRUPO_ECO                   ,       CR_GRUPO_ECO.DESC_GRUPO_ECO, '+
            '       CR_TIPO_ACRED.DESC_TIPO_ACRED       ,       REP.ID_CONTRATO, '+
            '       A73.B_APLICA_INVERS                 ,       REP.F_PAGO,'+
            '       DECODE ( A73.B_APLICA_INVERS, ''V'',1,0)    SECUENCIA'+
            '  FROM CR_ACR_REL_RECEP REP , CR_ACR_REL_ACRED A73, '+
            '       CR_ACR_REL_CTO ARA, CR_GRUPO_ECO, CR_TIPO_ACRED, '+
            '      ( SELECT ID_CONTRATO, F_INICIO FROM '+
            '            ( SELECT ID_CONTRATO, F_AUT_COMITE F_INICIO '+
            '              FROM CR_CONTRATO '+
            '            UNION '+
            '              SELECT ID_CONTRATO, F_AUT_COMITE F_INICIO '+
            '              FROM CRE_CONTRATO '+
            '            ) '+
            '      ) CTO '+
            'WHERE REP.ID_ACREDITADO  = A73.ID_ACREDITADO'+
            '  AND REP.ID_ACREDITADO  = ARA.ID_ACREDITADO'+
            '  AND REP.ID_CONTRATO    = ARA.ID_CONTRATO'+
            '  AND REP.FOL_CONTRATO   = ARA.FOL_CONTRATO'+
            '  AND A73.CVE_GRUPO_ECO  = CR_GRUPO_ECO.CVE_GRUPO_ECO'+
            '  AND A73.TIPO_ACRED_REL = CR_TIPO_ACRED.TIPO_ACRED_REL'+
            '  AND REP.ID_CONTRATO    = CTO.ID_CONTRATO(+) '+
            '  AND ARA.SIT_AUTORIZACION = ''AC'''+
            '  AND A73.SIT_ACREDITADO   = ''AC''';

    If (Trim(sFMensual)<>'') Then
        sSQL:= sSQL + '   AND REP.F_PROCESO = TO_DATE('''+ Trim(sFMensual)
                    + ''',''DD/MM/YYYY'')';

    sSQL:= sSQL + ' ORDER BY CR_GRUPO_ECO.DESC_GRUPO_ECO, SECUENCIA, A73.NOMBRE_ACRED';
    Result:= sSQL;
End;

procedure TQrRepCrRel.SummaryBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var
   dPctBasico : Double;
   dProporcion: Double;
begin
   dProporcion:= 0;
   dPctBasico := 0;
   ObtDatos;
   qrlCap.Caption:= 'CAPITAL BÁSICO al '+ FormatDateTime('DD "de" MMMM "del" YYYY ',StrToDate(sFCapBasico))+ ':';
   qrlCapitalBasico.Caption:= FormatFloat('$###,###,###,###,##0.00',dCapitalB);
   qrPct.Caption:= FormatFloat('###,##0.0000 %',dPctB)+
                   ' del CAPITAL BÁSICO a '+
                   FormatDateTime('MMMM "del" YYYY ',StrToDate(sFCapBasico))+ ':';

   dPctBasico := ROUND((dCapitalB * dPctB)/100); // PCT capital básico
   qrlPctBasico.Caption:= FormatFloat('$###,###,###,###,##0.00',dPctBasico);

   If (dCapitalB*dPctB)<>0 Then
      dProporcion:= ( dSdoTotal / dPctBasico) * 100
   Else
      dProporcion:= 0;
   qrlProporcion.Caption:= FormatFloat('###,##0.00',dProporcion) + ' %';
   QRLabel4.Caption:= FormatFloat('###,###,###,###,##0.00',dSdoTotal);
end;

Procedure TQrRepCrRel.ObtDatos;
Var
   sSQl, vlsFecha: String;
   qyQuery: TQuery;
Begin
      sSQl:= ' SELECT *'+
             '   FROM CR_ACR_REL_CP_BA'+
             '  WHERE F_TRIMESTRE IN ( SELECT MAX(F_TRIMESTRE) ' +
             '                         FROM CR_ACR_REL_CP_BA WHERE F_TRIMESTRE <= ' + SQLFecha(StrToDateTime(sFecha)) +' )';
      qyQuery:= GetSQLQuery(sSQL, APli.DataBaseName, APli.SessionName, False);
      If qyQuery <> Nil Then Begin
         If Trim(qyQuery.FieldByName('F_TRIMESTRE').AsString) <>'' Then Begin
           dCapitalB:= ROUND( qyQuery.FieldByName('IMP_CAP_BASICO').AsFloat ) ;
           dPctB:= qyQuery.FieldByName('PCT_CAP_BASICO').AsFloat;
           sFCapBasico:= qyQuery.FieldByName('F_TRIMESTRE').AsString;
         End Else Begin
            dCapitalB:= 0;
            dPctB:= 0;
         End;
         qyQuery.Free;
      End
      Else Begin
      dCapitalB:= 0;
      dPctB:= 0;
      End;
END;

procedure TQrRepCrRel.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   dSdoAcreditado := dSdoAcreditado + qyQuery.FieldByName('SDO_INSOLUTO').AsFloat;
   dSdoTotal := dSdoTotal + qyQuery.FieldByName('SDO_INSOLUTO').AsFloat;
   dSdoGrupo := dSdoGrupo + qyQuery.FieldByName('SDO_INSOLUTO').AsFloat;
   qrlF_INICIO.Caption := FormatDateTime('dd-MMM-YYYY ',qyQuery.FieldByName('F_INICIO').AsDateTime);

   If bImpEnc Then Begin
      iIdAcred:= qyQuery.FieldByName('ID_ACREDITADO').AsInteger;
      qrlAcreditado.Caption:= qyQuery.FieldByName('NOMBRE').AsString;
      QRLabel21.Caption :='RELACION CON LA EMPRESA:     ' + qyQuery.FieldByName('TX_REL_EMPRESA').AsString;

      QRDBText9.Enabled:=True;
      QRDBText7.Enabled:=True;
      bImpEnc:= False;

      If qyQuery.FieldByName('B_APLICA_INVERS').AsString ='F' Then Begin
         qrlINVERS.Enabled:=False;
         QRDBText8.Enabled:=True;
         QRDBText11.Enabled:=True;
         QRExpr1.Enabled := True;
         QRLabel28.Enabled:=False;
      end
      else
         qrlINVERS.Enabled:=True;
      //end;
   End
   Else Begin
      qrlAcreditado.Caption:='';
      QRLabel21.Caption :='';
      QRDBText9.Enabled:=False;
      QRDBText7.Enabled:=False;
      If qyQuery.FieldByName('B_APLICA_INVERS').AsString ='V' Then Begin
         QRExpr1.Enabled := FALSE;
         QRLabel28.Enabled:=True;
         QRDBText8.Enabled:=False;
         QRDBText11.Enabled:=False;
      end
      ELSE Begin
         QRDBText8.Enabled:=True;
         QRDBText11.Enabled:=True;
      end;
      qrlINVERS.Enabled:=False;
   End;

   If qyQuery.FieldByName('B_APLICA_INVERS').AsString ='F' Then Begin
      QRDBText1.Enabled:= False;  //CUENTA
      qrlF_VENCIMIENTO.Enabled:= True; //FECHAS
      IF qyQuery.FieldByName('F_PAGO').AsString = '' THEN BEGIN
         qrlFECHA_PAGO.Enabled := False;
         qrlF_VENCIMIENTO.Caption := FormatDateTime('dd-MMM-YYYY ',qyQuery.FieldByName('F_VENCIMIENTO').AsDateTime);
      END
      ELSE BEGIN
         IF ( qyQuery.FieldByName('F_PAGO').AsString >= sFIniMes ) AND
            ( qyQuery.FieldByName('F_PAGO').AsString <= sFFinMes ) then BEGIN
            qrlFECHA_PAGO.Enabled := True;
            qrlF_VENCIMIENTO.Caption := FormatDateTime('dd-MMM-YYYY ',qyQuery.FieldByName('F_PAGO').AsDateTime);
         END
         ELSE BEGIN
            qrlFECHA_PAGO.Enabled := False;
            qrlF_VENCIMIENTO.Caption := FormatDateTime('dd-MMM-YYYY ',qyQuery.FieldByName('F_VENCIMIENTO').AsDateTime);
         END;

      END;
   End Else Begin
      qrlF_VENCIMIENTO.Enabled:= False; //FECHAS
      qrlFECHA_PAGO.Enabled := False;
      QRDBText1.Enabled:= True;  //CUENTA
   End;
end;

procedure TQrRepCrRel.QRGroupEconomicoBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   dSdoGrupo := 0;
end;

procedure TQrRepCrRel.QRAcreditadoBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   dSdoAcreditado := 0;
   If qyQuery.FieldByName('ID_ACREDITADO').AsInteger <> iIdAcred Then
      bImpEnc:= True;
end;

procedure TQrRepCrRel.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   QRLabel16.Caption:= FormatFloat('###,###,###,###,##0',dSdoAcreditado );
end;

procedure TQrRepCrRel.BandEconomicoBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   QRLabel15.Caption:= FormatFloat('###,###,###,###,##0',dSdoGrupo);
end;

procedure TQrRepCrRel.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
   dSdoAcreditado := 0;
   dSdoTotal := 0;
   dSdoGrupo := 0;
   bImpEnc:= True;
end;

procedure TQrRepCrRel.ColumnHeaderBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   iIdAcred:= qyQuery.FieldByName('ID_ACREDITADO').AsInteger;
end;

End.
