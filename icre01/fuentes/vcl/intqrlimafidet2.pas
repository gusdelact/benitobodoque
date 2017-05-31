unit IntQrLiMaFiDet2;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview,QRPrntr, Printers, IntGenCre, UnSQL2;

type
  TQrLiMaxFiDet2 = class(TQuickRep)
    qyQuery: TQuery;
    qyQueryNOMBRE: TStringField;
    QrGpoAutoriazcion: TQRGroup;
    GpoCredito: TQRGroup;
    QRBand2: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    QRBand3: TQRBand;
    s1DatosAcred: TQRShape;
    QRLTITULO: TQRLabel;
    QRBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
    qyQuerySDO_INSOLUTO: TFloatField;
    QRDBText2: TQRDBText;
    QRExpr1: TQRExpr;
    QRShape26: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText3: TQRDBText;
    qyQueryDESC_GRUPO: TStringField;
    qyQuerySECTOR: TStringField;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape1: TQRShape;
    QRLabel3: TQRLabel;
    QRDBText4: TQRDBText;
    qrlSIN_LIMITE: TQRLabel;
    qrlLIMITE_100: TQRLabel;
    qrlLIMITE: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public
    Function FormaQuery(sFecha, sEmpresa, sRegMax, sExSector: String ): String;
  end;

var
  Apli : TInterApli;
  QrLiMaxFiDet2: TQrLiMaxFiDet2;
  sArchivo:String;
  sCapBas :String;
  F: TextFile;

Procedure RepLiMaxFinDet2( sFecha, sCap_Basico, sIndice, sRegMax, sExSector, sEmpresa, sSucursal: String;
                           pAPli : TInterApli; pPreview : Boolean);
Implementation
{$R *.DFM}

Procedure RepLiMaxFinDet2( sFecha, sCap_Basico, sIndice, sRegMax, sExSector, sEmpresa, sSucursal: String;
                           pAPli : TInterApli; pPreview : Boolean);
Var
    QrLiMxFiDet2 : TQrLiMaxFiDet2;
    Preview     : TIntQRPreview;
    vlFTrim     : String;
Begin

    QrLiMxFiDet2 := TQrLiMaxFiDet2.Create(Nil);
    Preview     := TIntQRPreview.CreatePreview(Application, QrLiMxFiDet2);
    Apli        := pAPli;
    sCapBas     := sCap_Basico;

    Try
        //ENCABEZADO 1      1027371.7
        QrLiMxFiDet2.QRInterEncabezado1.Apli:=pApli;
        QrLiMxFiDet2.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
        QrLiMxFiDet2.QRInterEncabezado1.NomReporte:='IntQrLiMaxFi';
        QrLiMxFiDet2.QRInterEncabezado1.Titulo1:='Límite Máximo de Financiamiento';
        QrLiMxFiDet2.QRInterEncabezado1.Titulo2:='';
        QrLiMxFiDet2.QRLTITULO.Caption := 'Sumatoria de los ' + sRegMax + ' mayores clientes (cifras en pesos) al ' +
                                          sFecha ;

        QrLiMxFiDet2.qyQuery.DatabaseName := pApli.DataBaseName;
        QrLiMxFiDet2.qyQuery.SessionName := pApli.SessionName;
        QrLiMxFiDet2.qyQuery.Active:=False;
        QrLiMxFiDet2.qyQuery.SQL.Text:= QrLiMxFiDet2.FormaQuery( sFecha, sEmpresa, sRegMax, sExSector );
        QrLiMxFiDet2.qyQuery.SQL.SaveToFile('c:\QrLiMxFiDet2.txt');
        QrLiMxFiDet2.qyQuery.Active:=True;

        If pPreview Then
            QrLiMxFiDet2.Preview
        Else
            QrLiMxFiDet2.Print;

    Finally
        QrLiMxFiDet2.free;
    End;
End;

{ TQrLiMaxFiDet }

function TQrLiMaxFiDet2.FormaQuery(sFecha, sEmpresa, sRegMax, sExSector: String): String;
Var
   sSQL :String;
begin
   sSQL := ' SELECT DESC_GRUPO, NOMBRE, SDO_INSOLUTO, SECTOR '+ coCRLF +
           ' FROM ( ' + FormaQueryLimFin( StrToDateTime(sFecha), sEmpresa, sRegMax, sExSector) + ' ) '+ coCRLF;
   Result:= sSQL;
end;

procedure TQrLiMaxFiDet2.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   IF ( qyQuery.FieldByName('SECTOR').AsInteger = 11) OR (qyQuery.FieldByName('SECTOR').AsInteger = 13) THEN BEGIN
      qrlSIN_LIMITE.Caption := FormatFloat('###,###,###,###,##0',(qyQuery.FieldByName('SDO_INSOLUTO').AsFloat));
      qrlLIMITE_100.Caption := '';
      qrlLIMITE.Caption     := '';
   END
   ELSE IF ( qyQuery.FieldByName('SECTOR').AsInteger = 14) OR (qyQuery.FieldByName('SECTOR').AsInteger = 25) OR (qyQuery.FieldByName('SECTOR').AsInteger = 26) THEN BEGIN
      qrlSIN_LIMITE.Caption := '';
      qrlLIMITE_100.Caption := FormatFloat('###,###,###,###,##0',(qyQuery.FieldByName('SDO_INSOLUTO').AsFloat));
      qrlLIMITE.Caption     := '';
   END
   ELSE BEGIN
      qrlSIN_LIMITE.Caption := '';
      qrlLIMITE_100.Caption := '';
      qrlLIMITE.Caption     := FormatFloat('###,###,###,###,##0',(qyQuery.FieldByName('SDO_INSOLUTO').AsFloat));
   END;

end;

End.
