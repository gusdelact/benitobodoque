unit UnQRCBDL2;

// CONFIRMACION DE OPERACIONES CLEINTES NORMALES

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
     StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, InterApl;

type
  TQRCBDL2 = class(TQuickRep)
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
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape2: TQRShape;
    QRLabel7: TQRLabel;
    QRShape3: TQRShape;
    QRLabel9: TQRLabel;
    QRShape4: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRImage1: TQRImage;
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
    QRLabel23: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText5: TQRDBText;
    qPagaresNumReferencia: TStringField;
    QRLabel24: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel29: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel27: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRShape5: TQRShape;
    qPagaresDESC_PRODUCTO: TStringField;
    QRDBText18: TQRDBText;
    procedure qPagaresCalcFields(DataSet: TDataSet);
  private

  public

  end;

var
  QRCBDL2: TQRCBDL2;

PROCEDURE execute_conf_BDlsCtes(pPreview : Boolean;pApli : TInterApli; pIdContrato : Double; pIdPagare:Double;
                                pAtencion : String);

implementation

{$R *.DFM}

PROCEDURE execute_conf_BDlsCtes(pPreview : Boolean;pApli : TInterApli; pIdContrato : Double; pIdPagare:Double;
                             pAtencion : String);
Var   QRCBDL2 : TQRCBDL2;
begin QRCBDL2:= TQRCBDL2.Create(Nil);
      try QRCBDL2.qPagares.DatabaseName:=pApli.DataBaseName;
          QRCBDL2.qPagares.SessionName :=pApli.SessionName;
          QRCBDL2.qPagares.ParamByName('Cto').AsFloat:=pIdContrato;
          QRCBDL2.qPagares.ParamByName('Pag').AsFloat:=pIdPagare;
          QRCBDL2.qPagares.Open;
          QRCBDL2.qrlAtencion.Caption:=pAtencion;
          if pPreview
          then QRCBDL2.Preview
          else QRCBDL2.Print;
      finally
       QRCBDL2.qPagares.Close;
       QRCBDL2.free;
      end;
end;

procedure TQRCBDL2.qPagaresCalcFields(DataSet: TDataSet);
begin Dataset.FieldByName('NumReferencia').AsString:=Dataset.FieldByName('ID_PAGARE').AsString + '/' + FormatDateTime('YYYYMMDD',Dataset.FieldByName('F_APERTURA').AsDateTime);
end;

end.
