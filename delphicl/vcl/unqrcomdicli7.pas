unit UnQrComDiCli7;
//Modificado    :   MARA4356 FEBRERO 2006 SE AGREGA IMPRESORA
//                  MARA4356 FEB 2007 SE MODIFICA PARA IMPRIMIR SOLO CLIENTE Y OOPERACION
//              :   EIB2AARJ 23 nov 2010 Modificaciones para presentar los datos de sellado electrónico

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, InterApl;

type
  TQrComDiCli7 = class(TQuickRep)
    DetailBand1: TQRBand;
    qContrato: TQuery;
    qOperacion: TQuery;
    qOperacionID_CONTRATO: TFloatField;
    qOperacionF_OPERACION: TDateTimeField;
    qOperacionF_LIQUIDACION: TDateTimeField;
    qOperacionCVE_MONEDA: TFloatField;
    qOperacionCVE_OPERACION: TStringField;
    qOperacionIMP_TRANS_MN: TFloatField;
    qOperacionIMP_TRANS_PROD: TFloatField;
    qOperacionTC_OPERACION: TFloatField;
    qOperacionTX_COMENTARIO: TStringField;
    qOperacionDESC_BENEF: TStringField;
    qOperacionCTA_BENEFICIARIO: TStringField;
    qOperacionNOMBRE_BCO_BENEF: TStringField;
    qOperacionABA: TStringField;
    qOperacionDESCOPER: TStringField;
    qOperacionDESCPROD: TStringField;
    qOperacionDESC_MONEDA: TStringField;
    qOperacionCVE_PRODUCTO: TStringField;
    qLiquidacion: TQuery;
    qLiquidacionID_CONTRATO: TFloatField;
    qLiquidacionF_OPERACION: TDateTimeField;
    qLiquidacionCVE_PRODUCTO: TStringField;
    qLiquidacionID_GPO_TRANS: TFloatField;
    qLiquidacionF_LIQUIDACION: TDateTimeField;
    qLiquidacionCVE_MONEDA: TFloatField;
    qLiquidacionCVE_OPERACION: TStringField;
    qLiquidacionIMP_TRANS_MN: TFloatField;
    qLiquidacionIMP_TRANS_PROD: TFloatField;
    qLiquidacionTC_OPERACION: TFloatField;
    qLiquidacionTX_COMENTARIO: TStringField;
    qLiquidacionDESCPROD: TStringField;
    qLiquidacionDESCOPER: TStringField;
    GroupHeaderBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    DOMIC2: TQRDBText;
    DOMIC4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    GroupFooterBand1: TQRBand;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    GroupFooterBand2: TQRBand;
    qContratoID_CONTRATO: TFloatField;
    qContratoID_CLIENTE: TFloatField;
    qContratoNOMBRE_CLIENTE: TStringField;
    qContratoCVE_MONEDA_BASE: TFloatField;
    qContratoF_OPERACION: TDateTimeField;
    qContratoF_LIQUIDACION: TDateTimeField;
    qContratoSIT_CONTRATO: TStringField;
    qContratoTX_COMENTARIO: TStringField;
    qContratoID_PERSONA: TFloatField;
    qContratoB_IMPR_DOMIC: TStringField;
    qOperacionOper: TStringField;
    qOperacionProd: TStringField;
    qOperacionImpProd: TFloatField;
    qLiquidacionOper: TStringField;
    qLiquidacionProd: TStringField;
    qLiquidacionImpProd: TFloatField;
    qContratoComentario: TStringField;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRShape5: TQRShape;
    QRLabel7: TQRLabel;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRLabel11: TQRLabel;
    QRShape8: TQRShape;
    QRLabel12: TQRLabel;
    QRShape9: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    GroupHeaderBand3: TQRBand;
    QRShape3: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape11: TQRShape;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape12: TQRShape;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape13: TQRShape;
    QRShape2: TQRShape;
    QRBand1: TQRBand;
    QRShape4: TQRShape;
    QRShape10: TQRShape;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRShape14: TQRShape;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape15: TQRShape;
    QRLabel22: TQRLabel;
    QRShape16: TQRShape;
    QRLabel23: TQRLabel;
    QRShape17: TQRShape;
    QRLabel24: TQRLabel;
    QRShape18: TQRShape;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRBand2: TQRBand;
    QRExpr3: TQRExpr;
    QRLabel27: TQRLabel;
    QRBand3: TQRBand;
    QRShape19: TQRShape;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRBand4: TQRBand;
    QRExpr4: TQRExpr;
    QRLabel30: TQRLabel;
    QRShape20: TQRShape;
    QRDBText36: TQRDBText;
    QRShape21: TQRShape;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRShape22: TQRShape;
    DOMIC1: TQRDBText;
    QRDBText3: TQRDBText;
    DOMIC5: TQRDBText;
    DOMIC6: TQRDBText;
    DOMIC8: TQRDBText;
    QrlCopia1: TQRLabel;
    QrlCopia2: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    qContratoRFCT: TStringField;
    DOMIC4B: TQRDBText;
    DOMIC4A: TQRLabel;
    DOMIC4C: TQRLabel;
    DOMIC4D: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText19: TQRDBText;
    qContratoNOMBRE_RAZON: TStringField;
    qContratoFEC_NAC: TDateTimeField;
    qContratoRFC: TStringField;
    qContratoNO_IFE: TStringField;
    qContratoCALLE: TStringField;
    qContratoCOLONIA: TStringField;
    qContratoCOD_POSTAL: TFloatField;
    qContratoSERIE: TStringField;
    qContratoFOLIO: TStringField;
    qContratoSELLO: TStringField;
    qContratoCADENA: TBlobField;
    QRLabelFolio: TQRLabel;
    QRDBSerie: TQRDBText;
    QRDBFolio: TQRDBText;
    QRLabelSello: TQRLabel;
    QRLabSelloP1: TQRLabel;
    QRLabSelloP2: TQRLabel;
    QRLabelCadena: TQRLabel;
    QRLabCadenaP1: TQRLabel;
    QRLabCadenaP2: TQRLabel;
    QRLabCadenaP3: TQRLabel;
    QRLabCadenaP4: TQRLabel;
    QRLabCadenaP5: TQRLabel;
    QRLabelFolioCopia: TQRLabel;
    QRDBSerieCopia: TQRDBText;
    QRDBFolioCopia: TQRDBText;
    QRLabelSelloCopia: TQRLabel;
    QRLabSelloP1Copia: TQRLabel;
    QRLabSelloP2Copia: TQRLabel;
    QRLabelCadenaCopia: TQRLabel;
    QRLabCadenaP1Copia: TQRLabel;
    QRLabCadenaP2Copia: TQRLabel;
    QRLabCadenaP3Copia: TQRLabel;
    QRLabCadenaP4Copia: TQRLabel;
    QRLabCadenaP5Copia: TQRLabel;
    QRLabCadenaP6Copia: TQRLabel;
    QRLabCadenaP7Copia: TQRLabel;
    QRLabCadenaP6: TQRLabel;
    QRLabCadenaP7: TQRLabel;
    QRLabelPagoExhib: TQRLabel;
    QRLabelPagoExhibCopia: TQRLabel;
    QRLabelLeyenda: TQRLabel;
    QRLabelAnioAprob: TQRLabel;
    QRLabelNumAprob: TQRLabel;
    QRLabelNumCert: TQRLabel;
    QRDBNumCert: TQRDBText;
    qContratoANO_APROBACION: TStringField;
    qContratoNUM_APROBACION: TStringField;
    QRDBAnioAprob: TQRDBText;
    QRDBNumAprob: TQRDBText;
    QRLabelNumCertCopia: TQRLabel;
    QRDBNumCertCopia: TQRDBText;
    QRLabelAnioAprobCopia: TQRLabel;
    QRDBAnioAprobCopia: TQRDBText;
    QRLabelNumAprobCopia: TQRLabel;
    QRDBNumAprobCopia: TQRDBText;
    QRLabelLeyendaCopia: TQRLabel;
    QRLabelFecCreacion: TQRLabel;
    QRDBFecCreacion: TQRDBText;
    QRLabelFecCreacionCopia: TQRLabel;
    QRDBFecCreacionCopia: TQRDBText;
    qContratoFECHA_CREACION: TStringField;
    qContratoCERTIFICADO: TStringField;
    QRSdSeparador: TQRSubDetail;
    QRSubDetail1: TQRSubDetail;
    QRSubDetail2: TQRSubDetail;
    QRSubDetail3: TQRSubDetail;
    QRSubDetail4: TQRSubDetail;
    QRSubDetalleLiq: TQRSubDetail;
    QRSubDetalleOper: TQRSubDetail;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    qContratoTIPO_CAMBIOS: TFloatField;
    qContratoMETODO_PAGO: TStringField;
    qContratoDESC_MONEDA: TStringField;
    qContratoCUENTA: TStringField;
    qContratoREGIMEN: TStringField;
    qContratoNOM_PAIS_EX: TStringField;
    qContratoNOM_ESTADO_EX: TStringField;
    QRDBTipoCambio: TQRDBText;
    QRDBTipoCambi: TQRDBText;
    QRLabel46: TQRLabel;
    QRLabel53: TQRLabel;
    procedure qOperacionCalcFields(DataSet: TDataSet);
    procedure qLiquidacionCalcFields(DataSet: TDataSet);
    procedure qContratoCalcFields(DataSet: TDataSet);
    procedure QRSubDetail3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  QrComDiCli7: TQrComDiCli7;
  Band1, Band2 : Boolean;

