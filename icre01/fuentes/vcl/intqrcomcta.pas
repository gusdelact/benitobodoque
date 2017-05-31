unit IntQrComCta;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls,  IntQRPreview,QRExport,
  IntHead, Db, DBTables,InterApl,Dialogs;

type
  TQrComCta = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    qry: TQuery;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRGroup1: TQRGroup;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    qryCVE_PRODUCTO: TStringField;
    qryCVE_CTA_CONTABLE: TStringField;
    qryTIPO_AFECTACION: TStringField;
    qryIMP_MOVIMIENTO: TFloatField;
    qryNOMBRE: TStringField;
    QRLabel11: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel12: TQRLabel;
    QRExpr1: TQRExpr;
    qryID_ACREDITADO: TFloatField;
    qryID_CREDITO: TFloatField;
    qryCVE_MONEDA: TFloatField;
    qryID_POLIZA: TFloatField;
    QRDBText1: TQRDBText;
    qryF_OPERACION: TDateTimeField;
    SaveDialog1: TSaveDialog;
    procedure ColumnHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DetailBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private

  public

  end;

var
  QrComCta: TQrComCta;
  vllista: TStringList;
  vlNomArch,vlLinea,vlSepara: string;
  Procedure   RepComisContables(peF_Inicial,peF_Final,peCuentas: string ;Objeto:TInterApli ;bPreview:Boolean);
implementation
{$R *.DFM}

Procedure RepComisContables(peF_Inicial,peF_Final,peCuentas: string ;Objeto:TInterApli ;bPreview:Boolean);
var
   QrComCta : TQrComCta;
   Preview  : TIntQRPreview;
begin
  QrComCta:=TQrComCta.Create(Nil);
  Preview := TIntQRPreview.CreatePreview(Application, QrComCta);
  vllista:= TStringList.Create;
  try

      vlNomArch :='C:\Rpt_Comis.csv';
      vlSepara:=';';
      QrComCta.QRInterEncabezado1.Apli:=Objeto;
      QrComCta.QRInterEncabezado1.IdEmpresa:= Objeto.IdEmpresa;
      QrComCta.QRInterEncabezado1.NomReporte:= 'IntMQrComCta';
      QrComCta.QRInterEncabezado1.Titulo1:='Reporte de Comisiones Contables';
      QrComCta.QRInterEncabezado1.Titulo2:='Periodo del '''+peF_Inicial+''' al '''+peF_Final+'''';
      QrComCta.qry.DatabaseName := Objeto.DataBaseName;
      QrComCta.qry.SessionName := Objeto.SessionName;
      QrComCta.qry.Active:=False;
      QrComCta.qry.SQL.Text:=

      'SELECT    TRA.F_OPERACION,       '+
      '          DET.ID_ACREDITADO,     '+
      '          P.NOMBRE,              '+
      '          DET.CVE_PRODUCTO,      '+
      '          DET.CVE_MONEDA,        '+
      '          DET.ID_CREDITO,        '+
      '          DET.CVE_CTA_CONTABLE,  '+
      '          DET.TIPO_AFECTACION,   '+
      '          DET.IMP_MOVIMIENTO,    '+
      '          DET.ID_POLIZA          '+
      '  FROM                           '+
      '          (SELECT * FROM  CR_CONT_GEN_TR_D ) DET,        '+
      '          (SELECT * FROM  CR_CONT_GEN_TRAN)  TRA,        '+
      '          PERSONA P                                      '+
      '  WHERE   DET.FOL_GENERACION = TRA.FOL_GENERACION        '+
      '    AND   TRA.F_OPERACION BETWEEN TO_DATE('''+ peF_Inicial+''',''DD/MM/YYYY'')   '+
      '                              AND TO_DATE('''+ peF_Final  +''',''DD/MM/YYYY'')   '+
      '    AND   CVE_CTA_CONTABLE IN ('+peCuentas+') '+
      '    AND   DET.SIT_MOVIMIENTO = ''DER''   '+
      '    AND   P.ID_PERSONA = DET.ID_ACREDITADO       '+
      '  ORDER BY DET.CVE_CTA_CONTABLE      ' ;

      QrComCta.qry.Active:=False;
      QrComCta.qry.Active:=True;

        If bPreview Then
            QrComCta.Preview
        Else
            QrComCta.Print;
    Finally
      begin
        vllista.SaveToFile(vlNomArch);
        ShowMessage('Archivo Generado');
        QrComCta.free;
      end;
    End;

end;


procedure TQrComCta.ColumnHeaderBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   vlLinea:=QRLabel1.Caption+vlSepara+
            QRLabel2.Caption+vlSepara+
            QRLabel3.Caption+vlSepara+
            QRLabel4.Caption+vlSepara+
            QRLabel5.Caption+vlSepara+
            QRLabel6.Caption+vlSepara+
            QRLabel7.Caption+vlSepara+
            QRLabel8.Caption+vlSepara+
            QRLabel9.Caption+vlSepara+
            QRLabel10.Caption+vlSepara;

   vllista.Add(vlLinea);

end;

procedure TQrComCta.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
        vlLinea:=QRLabel11.Caption+vlSepara+qryCVE_CTA_CONTABLE.AsString+vlSepara;
        vllista.Add(vlLinea);
end;

procedure TQrComCta.DetailBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  vlLinea:=qryF_OPERACION.AsString+vlSepara+
           qryID_ACREDITADO.AsString+vlSepara+
           qryNOMBRE.AsString+vlSepara+
           qryCVE_PRODUCTO.AsString+vlSepara+
           qryCVE_MONEDA.AsString+vlSepara+
           qryID_CREDITO.AsString+vlSepara+
           qryCVE_CTA_CONTABLE.AsString+vlSepara+
           qryTIPO_AFECTACION.AsString+vlSepara+
           qryIMP_MOVIMIENTO.AsString+vlSepara+
           qryID_POLIZA.AsString+vlSepara;
   vllista.Add(vlLinea);           
end;

procedure TQrComCta.QRBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  vlLinea:=vlSepara+vlSepara+vlSepara+
           vlSepara+vlSepara+vlSepara+
           vlSepara+QRLabel12.Caption+
           vlSepara+QRExpr1.Value.strResult+vlSepara;
  vllista.Add(vlLinea);
end;

end.
