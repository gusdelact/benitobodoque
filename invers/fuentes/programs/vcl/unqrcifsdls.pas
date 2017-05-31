unit UnQRCIFSDls;

// confirmacion de operaciones Interfinancial
// Marcos Zárate Castro
// formato nuevo
// 22/feb/2001


interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, InterApl,
  U_InterCustomStar, U_InterDigDoc, UnConInv, Dialogs;


type
  TQRCIFSDls = class(TQuickRep)
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
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    qPagaresFOLIO_CARTA_CONF: TFloatField;
    QRDBText5: TQRDBText;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    InterDigDoc1: TInterDigDoc;
  private

  public

  end;

var
  QRCIFSDls: TQRCIFSDls;

PROCEDURE execute_conf_ifs_dlls(pPreview : Boolean;pApli : TInterApli; pIdContrato : Double; pIdPagare:Double;
                                 pAtencion : String; pBMail : Boolean; pNomArchivo : String; pHost:String; pEOrigen : String; pEMailDest : String);

implementation

{$R *.DFM}

PROCEDURE execute_conf_ifs_dlls(pPreview : Boolean;pApli : TInterApli; pIdContrato : Double; pIdPagare:Double;
                                 pAtencion : String; pBMail : Boolean; pNomArchivo : String; pHost:String; pEOrigen : String; pEMailDest : String);
Var   QRCIFSDls: TQRCIFSDls;
begin QRCIFSDls := TQRCIFSDls.Create(Nil);
      try QRCIFSDls.qPagares.DatabaseName:=pApli.DataBaseName;
          QRCIFSDls.qPagares.SessionName :=pApli.SessionName;
          QRCIFSDls.qPagares.ParamByName('Cto').AsFloat:=pIdContrato;
          QRCIFSDls.qPagares.ParamByName('Pag').AsFloat:=pIdPagare;
          QRCIFSDls.qPagares.Open;
          QRCIFSDls.qrlAtencion.Caption:=pAtencion;

          if pBMail then
          begin
            QRCIFSDls.PrinterSettings.PrinterIndex:=QRCIFSDls.InterDigDoc1.SetPrinter;
            QRCIFSDls.InterDigDoc1.FileName:=pNomArchivo;
          end;

          if pPreview
          then QRCIFSDls.Preview
          else QRCIFSDls.Print;

          //Ya digitalizado el archivo, se envia por e-mail
          if pBMail then
          begin
              if Not EnviaMail(pHost,pEOrigen, 'Confirmacion de operacion Contrato ' + FloatToStr(pIdContrato), pEMailDest,'Confirmación de operación',pNomArchivo)
              then Showmessage('Problemas para enviar correo')
              else Showmessage('Correo enviado correctamente');
          end;

      finally
       QRCIFSDls.qPagares.Close;
       QRCIFSDls.free;
      end;
end;

end.