FUNCTION Execute_ImpCompDivCli7(pApli          : TInterApli;
                            pQContrato     : TQuery;
                            pQOperacion    : TQuery;
                            pQLiquidacion  : TQuery;
                            pPrinterIndex  : Integer;
                            pPrinterIndex2 : Integer;
                            pPrinterIndex3 : Integer;
                            pPrinterIndex4 : Integer):Boolean;

implementation

{$R *.DFM}

FUNCTION Execute_ImpCompDivCli7(pApli          : TInterApli;
                            pQContrato     : TQuery;
                            pQOperacion    : TQuery;
                            pQLiquidacion  : TQuery;
                            pPrinterIndex  : Integer;
                            pPrinterIndex2 : Integer;
                            pPrinterIndex3 : Integer;
                            pPrinterIndex4 : Integer):Boolean;
Var
     QrComDiCli7: TQrComDiCli7;
     vlNumRegs : Integer;
     vlImprime : Boolean;
begin
      QrComDiCli7 := TQrComDiCli7.Create(Nil);
      Band1:=True;
      Band2:=True;
      Execute_ImpCompDivCli7:=False;
      try
         QrComDiCli7.qContrato.DatabaseName :=pApli.DataBaseName;
         QrComDiCli7.qContrato.SessionName  :=pApli.SessionName;
         QrComDiCli7.qContrato.sql.Text:=pqContrato.SQL.Text;
         QrComDiCli7.qContrato.Open;

         QrComDiCli7.qOperacion.DatabaseName:=pApli.DataBaseName;
         QrComDiCli7.qOperacion.SessionName :=pApli.SessionName;
         QrComDiCli7.qOperacion.sql.Text:=pqOperacion.SQL.Text;
         QrComDiCli7.qOperacion.Open;

         QrComDiCli7.qLiquidacion.DatabaseName:=pApli.DataBaseName;
         QrComDiCli7.qLiquidacion.SessionName :=pApli.SessionName;
         QrComDiCli7.qLiquidacion.sql.Text:=pqLiquidacion.SQL.Text;
         QrComDiCli7.qLiquidacion.Open;

         vlNumRegs:=QrComDiCli7.qOperacion.RecordCount + QrComDiCli7.qLiquidacion.RecordCount;
         vlNumRegs:=vlNumRegs-2;
         //EIB2AARJ: 08/12/2010 QrComDiCli7.QRSdSeparador.Height:=QrComDiCli7.QRSdSeparador.Height - (QrComDiCli7.QRSubDetalleOper.Height * vlNumRegs);
         QrComDiCli7.QRSdSeparador.Height:=QrComDiCli7.QRSdSeparador.Height - (QrComDiCli7.QRSubDetalleOper.Height * vlNumRegs) + (33 - (vlNumRegs*11));

         vlImprime :=(QrComDiCli7.qContrato.FieldByName('B_IMPR_DOMIC').AsString = 'V');
         QrComDiCli7.DOMIC1.Enabled:=vlImprime;
         QrComDiCli7.DOMIC2.Enabled:=vlImprime;
         //QrComDiCli7.DOMIC3.Enabled:=vlImprime;
         QrComDiCli7.DOMIC4.Enabled:=vlImprime;
         QrComDiCli7.DOMIC5.Enabled:=vlImprime;
         QrComDiCli7.DOMIC6.Enabled:=vlImprime;
         //QrComDiCli7.DOMIC7.Enabled:=vlImprime;
         QrComDiCli7.DOMIC8.Enabled:=vlImprime;

         //JUNIO DEL 2002. M.ZARATE. Se agrega el campo de RFC.
         { // EIB3AARJ 30 NOV 2010 :     Se solicita que se imprima forzosamente el RFC
         QrComDiCli7.DOMIC4A.Enabled:=vlImprime;
         QrComDiCli7.DOMIC4B.Enabled:=vlImprime;
         QrComDiCli7.DOMIC4C.Enabled:=vlImprime;
         QrComDiCli7.DOMIC4D.Enabled:=vlImprime;
         }

         // EIB2AARJ : 17 DIC 2010 INICIO
         if not(QrComDiCli7.qContrato.FieldByName('SELLO').IsNull) then
           begin
             QrComDiCli7.QRLabel9.Enabled := False;
             QrComDiCli7.QRLabel26.Enabled := False;
           end
         else
           begin
             QrComDiCli7.QRLabel9.Enabled := True;
             QrComDiCli7.QRLabel26.Enabled := True;
           end;
         // EIB2AARJ : 17 DIC 2010 FIN


         if (pPrinterIndex <> -1) and (pPrinterIndex2 <> -1) then
         begin
            if pPrinterIndex = pPrinterIndex2 then
            begin
               QrComDiCli7.PrinterSettings.PrinterIndex:=pPrinterIndex;
               QrComDiCli7.GroupHeaderBand2.Enabled:=True;            QrComDiCli7.QRSubDetalleOper.Enabled:=True;
               QrComDiCli7.GroupFooterBand1.Enabled:=True;            QrComDiCli7.GroupHeaderBand3.Enabled:=True;
               QrComDiCli7.QRSubDetalleLiq.Enabled :=True;            QrComDiCli7.GroupFooterBand2.Enabled:=True;
               QrComDiCli7.QRSubDetail3.Enabled    :=True;            QrComDiCli7.QRSdSeparador.Enabled   :=True;

               QrComDiCli7.QRBAND1.Enabled         :=True;            QrComDiCli7.QrSubDetail1.Enabled    :=True;
               QrComDiCli7.QRBand2.Enabled         :=True;            QrComDiCli7.QRBand3.Enabled         :=True;
               QrComDiCli7.QRSubDetail2.Enabled    :=True;            QrComDiCli7.QRBand4.Enabled         :=True;
               QrComDiCli7.QRSubDetail4.Enabled    :=True;

               QrComDiCli7.QrlCopia1.Caption := 'CLIENTE';            QrComDiCli7.QrlCopia2.Caption := 'OPERACION';
               QrComDiCli7.Print;
            end
            else
            begin
               QrComDiCli7.PrinterSettings.PrinterIndex:=pPrinterIndex;
               QrComDiCli7.GroupHeaderBand2.Enabled:=True;            QrComDiCli7.QRSubDetalleOper.Enabled:=True;
               QrComDiCli7.GroupFooterBand1.Enabled:=True;            QrComDiCli7.GroupHeaderBand3.Enabled:=True;
               QrComDiCli7.QRSubDetalleLiq.Enabled :=True;            QrComDiCli7.GroupFooterBand2.Enabled:=True;
               QrComDiCli7.QRSubDetail3.Enabled    :=True;            QrComDiCli7.QRSdSeparador.Enabled   :=True;

               QrComDiCli7.QRBAND1.Enabled         :=False;           QrComDiCli7.QrSubDetail1.Enabled    :=False;
               QrComDiCli7.QRBand2.Enabled         :=False;           QrComDiCli7.QRBand3.Enabled         :=False;
               QrComDiCli7.QRSubDetail2.Enabled    :=False;           QrComDiCli7.QRBand4.Enabled         :=False;
               QrComDiCli7.QRSubDetail4.Enabled    :=False;
               QrComDiCli7.QrlCopia1.Caption := 'CLIENTE';            QrComDiCli7.Print;

               QrComDiCli7.PrinterSettings.PrinterIndex:=pPrinterIndex2;

               QrComDiCli7.QrlCopia1.Caption := 'OPERACION';
               QrComDiCli7.Print;
            end;
         end;
         Execute_ImpCompDivCli7:=True;

      finally
        QrComDiCli7.qContrato.Close;
        QrComDiCli7.qOperacion.Close;
        QrComDiCli7.qLiquidacion.Close;
        QrComDiCli7.free;
      end;

