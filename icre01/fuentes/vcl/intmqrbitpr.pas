unit IntMQrBitPr;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, Dialogs, IntGenCre, UnSQL2;
type
  TQrBitPr = class(TQuickRep)
    QyBit: TQuery;
    QRBand4: TQRBand;
    qrshpDiferencia: TQRShape;
    qrshpSaldoFinal: TQRShape;
    qrshpNombre: TQRShape;
    qrshpContrato: TQRShape;
    qrlblContrato: TQRLabel;
    qrlblNombre: TQRLabel;
    QRBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    QRDBText3: TQRDBText;
    QyBitID_BITACORA: TFloatField;
    QyBitCVE_USUARIO: TStringField;
    QyBitFH_REGISTRO: TDateTimeField;
    QyBitNOM_TABLA: TStringField;
    QyBitCAMPOSLLAVE: TStringField;
    QyBitDESC_MODIF: TMemoField;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel3: TQRLabel;
    QRExpr1: TQRExpr;
  private
  public
  end;

var
  QrBitPr: TQrBitPr;

Procedure RepBitacora(sSQLGenCons, sFInicio, sFFin, sNbrArch :String;
                          pAPli     : TInterApli;
                          pPreview  : Boolean);
Implementation
{$R *.DFM}

Procedure RepBitacora(sSQLGenCons, sFInicio, sFFin, sNbrArch :String;
                          pAPli     : TInterApli;
                          pPreview  : Boolean);
Var
    QrBit     : TQrBitPr;
    Preview     : TIntQRPreview;
Begin
    QrBit:=TQrBitPr.Create(Nil);
    Preview := TIntQRPreview.CreatePreview(Application, QrBit);
    Try
        QrBit.QyBit.DatabaseName := pApli.DataBaseName;
        QrBit.QyBit.SessionName := pApli.SessionName;

        QrBit.QyBit.Active:=False;
        QrBit.QyBit.SQL.Text:= (sSQLGenCons);

        QrBit.QRInterEncabezado1.Apli := pApli;

        if ( sFInicio <> '' ) then
        begin
            QrBit.QRInterEncabezado1.Titulo1:='Bitácora de Cambios Configuración Producto de Crédito';
            QrBit.QRInterEncabezado1.Titulo2:='del ' + sFInicio + ' al ' + sFFin;
        end
        else
        begin
            QrBit.QRInterEncabezado1.Titulo1:='Bitácora de Cambios Configuración Producto de Crédito';
            QrBit.QRInterEncabezado1.Titulo2:='';
        end;

//        QrBit.QyBit.sql.savetofile('C:\SQL.TXT');

        QrBit.QyBit.Active:=True;

        If QrBit.QyBit.IsEmpty Then
         ShowMessage('No hay datos que mostrar')
        Else
         Begin
            If pPreview Then
                QrBit.Preview
            Else
                QrBit.Print;
         End;

    Finally
        QrBit.free;
        If Assigned(Preview) Then Preview.Free;
    End;
End;


End.
