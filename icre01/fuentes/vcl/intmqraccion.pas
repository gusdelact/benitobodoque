unit IntMQrAccion;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, IntGenCre,UnSQL2;

type
  TQrAccion = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    qyConsulta: TQuery;
    QRBand1: TQRBand;
    QRBand4: TQRBand;
    QRLabel16: TQRLabel;
    QRBand5: TQRBand;
    QRLabel39: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel53: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRBand2: TQRBand;
    qyConsultaACREDITADO: TStringField;
    qyConsultaACCIONISTA: TStringField;
    qyConsultaPUESTO: TStringField;
    qyConsultaPCT_PARTICIPA: TFloatField;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRExpr2: TQRExpr;
    QRShape2: TQRShape;
    QRLabel2: TQRLabel;
    QRExpr1: TQRExpr;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
  private
  public
     Apli : TInterApli;
     Function LlenaEncabezado( sAcreditado,sAccionista :String) : String;
  end;

var
  QrAccion: TQrAccion;

Procedure EjecutarReporteAccionista( sAcreditado,sAccionista :String; pAPli : TInterApli; pPreview  : Boolean);
Implementation
{$R *.DFM}

Procedure EjecutarReporteAccionista( sAcreditado,sAccionista :String; pAPli : TInterApli; pPreview  : Boolean);
Var
    QrAccion   : TQrAccion;
    Preview     : TIntQRPreview;
Begin
      QrAccion   := TQrAccion.Create(Nil);
      Preview := TIntQRPreview.CreatePreview(Application, QrAccion);
      QrAccion.Apli := pAPli;
      Try

        QrAccion.QRInterEncabezado1.Apli:=pApli;
        QrAccion.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
        QrAccion.QRInterEncabezado1.NomReporte:='IntMQrAccion';

        QrAccion.QRInterEncabezado1.Titulo1:='Reporte de Integración Accionaria';

        QrAccion.qyConsulta.DatabaseName := pApli.DataBaseName;
        QrAccion.qyConsulta.SessionName := pApli.SessionName;

        QrAccion.qyConsulta.Active:=False;
        QrAccion.qyConsulta.SQL.Text:= QrAccion.LlenaEncabezado(sAcreditado, sAccionista);
        QrAccion.qyConsulta.Active:=True;

        If pPreview Then
            QrAccion.Preview
        Else
            QrAccion.Print;
    Finally
        QrAccion.free;
        If Assigned(Preview) Then Preview.Free;
    End;
End;

Function TQrAccion.LlenaEncabezado( sAcreditado,sAccionista :String) : String;
Var
    sSQL:String;
Begin
    sSQL:= ' SELECT (ACC.ID_ACREDITADO||''      ''||PER.NOMBRE) AS ACREDITADO , ' +
           '        (ACC.ID_ACCIONISTA||''      ''||ACC.NOMBRE) AS ACCIONISTA, ' +
           '        (ACC.CVE_PUESTO||''       ''||ACON.DESC_PUESTO) AS PUESTO, ACC.PCT_PARTICIPA ' +
           ' FROM CR_ACCIONISTA ACC, PERSONA PER, CR_ACRED_CONST ACON ' +
           ' WHERE ACC.ID_ACREDITADO = PER.ID_PERSONA ' +
           ' AND ACC.CVE_PUESTO  = ACON.CVE_PUESTO ';

    If (Trim(sAcreditado)<>'') Then
       sSQL:= sSQL + ' AND ACC.ID_ACREDITADO = '+ sAcreditado;
    If (Trim(sAccionista)<>'') Then
       sSQL:= sSQL + ' AND ACC.ID_ACCIONISTA = '+ sAccionista;

    sSQL:= sSQL + ' ORDER BY PER.NOMBRE, ACC.NOMBRE ';

    Result:= sSQL;
End;


End.