end;

procedure TQrComDiCli7.qOperacionCalcFields(DataSet: TDataSet);
begin if Band1 then
      begin
        Band1:=False;
        Exit;
      end;

      if (COPY(qOperacion.FieldByName('CVE_PRODUCTO').AsString,1,2) = 'CO') OR
         (COPY(qOperacion.FieldByName('CVE_PRODUCTO').AsString,1,2) = 'IV')
      then qOperacion.FieldByName('Oper').AsString :=''
      else qOperacion.FieldByName('Oper').AsString:=Trim(qOperacion.FieldByName('DESCOPER').AsString);

      qOperacion.FieldByName('Prod').AsString:=Trim(qOperacion.FieldByName('DESCPROD').AsString);

      if (qOperacion.FieldByName('CVE_OPERACION').AsString = 'C')  or
         (qOperacion.FieldByName('CVE_OPERACION').AsString = 'CT') or
         (qOperacion.FieldByName('CVE_OPERACION').AsString = 'CC')
      then qOperacion.FieldByName('ImpProd').AsFloat:=qOperacion.FieldByName('IMP_TRANS_MN').AsFloat
      else qOperacion.FieldByName('ImpProd').AsFloat:=qOperacion.FieldByName('IMP_TRANS_MN').AsFloat * -1;

