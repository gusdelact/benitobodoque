unit IntMQrCtaChqAcr;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, IntGenCre,UnSQL2;

type
  TQrCtaChqAcr = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    qyConsulta: TQuery;
    QRBand1: TQRBand;
    QRBand4: TQRBand;
    QRLabel16: TQRLabel;
    QRBand5: TQRBand;
    QRLabel39: TQRLabel;
    QRLabel43: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRGroup2: TQRGroup;
    QRLabel4: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    ChildBand1: TQRChildBand;
    qrFooterMoneda: TQRBand;
    QRLabel5: TQRLabel;
    qrFooterAcred: TQRBand;
    QRLabel6: TQRLabel;
    qrSumaAcred: TQRExpr;
    QRExpr2: TQRExpr;
    QRChildBand1: TQRChildBand;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrFooterAcredBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrFooterAcredAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
  public
     iRegistros : Integer;
     Apli : TInterApli;
     Function FormaQuery( iAcreditado, iMoneda: Integer;
                          iDisp : Integer; //<LOLS 10 MAR 2006 SE AGREGA FILTRO POR DISPOSICION>
                          sCtaChq, sEmpresa, sSucursal:String): String;
  end;

var
  QrCtaChqAcr: TQrCtaChqAcr;

Procedure RepCtaChqAsocAcred( iAcreditado, iMoneda: Integer;
                              iDisp : Integer; //<LOLS 10 MAR 2006 SE AGREGA FILTRO POR DISPOSICION>
                              sCtaChq, sEmpresa, sSucursal:String;
                              pAPli : TInterApli; pPreview  : Boolean);
Implementation
{$R *.DFM}

Procedure RepCtaChqAsocAcred( iAcreditado, iMoneda: Integer;
                              iDisp : Integer; //<LOLS 10 MAR 2006 SE AGREGA FILTRO POR DISPOSICION>
                              sCtaChq, sEmpresa, sSucursal:String;
                              pAPli : TInterApli; pPreview  : Boolean);
Var
    QrCtaChqAcr   : TQrCtaChqAcr;
    Preview     : TIntQRPreview;
Begin
      QrCtaChqAcr   := TQrCtaChqAcr.Create(Nil);
      Preview := TIntQRPreview.CreatePreview(Application, QrCtaChqAcr);
      QrCtaChqAcr.Apli := pAPli;
      Try
        QrCtaChqAcr.QRInterEncabezado1.Apli:=pApli;
        QrCtaChqAcr.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
        QrCtaChqAcr.QRInterEncabezado1.NomReporte:='IntMQrCtaChqAcr';
        QrCtaChqAcr.QRInterEncabezado1.Titulo1:='Cuentas de Cheques Asociadas con el Acreditado';
        //<LOLS 10 MAR 2006 SE AGREGA FILTRO POR DISPOSICION>
        if iDisp > 0 then
           QrCtaChqAcr.QRInterEncabezado1.Titulo2:='Disposición: ' + IntToStr( iDisp );
        //</LOLS>
        QrCtaChqAcr.qyConsulta.DatabaseName := pApli.DataBaseName;
        QrCtaChqAcr.qyConsulta.SessionName := pApli.SessionName;
        QrCtaChqAcr.qyConsulta.Active:=False;
        QrCtaChqAcr.qyConsulta.SQL.Text:= QrCtaChqAcr.FormaQuery(iAcreditado, iMoneda,
                              iDisp,
                              sCtaChq, sEmpresa, sSucursal);
        QrCtaChqAcr.qyConsulta.Active:=True;

        If pPreview Then
            QrCtaChqAcr.Preview
        Else
            QrCtaChqAcr.Print;
    Finally
        QrCtaChqAcr.free;
        If Assigned(Preview) Then Preview.Free;
    End;
End;

Function TQrCtaChqAcr.FormaQuery(iAcreditado, iMoneda: Integer;
                              iDisp : Integer; //<LOLS 10 MAR 2006 SE AGREGA FILTRO POR DISPOSICION>
                              sCtaChq, sEmpresa, sSucursal:String): String;
Var
    sSQL:String;
    sFldCred    : String;
Begin
    sFldCred := '';
    if iDisp > 0 then
      sFldCred := ', ID_CREDITO';
    //

    sSQL:= ' SELECT CCH.ID_ACREDITADO,PA.NOMBRE ACREDITADO,'+
           '        CCH.CUENTA_BANCO,TIT.NOMBRE,CCH.CVE_MONEDA, MON.DESC_MONEDA,'+
           '        PKGCRCOMUN.STPOBTENSDOCHQRA(CCH.CUENTA_BANCO) SALDO'+
           //<LOLS 10 MAR 2006 SE AGREGA FILTRO POR DISPOSICION>
           '   FROM (SELECT ID_ACREDITADO, CUENTA_BANCO, CVE_MONEDA'+ sFldCred +
           //'   FROM (SELECT ID_ACREDITADO, CUENTA_BANCO, CVE_MONEDA'+
           //</LOLS>
           '           FROM CR_CRED_CHEQ'+
           '          WHERE CVE_TIPO_CHEQ = ''AD'''+
           '            AND SIT_CHEQUERA=''AC'''+
           //<LOLS 10 MAR 2006 SE AGREGA FILTRO POR DISPOSICION>
           '          GROUP BY ID_ACREDITADO, CUENTA_BANCO, CVE_MONEDA'+ sFldCred +
           //'          GROUP BY ID_ACREDITADO, CUENTA_BANCO, CVE_MONEDA'+
           //</LOLS>
           '         )CCH, PERSONA PA, PERSONA TIT, MONEDA MON, CONTRATO CTO_CHQ'+
           '   WHERE PA.ID_PERSONA = CCH.ID_ACREDITADO'+
           '     AND CTO_CHQ.ID_CONTRATO = CCH.CUENTA_BANCO'+
           '     AND TIT.ID_PERSONA = CTO_CHQ.ID_TITULAR'+
           '     AND MON.CVE_MONEDA = CCH.CVE_MONEDA ';

    If iAcreditado > 0 Then
       sSQL:= sSQL + ' AND CCH.ID_ACREDITADO = '+ IntToStr(iAcreditado);
    If iMoneda > 0 Then
       sSQL:= sSQL + ' AND CCH.CVE_MONEDA = '+ IntToStr(iMoneda);
    //<LOLS 10 MAR 2006 SE AGREGA FILTRO POR DISPOSICION>
    if iDisp > 0 then
       sSQL:= sSQL + ' AND CCH.ID_CREDITO = '+ IntToStr(iDisp);
    //</LOLS>
    If Trim(sCtaChq) <> '' Then
       sSQL:= sSQL + ' AND CCH.CUENTA_BANCO = '''+ sCtaChq +'''';
    If (Trim(sEmpresa)<>'') Then
        sSQL:= sSQL + ' AND CTO_CHQ.ID_EMPRESA ='+ Trim(sEmpresa);

    sSQL:= sSQL + ' ORDER BY MON.DESC_MONEDA, PA.NOMBRE, CCH.CUENTA_BANCO ';
    Result:= sSQL;
End;


procedure TQrCtaChqAcr.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   iRegistros := iRegistros + 1;
end;

procedure TQrCtaChqAcr.QRGroup2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   iRegistros:=0;
end;

procedure TQrCtaChqAcr.qrFooterAcredBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If iRegistros > 1 Then PrintBand:= True
   Else PrintBand:= False;
end;

procedure TQrCtaChqAcr.qrFooterAcredAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
   qrSumaAcred.Reset;
end;

End.

