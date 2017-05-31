Unit IntMQrBitCarF;

Interface

Uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, IntGenCre,UnSQL2, QRExport;
Type
  TMQrBitCarF = Class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    QRSHPTTipoCarta: TQRShape;
    QRLabel9: TQRLabel;
    QRSHPTCliente: TQRShape;
    QRLabel17: TQRLabel;
    QRSHPTSaldoIsoluto: TQRShape;
    QRLabel20: TQRLabel;
    QRBand1: TQRBand;
    QRSHPTCredito: TQRShape;
    QRLabel13: TQRLabel;
    QRSHPTProveedor: TQRShape;
    QRLabel33: TQRLabel;
    QRBand2: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRDBText16: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText8: TQRDBText;
    qrgrpFooterTransac: TQRBand;
    QRDBText14: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    qyBitCarF: TQuery;
    qyBitCarFTIPO_CARTA: TStringField;
    qyBitCarFID_CREDITO: TFloatField;
    qyBitCarFATENCIONA: TStringField;
    qyBitCarFF_ELABORACION: TDateTimeField;
    qyBitCarFFH_ALTA: TDateTimeField;
    qyBitCarFCVE_USU_ALTA: TStringField;
    qyBitCarFCVE_USU_AUT_CC: TStringField;
    qyBitCarFFH_AUT_CC: TDateTimeField;
    QRLabel2: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    qyBitCarFTITULAR: TStringField;
    QRLabel4: TQRLabel;
    QRShape5: TQRShape;
    QRDBText5: TQRDBText;

  Private
  Public
    Function FormaQuery(dFInicio, dFFin: TDateTime;
                        sDisp, sContrato, sTipCarta: String ): String;
  end;
Var
  MQrBitCarF: TMQrBitCarF;
  Apli : TInterApli;

Procedure RepBitCarF(  dFInicio, dFFin: TDateTime;
                       sDisp, sTipCarta, sContrato: String;
                       pAPli     : TInterApli;
                       pPreview  : Boolean);

Implementation
{$R *.DFM}

Procedure RepBitCarF(  dFInicio, dFFin: TDateTime;
                       sDisp, sTipCarta, sContrato: String;
                       pAPli     : TInterApli;
                       pPreview  : Boolean);
Var
   MQrBitCarF  : TMQrBitCarF;
   Preview     : TIntQRPreview;
Begin
   MQrBitCarF:=TMQrBitCarF.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, MQrBitCarF);
   Try
      Apli := pApli;
      MQrBitCarF.QRInterEncabezado1.Apli:=pApli;
      MQrBitCarF.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
      MQrBitCarF.QRInterEncabezado1.NomReporte:='IntMQrBitCarF';
      MQrBitCarF.QRInterEncabezado1.Titulo1:='Bitácora de Cartas Finiquito y/o Confirmación de saldos';
      MQrBitCarF.QRInterEncabezado1.Titulo2:='Del '+  DateToStr(dFInicio) + ' al ' + DateToStr(dFFin);

      MQrBitCarF.qyBitCarF.DatabaseName := pApli.DataBaseName;
      MQrBitCarF.qyBitCarF.SessionName := pApli.SessionName;

      MQrBitCarF.qyBitCarF.Active:=False;
      MQrBitCarF.qyBitCarF.SQL.Text:= MQrBitCarF.FormaQuery(dFInicio, dFFin, sDisp, sContrato, sTipCarta);
      MQrBitCarF.qyBitCarF.Active:=True;

      If pPreview Then
         MQrBitCarF.Preview
      Else
         MQrBitCarF.Print;
   Finally
      MQrBitCarF.free;
      If Assigned(Preview) Then Preview.Free;
   End;
End;

Function TMQrBitCarF.FormaQuery(dFInicio, dFFin: TDateTime;
                        sDisp, sContrato, sTipCarta: String ): String;
Var
    sSQL:String;
Begin
    sSQL:= ' SELECT (CASE WHEN C.CVE_TIPO_FORMATO = ''LIQ'' THEN ''CARTA FINIQUITO'' ' + coCRLF +
           '              WHEN C.CVE_TIPO_FORMATO = ''SAD'' THEN ''CONFIRMACION SALDOS'' ' + coCRLF +
	   '		  WHEN C.CVE_TIPO_FORMATO = ''ADE'' THEN ''ADEUDO A LA FECHA'' '  + coCRLF +
           '              WHEN C.CVE_TIPO_FORMATO = ''NAD'' THEN ''NO ADEUDO ACREDITADO'' '  + coCRLF +
	   '		  ELSE ''CARTA'' END ) TIPO_CARTA, '  + coCRLF +
           '        D.ID_CREDITO, ' + coCRLF +
           '        C.ATENCIONA, ' + coCRLF +
           '        C.F_ELABORACION, ' + coCRLF +
           '        C.FH_ALTA, ' + coCRLF +
           '        C.CVE_USU_ALTA, ' + coCRLF +
           '        D.CVE_USU_AUT_CC, ' + coCRLF +
	   '        D.FH_AUT_CC, ' + coCRLF +
           '        P.NOMBRE TITULAR ' + coCRLF +
           '   FROM CR_CTRL_CARTA C, CR_CTRL_CARTA_D D, PERSONA P  ' + coCRLF +
           '  WHERE C.ID_CARTA = D.ID_CARTA(+) ' + coCRLF +
           '    AND C.ID_TITULAR = P.ID_PERSONA(+) ' + coCRLF +
           '    AND C.F_ELABORACION BETWEEN TO_DATE('''+  FormatDateTime('dd/mm/yyyy', dFInicio)  +''',''DD/MM/YYYY'') ' + coCRLF +
	   '    AND TO_DATE(''' + FormatDateTime('dd/mm/yyyy', dFFin)  + ''',''DD/MM/YYYY'') ' + coCRLF;

    if sDisp <> '' then Begin
    sSQL:= sSQL +
           '   AND D.ID_CREDITO = ' + sDisp + coCRLF;
    end;

    if sContrato <> '' then Begin
    sSQL:= sSQL +
           '   AND D.ID_CREDITO IN (SELECT ID_CREDITO FROM CR_CREDITO WHERE ID_CONTRATO = ' + sContrato + ') ' + coCRLF;
    end;

    if sTipCarta <> '' then Begin
    sSQL:= sSQL +
           '   AND C.CVE_TIPO_FORMATO = ''' + sTipCarta + '''' + coCRLF;
    end;


    sSQL:= sSQL +
	   '  ORDER BY C.CVE_TIPO_FORMATO, D.ID_CREDITO, C.FH_ALTA' + coCRLF;
   Result:= sSQL;
End;

End.