end;

procedure TQrComDiCli7.qLiquidacionCalcFields(DataSet: TDataSet);
begin if Band2 then
      begin
        Band2:=False;
        Exit;
      end;
      if (COPY(qLiquidacion.FieldByName('CVE_PRODUCTO').AsString,1,2) = 'CO') OR
         (COPY(qLiquidacion.FieldByName('CVE_PRODUCTO').AsString,1,2) = 'IV')
      then qLiquidacion.FieldByName('Oper').AsString :=''
      else qLiquidacion.FieldByName('Oper').AsString:=Trim(qLiquidacion.FieldByName('DESCOPER').AsString);

      qLiquidacion.FieldByName('Prod').AsString:=Trim(qLiquidacion.FieldByName('DESCPROD').AsString);

      if (qLiquidacion.FieldByName('CVE_OPERACION').AsString = 'C')  or
         (qLiquidacion.FieldByName('CVE_OPERACION').AsString = 'CT') or
         (qLiquidacion.FieldByName('CVE_OPERACION').AsString = 'CC')
      then qLiquidacion.FieldByName('ImpProd').AsFloat:=qLiquidacion.FieldByName('IMP_TRANS_MN').AsFloat
      else qLiquidacion.FieldByName('ImpProd').AsFloat:=qLiquidacion.FieldByName('IMP_TRANS_MN').AsFloat * -1;

