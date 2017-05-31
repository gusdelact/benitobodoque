unit IntQrLiMaxFiDet;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview,QRPrntr, Printers, IntGenCre, UnSQL2;

type
  TQrLiMaxFiDet = class(TQuickRep)
    qyQuery: TQuery;
    qyQueryNOMBRE: TStringField;
    QrGpoAutoriazcion: TQRGroup;
    GpoCredito: TQRGroup;
    QRBand2: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    QRBand3: TQRBand;
    s1DatosAcred: TQRShape;
    QRLabel3: TQRLabel;
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
  private

  public
    Function FormaQuery(sFecha, sEmpresa, sRegMin, sExSector: String ): String;
  end;

var
  Apli : TInterApli;
  QrLiMaxFiDet: TQrLiMaxFiDet;
  sArchivo:String;
  sCapBas :String;
  F: TextFile;

Procedure RepLiMaxFinDet( sFecha, sCap_Basico, sIndice, sRegMin, sExSector, sEmpresa, sSucursal: String;
                           pAPli : TInterApli; pPreview : Boolean);
Implementation
{$R *.DFM}

Procedure RepLiMaxFinDet( sFecha, sCap_Basico, sIndice, sRegMin, sExSector, sEmpresa, sSucursal: String;
                           pAPli : TInterApli; pPreview : Boolean);
Var
    QrLiMxFiDet : TQrLiMaxFiDet;
    Preview     : TIntQRPreview;
    vlFTrim     : String;
Begin

    QrLiMxFiDet := TQrLiMaxFiDet.Create(Nil);
    Preview     := TIntQRPreview.CreatePreview(Application, QrLiMxFiDet);
    Apli        := pAPli;
    sCapBas     := sCap_Basico;

    Try
        //ENCABEZADO 1      1027371.7
        QrLiMxFiDet.QRInterEncabezado1.Apli:=pApli;
        QrLiMxFiDet.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
        QrLiMxFiDet.QRInterEncabezado1.NomReporte:='IntQrLiMaxFi';
        QrLiMxFiDet.QRInterEncabezado1.Titulo1:='Límite Máximo de Financiamiento';
        QrLiMxFiDet.QRInterEncabezado1.Titulo2:='';
        QrLiMxFiDet.QRLTITULO.Caption := 'Sumatoria de los ' + sRegMin + ' mayores clientes (cifras en pesos) al '+
                                         sFecha;

        QrLiMxFiDet.qyQuery.DatabaseName := pApli.DataBaseName;
        QrLiMxFiDet.qyQuery.SessionName := pApli.SessionName;
        QrLiMxFiDet.qyQuery.Active:=False;
        QrLiMxFiDet.qyQuery.SQL.Text:= QrLiMxFiDet.FormaQuery( sFecha, sEmpresa, sRegMin, sExSector );
        QrLiMxFiDet.qyQuery.SQL.SaveToFile('c:\QrLiMxFiDet.txt');
        QrLiMxFiDet.qyQuery.Active:=True;

        If pPreview Then
            QrLiMxFiDet.Preview
        Else
            QrLiMxFiDet.Print;

    Finally
        QrLiMxFiDet.free;
    End;
End;

{ TQrLiMaxFiDet }

function TQrLiMaxFiDet.FormaQuery(sFecha, sEmpresa, sRegMin, sExSector: String): String;
Var
   sSQL :String;
begin
   sSQL := ' SELECT DESC_GRUPO, NOMBRE, SDO_INSOLUTO'+ coCRLF +
           ' FROM ( ' + FormaQueryLimFin( StrToDateTime(sFecha), sEmpresa, sRegMin, sExSector) + ' ) '+ coCRLF;
   Result:= sSQL;
end;

End.
