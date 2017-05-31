unit IntQrRepDetAdeudo;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead,
  InterApl, IntQRPreview, IntGenCre,UnSQL2;

type
  TQrRepDetAdeudo = class(TQuickRep)
    qyConsulta: TQuery;
    PageHeaderBand1: TQRBand;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRGroup1: TQRGroup;
    QRGroup2: TQRGroup;
    ColumnHeaderBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRShape4: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRShape5: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRGroup3: TQRGroup;
    QRBand1: TQRBand;
    QRExpr2: TQRExpr;
    QRLabel8: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText3: TQRDBText;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
  public
     Apli : TInterApli;
     Function FormaQuery(iIdSolicitud,iCredito: Integer): String;
  end;

var
  QrRepDetAdeudo: TQrRepDetAdeudo;

Procedure RepDetAdeudo(iIdSolicitud,iCredito:Integer;pAPli :TInterApli; pPreview  :Boolean);
Implementation
{$R *.DFM}

Procedure RepDetAdeudo(iIdSolicitud,iCredito:Integer;pAPli :TInterApli; pPreview  :Boolean);
Var
   QrRepDetAdeudo   : TQrRepDetAdeudo;
   Preview     : TIntQRPreview;
Begin
   QrRepDetAdeudo   := TQrRepDetAdeudo.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QrRepDetAdeudo);
   QrRepDetAdeudo.Apli := pAPli;
   Try
      QrRepDetAdeudo.qyConsulta.DatabaseName := pApli.DataBaseName;
      QrRepDetAdeudo.qyConsulta.SessionName := pApli.SessionName;
      QrRepDetAdeudo.qyConsulta.Active:=False;
      QrRepDetAdeudo.qyConsulta.SQL.Text:= QrRepDetAdeudo.FormaQuery(iIdSolicitud,iCredito);
      //QrRepDetAdeudo.qyConsulta.SQL.SaveToFile('C:\SQL.txt');
      QrRepDetAdeudo.qyConsulta.Active:=True;
      If pPreview Then
         QrRepDetAdeudo.Preview
      Else QrRepDetAdeudo.Print;
   Finally
      QrRepDetAdeudo.free;
      If Assigned(Preview) Then Preview.Free;
   End;
End;

Function TQrRepDetAdeudo.FormaQuery(iIdSolicitud, iCredito: Integer): String;
Var sSQL:String;
Begin
   sSQL:= ' SELECT ID_CREDITO, '                                                      + coCRLF +
          '        NUM_PERIODO,'                                                      + coCRLF +
          '        DECODE(CVE_ACCESORIO,''CP'',''CAPITAL'','                          + coCRLF +
          '                             ''IN'',''INTERES'','' '') AS CVE_ACCESORIO, ' + coCRLF +
          '        F_INI_TRAMO, '                                                     + coCRLF +
          '        F_FIN_TRAMO, '                                                     + coCRLF +
          '        PLAZO, '                                                           + coCRLF +
          '        TASA_APLICADA, '                                                   + coCRLF +
          '        IMP_ADEUDO, '                                                      + coCRLF +
          '        IMP_BASE_CALC, '                                                   + coCRLF +
          '        DECODE(SIT_ADEUDO,''PA'',''POR ACTIVAR'', '                        + coCRLF +
          '                          ''AC'',''ACTIVO'', '                             + coCRLF +
          '                          ''IM'',''IMPAGADO'')AS SIT_ADEUDO'               + coCRLF +
          '   FROM CR_CB_DET_ADEUDO AD '                                              + coCRLF +
          '  WHERE ID_SOLICITUD  = ' + IntToStr(iIdSolicitud)                         + coCRLF +
          '    AND CVE_TIPO_SOL  = ''SOLNAF'''                                        + coCRLF +
          '    AND ID_CREDITO    = ' + IntToStr(iCredito)                             + coCRLF +
          '    AND CVE_ACCESORIO = ''IN'''                                            + coCRLF +
          '  ORDER BY  ID_CREDITO, CVE_ACCESORIO, NUM_PERIODO, F_VENCIMIENTO ';
   Result:= sSQL;
End;


procedure TQrRepDetAdeudo.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   QRLabel11.Caption:='TOTAL POR '+ qyConsulta.FieldByName('CVE_ACCESORIO').AsString;
end;

End.