end;

procedure TQrComDiCli7.qContratoCalcFields(DataSet: TDataSet);
begin
      if qContrato.FieldByName('SIT_CONTRATO').AsString = 'CA'
      then qContrato.FieldByName('Comentario').AsString:='Este Contrato ya fue liquidado  y se esta <CANCELANDO> en este momento'
      else qContrato.FieldByName('Comentario').AsString:=Dataset.FieldByName('TX_COMENTARIO').AsString;

end;

// EIB2AARJ 23 nov 2010 Modificaciones para presentar los datos de sellado electrónico
procedure TQrComDiCli7.QRSubDetail3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
     SelloP1, SelloP2,REGIMEN, TIPO_CAMBIO,METODO_PAGO, CUENTA,MUNICIPIO, PAIS,DESC_MONEDAS : String;
     Cadena1, Cadena2, Cadena3, Cadena4, Cadena5,
     Cadena6, Cadena7 : String;
begin
      if not(qContrato.FieldByName('SELLO').IsNull) then
      begin
        SelloP1 := Copy(qContrato.FieldByName('SELLO').AsString,  1,110);
        SelloP2 := Copy(qContrato.FieldByName('SELLO').AsString,111,110);
          REGIMEN := qContrato.FieldByName('REGIMEN').AsString;
         TIPO_CAMBIO := qOperacion.FieldByName('TC_OPERACION').AsString;
         METODO_PAGO := qContrato.FieldByName('METODO_PAGO').AsString;
         CUENTA := qContrato.FieldByName('CUENTA').AsString;
         MUNICIPIO := qContrato.FieldByName('NOM_ESTADO_EX').AsString;
         PAIS := qContrato.FieldByName('NOM_PAIS_EX').AsString;
            DESC_MONEDAS:= qContrato.FieldByName('DESC_MONEDA').AsString;
        QRLabSelloP1.Caption := SelloP1;
        QRLabSelloP2.Caption := SelloP2;
                QRLabel34.Caption := REGIMEN;
        QRLabel36.Caption := METODO_PAGO;
        //QRLabel38.Caption := TIPO_CAMBIO;
        QRLabel39.Caption := PAIS;
        QRLabel40.Caption := MUNICIPIO;
           QRLabel42.Caption := REGIMEN;
        QRLabel44.Caption := METODO_PAGO;
        //QRLabel46.Caption := TIPO_CAMBIO;
        QRLabel47.Caption := PAIS;
        QRLabel48.Caption := MUNICIPIO;
                  QRLabel50.Caption := DESC_MONEDAS;
        QRLabel52.Caption := DESC_MONEDAS;
      end
      else
      begin
        QRLabelPagoExhib.Enabled := False;
        QRLabelSello.Enabled := False;
        QRLabSelloP1.Enabled := False;
        QRLabSelloP2.Enabled := False;
        QRLabelFolio.Enabled := False;
        QRDBSerie.Enabled := False;
        QRDBFolio.Enabled := False;

        QRLAbelFecCreacion.Enabled := False;
        QRDBFecCreacion.Enabled := False;

        QRLAbelAnioAprob.Enabled := False;
        QRLabelNumCert.Enabled := False;
        QRLAbelNumAprob.Enabled := False;
        QRDBAnioAprob.Enabled := False;
        QRDBNumCert.Enabled := False;
        QRDBNumAprob.Enabled := False;

        QRLabelLeyenda.Enabled := False;
      end;

      if not(qContrato.FieldByName('CADENA').IsNull) then
      begin
        Cadena1 := Copy(qContrato.FieldByName('CADENA').AsString,  1,145);
        Cadena2 := Copy(qContrato.FieldByName('CADENA').AsString,146,145);
        Cadena3 := Copy(qContrato.FieldByName('CADENA').AsString,291,145);
        Cadena4 := Copy(qContrato.FieldByName('CADENA').AsString,436,145);
        Cadena5 := Copy(qContrato.FieldByName('CADENA').AsString,581,145);
        Cadena6 := Copy(qContrato.FieldByName('CADENA').AsString,726,145);
        Cadena7 := Copy(qContrato.FieldByName('CADENA').AsString,871,145);
        QRLabCadenaP1.Caption := Cadena1;
        QRLabCadenaP2.Caption := Cadena2;
        QRLabCadenaP3.Caption := Cadena3;
        QRLabCadenaP4.Caption := Cadena4;
        QRLabCadenaP5.Caption := Cadena5;
        QRLabCadenaP6.Caption := Cadena6;
        QRLabCadenaP7.Caption := Cadena7;
      end
      else
      begin
        QRLabelCadena.Enabled := False;
        QRLabCadenaP1.Enabled := False;
        QRLabCadenaP2.Enabled := False;
        QRLabCadenaP3.Enabled := False;
        QRLabCadenaP4.Enabled := False;
        QRLabCadenaP5.Enabled := False;
        QRLabCadenaP6.Enabled := False;
        QRLabCadenaP7.Enabled := False;
      end;
