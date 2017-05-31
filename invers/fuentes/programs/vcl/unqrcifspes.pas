unit UnQRCIFSPes;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, InterApl;

type
  TQRCIFSPesos = class(TQuickRep)
    qPagares: TQuery;
    DetailBand1: TQRBand;
    qPagaresID_CONTRATO: TFloatField;
    qPagaresID_PAGARE: TFloatField;
    qPagaresB_IMPRESO: TStringField;
    qPagaresB_RENOVACION: TStringField;
    qPagaresCVE_IMP_RENOV: TStringField;
    qPagaresCVE_MET_ISR: TFloatField;
    qPagaresCVE_SIT_PAGARE: TStringField;
    qPagaresDIAS_PLAZO: TFloatField;
    qPagaresDIAS_PLAZO_RENOV: TFloatField;
    qPagaresFH_REGISTRO: TDateTimeField;
    qPagaresF_ALTA: TDateTimeField;
    qPagaresF_APERTURA: TDateTimeField;
    qPagaresF_VENCIMIENTO: TDateTimeField;
    qPagaresIMP_ACUM_INT: TFloatField;
    qPagaresIMP_ACUM_ISR: TFloatField;
    qPagaresIMP_CAPITAL: TFloatField;
    qPagaresIMP_INT_VTO: TFloatField;
    qPagaresIMP_ISR_VTO: TFloatField;
    qPagaresIMP_NETO_VTO: TFloatField;
    qPagaresIMP_RENOVAR: TFloatField;
    qPagaresIMP_VALUACION: TFloatField;
    qPagaresPCT_ISR: TFloatField;
    qPagaresTASA_BRUTA: TFloatField;
    qPagaresTASA_NETA: TFloatField;
    qPagaresTX_COM_PAG: TStringField;
    qPagaresTASA_COSTO: TFloatField;
    qPagaresCVE_USUARIO: TStringField;
    qPagaresTX_INST_CAJERO: TStringField;
    qPagaresID_EMPRESA: TFloatField;
    qPagaresID_SUCURSAL: TFloatField;
    qPagaresCVE_MEDIO: TStringField;
    qPagaresDIAS_PLAZO_ORI: TFloatField;
    qPagaresF_VENCTO_ORI: TDateTimeField;
    qPagaresTASA_BRUTA_ORI: TFloatField;
    qPagaresTASA_NETA_ORI: TFloatField;
    qPagaresCVE_ASIG_TASA: TStringField;
    qPagaresNOMBRE: TStringField;
    qPagaresCALLE_NUMERO: TStringField;
    qPagaresDOMIC1: TStringField;
    qPagaresDOMIC2: TStringField;
    QRShape1: TQRShape;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel2: TQRLabel;
    qPagaresAtencion: TStringField;
    QRLabel3: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape2: TQRShape;
    QRLabel7: TQRLabel;
    QRShape3: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRShape4: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    qrlAtencion: TQRLabel;
    QRDBText5: TQRDBText;
    qPagaresFOLIO_CARTA_CONF: TFloatField;
    QRLabel23: TQRLabel;
    QRLabel11: TQRLabel;
  private

  public

  end;

var
  QRCIFSPesos: TQRCIFSPesos;

PROCEDURE execute_conf_ifs_pesos(pPreview : Boolean;pApli : TInterApli; pIdContrato : Double; pIdPagare:Double;
                                 pAtencion : String);

implementation

{$R *.DFM}

PROCEDURE execute_conf_ifs_pesos(pPreview : Boolean;pApli : TInterApli; pIdContrato : Double; pIdPagare:Double;
                                 pAtencion : String);
Var   QRCIFSPesos: TQRCIFSPesos;
begin QRCIFSPesos:= TQRCIFSPesos.Create(Nil);
      try QRCIFSPesos.qPagares.DatabaseName:=pApli.DataBaseName;
          QRCIFSPesos.qPagares.SessionName :=pApli.SessionName;
          QRCIFSPesos.qPagares.ParamByName('Cto').AsFloat:=pIdContrato;
          QRCIFSPesos.qPagares.ParamByName('Pag').AsFloat:=pIdPagare;
          QRCIFSPesos.qPagares.Open;
          QRCIFSPesos.qrlAtencion.Caption:=pAtencion;
          if pPreview
          then QRCIFSPesos.Preview
          else QRCIFSPesos.Print;
      finally
       QRCIFSPesos.qPagares.Close;
       QRCIFSPesos.free;
      end;
end;

end.
