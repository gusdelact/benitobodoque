unit UnQRAcuTes;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,  StdCtrls,
     ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl, UnConDV;

type
  TQRAcuTes = class(TQuickRep)
    DetailBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    qAcuse: TQuery;
    ColumnHeaderBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    SummaryBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel6: TQRLabel;
    qAcuseCVE_MEDIO: TStringField;
    qAcuseID_TRANS_ORIGEN: TFloatField;
    qAcuseID_APUNTE: TFloatField;
    qAcuseCVE_DOCTO: TStringField;
    qAcuseCVE_OPERACION: TStringField;
    qAcuseCVE_OPE_ORIGEN: TStringField;
    qAcuseCVE_USUARIO: TStringField;
    qAcuseFH_OPERACION: TDateTimeField;
    qAcuseFH_REGISTRO: TDateTimeField;
    qAcuseF_LIQUIDACION: TDateTimeField;
    qAcuseID_COD_RESP: TFloatField;
    qAcuseID_CONTRATO: TFloatField;
    qAcuseID_GPO_TRANS: TFloatField;
    qAcuseIMP_TRANS: TFloatField;
    qAcuseNUM_CHEQUE: TFloatField;
    qAcuseNUM_TRANS_DET: TFloatField;
    qAcuseSDO_BLOQ_VIRT: TFloatField;
    qAcuseSDO_COMP_VIRT: TFloatField;
    qAcuseSDO_DEUD_VIRT: TFloatField;
    qAcuseSDO_DNC_VIRT: TFloatField;
    qAcuseSDO_EFE_VIRT: TFloatField;
    qAcuseSDO_PROM_VIRT: TFloatField;
    qAcuseSDO_REM_VIRT: TFloatField;
    qAcuseSDO_SBC_VIRT: TFloatField;
    qAcuseSIT_TRANS: TStringField;
    qAcuseTX_COMENTARIO: TMemoField;
    qAcuseTX_REFERENCIA: TStringField;
    qAcuseID_TRANS_DV: TFloatField;
    qAcuseID_ENTIDAD: TFloatField;
    qAcuseNOMBRE: TStringField;
    qAcuseDESC_L_ID_PRIM: TStringField;
    QRLabel3: TQRLabel;
    QRDBText5: TQRDBText;
    qrlDescProc: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRDBText6: TQRDBText;
  private

  public

  end;

var
  QRAcuTes: TQRAcuTes;

procedure EXECUTE_ACUSETESO(pPreview : Boolean;
                            pIdGpoTrans : Double;
                            pApli : TInterApli;
                            pBInterFin:Boolean;
                            pDescProceso:String);

implementation

{$R *.DFM}


procedure EXECUTE_ACUSETESO(pPreview : Boolean;
                            pIdGpoTrans : Double;
                            pApli : TInterApli;
                            pBInterFin:Boolean;
                            pDescProceso:String);
Var   QRAcuTes: TQRAcuTes;
begin QRAcuTes:=TQRAcuTes.Create(Nil);
      try QRAcuTes.QRInterEncabezado1.Apli:=pApli;
          if pBInterFin
          then begin
                 QRAcuTes.QRInterEncabezado1.Titulo1:='Aplicación de Ingresos y Egresos';
                 QRAcuTes.QRInterEncabezado1.Apli.IdEmpresa:=cEmpifs;
               end
          else begin
                 QRAcuTes.QRInterEncabezado1.Titulo1:='Aplicación de Ingresos y Egresos por SPEUA / SIAC';
                 QRAcuTes.QRInterEncabezado1.Apli.IdEmpresa:=cEmpBanco;
               end;
          QRAcuTes.qAcuse.DatabaseName:=pApli.DataBaseName;
          QRAcuTes.qAcuse.SessionName :=pApli.SessionName;
          QRAcuTes.qAcuse.ParamByName('ID_GPO_TRANS').AsFloat:=pIdGpoTrans;
          QRAcuTes.qAcuse.Open;
          QRAcuTes.qrlDescProc.Caption:=pDescProceso;
          if pPreview
          then QRAcuTes.Preview
          else QRAcuTes.Print;
      finally QRAcuTes.free;
      end;
end;






end.