end;

// EIB2AARJ 23 nov 2010 Modificaciones para presentar los datos de sellado electrónico
procedure TQrComDiCli7.QRSubDetail4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
     SelloP1, SelloP2 : String;
     Cadena1,Cadena2,Cadena3,Cadena4, Cadena5,
     Cadena6, Cadena7 : String;
begin
      if not(qContrato.FieldByName('SELLO').IsNull) then
      begin
        SelloP1 := Copy(qContrato.FieldByName('SELLO').AsString,  1,110);
        SelloP2 := Copy(qContrato.FieldByName('SELLO').AsString,111,110);
        QRLabSelloP1Copia.Caption := SelloP1;
        QRLabSelloP2Copia.Caption := SelloP2;
      end
      else
      begin
        QRLabelPagoExhibCopia.Enabled := False;
        QRLabelSelloCopia.Enabled := False;
        QRLabSelloP1Copia.Enabled := False;
        QRLabSelloP2Copia.Enabled := False;
        QRLabelFolioCopia.Enabled := False;
        QRDBSerieCopia.Enabled := False;
        QRDBFolioCopia.Enabled := False;

        QRLAbelFecCreacionCopia.Enabled := False;
        QRDBFecCreacionCopia.Enabled := False;

        QRLAbelAnioAprobCopia.Enabled := False;
        QRLabelNumCertCopia.Enabled := False;
        QRLAbelNumAprobCopia.Enabled := False;
        QRDBAnioAprobCopia.Enabled := False;
        QRDBNumCertCopia.Enabled := False;
        QRDBNumAprobCopia.Enabled := False;

        QRLabelLeyendaCopia.Enabled := False;
      end;

      if not(qContrato.FieldByName('CADENA').IsNull) then
      begin
        Cadena1 := Copy(qContrato.FieldByName('CADENA').AsString,  1,145);
        Cadena2 := Copy(qContrato.FieldByName('CADENA').AsString,146,145);
        Cadena3 := Copy(qContrato.FieldByName('CADENA').AsString,291,145);
        Cadena4 := Copy(qContrato.FieldByName('CADENA').AsString,436,145);
        Cadena5 := Copy(qContrato.FieldByName('CADENA').AsString,581,145);
        Cadena6 := Copy(qContrato.FieldByName('CADENA').AsString,726,145);
        Cadena7 := Copy(qContrato.FieldByName('CADENA').AsString,871,145);
        QRLabCadenaP1Copia.Caption := Cadena1;
        QRLabCadenaP2Copia.Caption := Cadena2;
        QRLabCadenaP3Copia.Caption := Cadena3;
        QRLabCadenaP4Copia.Caption := Cadena4;
        QRLabCadenaP5Copia.Caption := Cadena5;
        QRLabCadenaP6Copia.Caption := Cadena6;
        QRLabCadenaP7Copia.Caption := Cadena7;

      end
      else
      begin
        QRLabelCadenaCopia.Enabled := False;
        QRLabCadenaP1Copia.Enabled := False;
        QRLabCadenaP2Copia.Enabled := False;
        QRLabCadenaP3Copia.Enabled := False;
        QRLabCadenaP4Copia.Enabled := False;
        QRLabCadenaP5Copia.Enabled := False;
        QRLabCadenaP6Copia.Enabled := False;
        QRLabCadenaP7Copia.Enabled := False;
      end;
end;

end.

