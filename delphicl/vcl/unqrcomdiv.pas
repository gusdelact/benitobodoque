unit UnQrComDiv;
//Modificado    :   MARA4356 FEBRERO 2006 SE AGREGA IMPRESORA
//                  MARA4356 FEB 2007 SE MODIFICA PARA IMPRIMIR SOLO CLIENTE Y OOPERACION
//              :   EIB2AARJ 23 nov 2010 Modificaciones para presentar los datos de sellado electrónico

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls, Dialogs,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, InterApl, UnSQL2;

type
  TQrComDivisas = class(TQuickRep)
    DetailBand1                : TQRBand;
    qContrato                  : TQuery;
    qOperacion                 : TQuery;
    qOperacionID_CONTRATO      : TFloatField;
    qOperacionF_OPERACION      : TDateTimeField;
    qOperacionF_LIQUIDACION    : TDateTimeField;
    qOperacionCVE_MONEDA       : TFloatField;
    qOperacionCVE_OPERACION    : TStringField;
    qOperacionIMP_TRANS_MN     : TFloatField;
    qOperacionIMP_TRANS_PROD   : TFloatField;
    qOperacionTC_OPERACION     : TFloatField;
    qOperacionTX_COMENTARIO    : TStringField;
    qOperacionDESC_BENEF       : TStringField;
    qOperacionCTA_BENEFICIARIO : TStringField;
    qOperacionNOMBRE_BCO_BENEF : TStringField;
    qOperacionABA              : TStringField;
    qOperacionDESCOPER         : TStringField;
    qOperacionDESCPROD         : TStringField;
    qOperacionDESC_MONEDA      : TStringField;
    qOperacionCVE_PRODUCTO     : TStringField;
    qLiquidacion               : TQuery;
    qLiquidacionID_CONTRATO    : TFloatField;
    qLiquidacionF_OPERACION    : TDateTimeField;
    qLiquidacionCVE_PRODUCTO   : TStringField;
    qLiquidacionID_GPO_TRANS   : TFloatField;
    qLiquidacionF_LIQUIDACION  : TDateTimeField;
    qLiquidacionCVE_MONEDA     : TFloatField;
    qLiquidacionCVE_OPERACION  : TStringField;
    qLiquidacionIMP_TRANS_MN   : TFloatField;
    qLiquidacionIMP_TRANS_PROD : TFloatField;
    qLiquidacionTC_OPERACION   : TFloatField;
    qLiquidacionTX_COMENTARIO  : TStringField;
    qLiquidacionDESCPROD       : TStringField;
    qLiquidacionDESCOPER       : TStringField;
    GroupHeaderBand2           : TQRBand;
    QRDBText1                  : TQRDBText;
    QRDBText2                  : TQRDBText;
    DOMIC2                     : TQRDBText;
    DOMIC3                     : TQRDBText;
    DOMIC4                     : TQRDBText;
    QRDBText6                  : TQRDBText;
    QRDBText7                  : TQRDBText;
    QRShape1                   : TQRShape;
    QRLabel1                   : TQRLabel;
    QRLabel2                   : TQRLabel;
    QRLabel3                   : TQRLabel;
    QRLabel4                   : TQRLabel;
    QRLabel5                   : TQRLabel;
    GroupFooterBand1           : TQRBand;
    QRDBText9                  : TQRDBText;
    QRDBText10                 : TQRDBText;
    QRDBText11                 : TQRDBText;
    QRDBText12                 : TQRDBText;
    QRDBText13                 : TQRDBText;
    QRDBText14                 : TQRDBText;
    QRDBText15                 : TQRDBText;
    QRDBText16                 : TQRDBText;
    QRDBText17                 : TQRDBText;
    QRDBText18                 : TQRDBText;
    GroupFooterBand2           : TQRBand;
    qContratoID_CONTRATO       : TFloatField;
    qContratoID_CLIENTE        : TFloatField;
    qContratoNOMBRE_CLIENTE    : TStringField;
    qContratoCVE_MONEDA_BASE   : TFloatField;
    qContratoF_OPERACION       : TDateTimeField;
    qContratoF_LIQUIDACION     : TDateTimeField;
    qContratoSIT_CONTRATO      : TStringField;
    qContratoTX_COMENTARIO     : TStringField;
    qContratoID_PERSONA        : TFloatField;
    qContratoB_IMPR_DOMIC      : TStringField;
    qContratoCALLE_NUMERO      : TStringField;
    qContratoDOMIC1            : TStringField;
    qContratoDOMIC2            : TStringField;
    qContratoCODIGO_POSTAL     : TStringField;
    qOperacionOper             : TStringField;
    qOperacionProd             : TStringField;
    qOperacionImpProd          : TFloatField;
    qLiquidacionOper           : TStringField;
    qLiquidacionProd           : TStringField;
    qLiquidacionImpProd        : TFloatField;
    qContratoComentario        : TStringField;
    QRExpr1                    : TQRExpr;
    QRExpr2                    : TQRExpr;
    QRShape5                   : TQRShape;
    QRLabel7                   : TQRLabel;
    QRShape6                   : TQRShape;
    QRShape7                   : TQRShape;
    QRLabel11                  : TQRLabel;
    QRShape8                   : TQRShape;
    QRLabel12                  : TQRLabel;
    QRShape9                   : TQRShape;
    QRLabel8                   : TQRLabel;
    QRLabel9                   : TQRLabel;
    GroupHeaderBand3           : TQRBand;
    QRShape3                   : TQRShape;
    QRLabel6                   : TQRLabel;
    QRLabel10                  : TQRLabel;
    QRShape11                  : TQRShape;
    QRLabel13                  : TQRLabel;
    QRLabel14                  : TQRLabel;
    QRShape12                  : TQRShape;
    QRLabel15                  : TQRLabel;
    QRLabel16                  : TQRLabel;
    QRShape13                  : TQRShape;
    QRShape2                   : TQRShape;
    QRBand1                    : TQRBand;
    QRShape4                   : TQRShape;
    QRShape10                  : TQRShape;
    QRDBText23                 : TQRDBText;
    QRDBText24                 : TQRDBText;
    QRShape14                  : TQRShape;
    QRLabel17                  : TQRLabel;
    QRLabel18                  : TQRLabel;
    QRLabel19                  : TQRLabel;
    QRLabel20                  : TQRLabel;
    QRLabel21                  : TQRLabel;
    QRShape15                  : TQRShape;
    QRLabel22                  : TQRLabel;
    QRShape16                  : TQRShape;
    QRLabel23                  : TQRLabel;
    QRShape17                  : TQRShape;
    QRLabel24                  : TQRLabel;
    QRShape18                  : TQRShape;
    QRLabel25                  : TQRLabel;
    QRLabel26                  : TQRLabel;
    QRDBText26                 : TQRDBText;
    QRDBText27                 : TQRDBText;
    QRDBText28                 : TQRDBText;
    QRDBText29                 : TQRDBText;
    QRDBText30                 : TQRDBText;
    QRBand2                    : TQRBand;
    QRExpr3                    : TQRExpr;
    QRLabel27                  : TQRLabel;
    QRBand3                    : TQRBand;
    QRShape19                  : TQRShape;
    QRLabel28                  : TQRLabel;
    QRLabel29                  : TQRLabel;
    QRDBText31                 : TQRDBText;
    QRDBText32                 : TQRDBText;
    QRDBText33                 : TQRDBText;
    QRDBText34                 : TQRDBText;
    QRDBText35                 : TQRDBText;
    QRBand4                    : TQRBand;
    QRExpr4                    : TQRExpr;
    QRLabel30                  : TQRLabel;
    QRShape20                  : TQRShape;
    QRDBText36                 : TQRDBText;
    QRShape21                  : TQRShape;
    QRLabel31                  : TQRLabel;
    QRLabel32                  : TQRLabel;
    QRShape22                  : TQRShape;
    DOMIC1                     : TQRDBText;
    QRDBText3                  : TQRDBText;
    DOMIC5                     : TQRDBText;
    DOMIC6                     : TQRDBText;
    DOMIC7                     : TQRDBText;
    DOMIC8                     : TQRDBText;
    QrlCopia1                  : TQRLabel;
    QrlCopia2                  : TQRLabel;
    QRDBText4                  : TQRDBText;
    QRDBText5                  : TQRDBText;
    QRShape23                  : TQRShape;
    QRShape24                  : TQRShape;
    QRShape25                  : TQRShape;
    QRShape26                  : TQRShape;
    qContratoRFCT              : TStringField;
    DOMIC4B                    : TQRDBText;
    DOMIC4A                    : TQRLabel;
    DOMIC4C                    : TQRLabel;
    DOMIC4D                    : TQRDBText;
    QRDBText8                  : TQRDBText;
    QRDBText19                 : TQRDBText;
    qContratoSERIE             : TStringField;
    qContratoFOLIO             : TStringField;
    qContratoSELLO             : TStringField;
    qContratoCADENA            : TBlobField;
    QRLabelSello               : TQRLabel;
    QRLabSelloP1               : TQRLabel;
    QRLabSelloP2               : TQRLabel;
    QRLabelFolio               : TQRLabel;
    QRDBSerie                  : TQRDBText;
    QRDBFolio                  : TQRDBText;
    QRLabelCadena              : TQRLabel;
    QRLabCadenaP1              : TQRLabel;
    QRLabCadenaP2              : TQRLabel;
    QRLabCadenaP3              : TQRLabel;
    QRLabCadenaP4              : TQRLabel;
    QRLabCadenaP5              : TQRLabel;
    QRLabelSelloCopia          : TQRLabel;
    QRLabSelloP1Copia          : TQRLabel;
    QRLabSelloP2Copia          : TQRLabel;
    QRLabelCadenaCopia         : TQRLabel;
    QRLabelFolioCopia          : TQRLabel;
    QRDBSerieCopia             : TQRDBText;
    QRDBFolioCopia             : TQRDBText;
    QRLabCadenaP1Copia         : TQRLabel;
    QRLabCadenaP2Copia         : TQRLabel;
    QRLabCadenaP3Copia         : TQRLabel;
    QRLabCadenaP4Copia         : TQRLabel;
    QRLabCadenaP5Copia         : TQRLabel;
    QRLabCadenaP6              : TQRLabel;
    QRLabCadenaP7              : TQRLabel;
    QRLabCadenaP6Copia         : TQRLabel;
    QRLabCadenaP7Copia         : TQRLabel;
    QRLabelPagoExhib           : TQRLabel;
    QRLabelPagoExhibCopia      : TQRLabel;
    qContratoANO_APROBACION    : TStringField;
    qContratoNUM_APROBACION    : TStringField;
    QRLabelNumCert             : TQRLabel;
    QRDBNumCert                : TQRDBText;
    QRLabelAnioAprob           : TQRLabel;
    QRDBAnioAprob              : TQRDBText;
    QRLabelNumAprob            : TQRLabel;
    QRDBNumAprob               : TQRDBText;
    QRLabelLeyenda             : TQRLabel;
    QRLabelNumCertCopia        : TQRLabel;
    QRDBNumCertCopia           : TQRDBText;
    QRLabelAnioAprobCopia      : TQRLabel;
    QRDBAnioAprobCopia         : TQRDBText;
    QRLabelNumAprobCopia       : TQRLabel;
    QRDBNumAprobCopia          : TQRDBText;
    QRLabelLeyendaCopia        : TQRLabel;
    QRLabelFecCreacion         : TQRLabel;
    QRDBFecCreacion            : TQRDBText;
    QRLabelFecCreacionCopia    : TQRLabel;
    QRDBFecCreacionCopia       : TQRDBText;
    qContratoFECHA_CREACION    : TStringField;
    qContratoCERTIFICADO       : TStringField;
    QRSdSeparador              : TQRSubDetail;
    QRSubDetail1               : TQRSubDetail;
    QRSubDetail2               : TQRSubDetail;
    QRSubDetail3               : TQRSubDetail;
    QRSubDetail4               : TQRSubDetail;
    QRSubDetalleLiq            : TQRSubDetail;
    QRSubDetalleOper           : TQRSubDetail;
    QRLabel33                  : TQRLabel;
    QRLabel34                  : TQRLabel;
    QRLabel35                  : TQRLabel;
    QRLabel36                  : TQRLabel;
    QRLabel37                  : TQRLabel;
    QRLabel39                  : TQRLabel;
    QRLabel40                  : TQRLabel;
    QRLabel41                  : TQRLabel;
    QRLabel42                  : TQRLabel;
    QRLabel43                  : TQRLabel;
    QRLabel44                  : TQRLabel;
    QRLabel45                  : TQRLabel;
    QRLabel47                  : TQRLabel;
    QRLabel48                  : TQRLabel;
    QRLabel49                  : TQRLabel;
    QRLabel50                  : TQRLabel;
    QRLabel51                  : TQRLabel;
    QRLabel52                  : TQRLabel;
    qContratoMETODO_PAGO       : TStringField;
    qContratoDESC_MONEDA       : TStringField;
    qContratoCUENTA            : TStringField;
    qContratoREGIMEN           : TStringField;
    qContratoNOM_PAIS_EX       : TStringField;
    qContratoNOM_ESTADO_EX     : TStringField;
    qContratoTIPO_CAMBIOS      : TFloatField;
    QRDBTipoCamb               : TQRDBText;
    QRDBText20                 : TQRDBText;
    QRLabel38                  : TQRLabel;
    qrlPlaza: TQRLabel;
    qrlPlaza2: TQRLabel;

    // --
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
  QrComDivisas: TQrComDivisas;
  Band1, Band2 : Boolean;

FUNCTION Execute_ImpCompDiv(pApli          : TInterApli;
                            pQContrato     : TQuery;
                            pQOperacion    : TQuery;
                            pQLiquidacion  : TQuery;
                            pPrinterIndex  : Integer;
                            pPrinterIndex2 : Integer;
                            pPrinterIndex3 : Integer;
                            pPrinterIndex4 : Integer):Boolean;

implementation

{$R *.DFM}

FUNCTION Execute_ImpCompDiv(pApli          : TInterApli;
                            pQContrato     : TQuery;
                            pQOperacion    : TQuery;
                            pQLiquidacion  : TQuery;
                            pPrinterIndex  : Integer;
                            pPrinterIndex2 : Integer;
                            pPrinterIndex3 : Integer;
                            pPrinterIndex4 : Integer):Boolean;
Var  QrComDivisas: TQrComDivisas;
     vlNumRegs : Integer;
     vlImprime : Boolean;
     vlPlaza : String;
     S:String;
     Q:TQuery;
begin QrComDivisas := TQrComDivisas.Create(Nil);

      {MAGV201509 Obtiene la plaza}
      //-->plaza
      vlPlaza := 'Plaza';

      try
        S :=
            'select usu.cve_usuario, '  + #13#10 +
            '       ''PLAZA ''||pob.desc_poblacion || '' '' || cd.desc_poblacion as plaza '  + #13#10 +
            'from   usuario usu, empleado em, '  + #13#10 +
            '       unidad_negocio un, '  + #13#10 +
            '			 poblacion pob, '  + #13#10 +
            '			 poblacion cd '  + #13#10 +
            'where  usu.cve_usuario = ''' + pApli.Usuario + ''' '  + #13#10 +
            'and    usu.id_persona = em.id_persona '  + #13#10 +
            'and    em.id_entidad = un.id_entidad '  + #13#10 +
            'and    pob.cve_poblacion = un.cve_poblacion '  + #13#10 +
            'and    cd.cve_poblacion = pob.CVE_POBLAC_UBIC ';

        Q := GetSqlQueryNoNil(S,pApli.DataBaseName, pApli.SessionName, True);
        if Q<>nil then
        begin
          vlPlaza := Q.FieldByName('plaza').AsString;
        end;

      finally
      end;
      //<-- plaza


      Band1:=True;
      Band2:=True;
      Execute_ImpCompDiv:=False;
      try
         QrComDivisas.qContrato.DatabaseName :=pApli.DataBaseName;
         QrComDivisas.qContrato.SessionName  :=pApli.SessionName;
         QrComDivisas.qContrato.sql.Text:=pqContrato.SQL.Text;
         QrComDivisas.qContrato.Open;

         QrComDivisas.qOperacion.DatabaseName:=pApli.DataBaseName;
         QrComDivisas.qOperacion.SessionName :=pApli.SessionName;
         QrComDivisas.qOperacion.sql.Text:=pqOperacion.SQL.Text;
         QrComDivisas.qOperacion.Open;

         QrComDivisas.qLiquidacion.DatabaseName:=pApli.DataBaseName;
         QrComDivisas.qLiquidacion.SessionName :=pApli.SessionName;
         QrComDivisas.qLiquidacion.sql.Text:=pqLiquidacion.SQL.Text;
         QrComDivisas.qLiquidacion.Open;

         vlNumRegs:=QrComDivisas.qOperacion.RecordCount + QrComDivisas.qLiquidacion.RecordCount;
         vlNumRegs:=vlNumRegs-2; //5-2= 3
         //EIB2AARJ : 08/12/2010 QrComDivisas.QRSdSeparador.Height:=QrComDivisas.QRSdSeparador.Height - (QrComDivisas.QRSubDetalleOper.Height * vlNumRegs);
         QrComDivisas.QRSdSeparador.Height:=QrComDivisas.QRSdSeparador.Height - (QrComDivisas.QRSubDetalleOper.Height * vlNumRegs) + (33 - (vlNumRegs*11));
                                                                      //2:  124  -  11 *  0 :  124  +   (18 - 0*6)  : 142 + 15   :157
                                                                      //3:  124  -  11 *  1 :  113  +   (18 - 1*6)  : 125 + 15   :140
                                                                      //4:  124  -  11 *  2 :  102  +   (18 - 2*6)  : 108 + 15   :123
                                                                      //5:  124  -  11 *  3 :   91  +   (18 - 3*6)  :  91 +  0   : 91

         vlImprime :=(QrComDivisas.qContrato.FieldByName('B_IMPR_DOMIC').AsString = 'V');
         QrComDivisas.DOMIC1.Enabled:=vlImprime;
         QrComDivisas.DOMIC2.Enabled:=vlImprime;
         QrComDivisas.DOMIC3.Enabled:=vlImprime;
         QrComDivisas.DOMIC4.Enabled:=vlImprime;
         QrComDivisas.DOMIC5.Enabled:=vlImprime;
         QrComDivisas.DOMIC6.Enabled:=vlImprime;
         QrComDivisas.DOMIC7.Enabled:=vlImprime;
         QrComDivisas.DOMIC8.Enabled:=vlImprime;

         //JUNIO DEL 2002. M.ZARATE. Se agrega el campo de RFC.
         QrComDivisas.DOMIC4A.Enabled:=vlImprime;
         QrComDivisas.DOMIC4B.Enabled:=vlImprime;
         QrComDivisas.DOMIC4C.Enabled:=vlImprime;
         QrComDivisas.DOMIC4D.Enabled:=vlImprime;

         // EIB2AARJ : 17 DIC 2010 INICIO
         if not(QrComDivisas.qContrato.FieldByName('SELLO').IsNull) then
           begin
             QrComDivisas.QRLabel9.Enabled := False;
             QrComDivisas.QRLabel26.Enabled := False;
           end
         else
           begin
             QrComDivisas.QRLabel9.Enabled := True;
             QrComDivisas.QRLabel26.Enabled := True;
           end;
         // EIB2AARJ : 17 DIC 2010 FIN

         if (pPrinterIndex <> -1) and (pPrinterIndex2 <> -1) then
         begin
            if pPrinterIndex = pPrinterIndex2 then
            begin
               QrComDivisas.PrinterSettings.PrinterIndex:=pPrinterIndex;
               QrComDivisas.GroupHeaderBand2.Enabled:=True;            QrComDivisas.QRSubDetalleOper.Enabled:=True;
               QrComDivisas.GroupFooterBand1.Enabled:=True;            QrComDivisas.GroupHeaderBand3.Enabled:=True;
               QrComDivisas.QRSubDetalleLiq.Enabled :=True;            QrComDivisas.GroupFooterBand2.Enabled:=True;
               QrComDivisas.QRSubDetail3.Enabled    :=True;            QrComDivisas.QRSdSeparador.Enabled   :=True;

               QrComDivisas.QRBAND1.Enabled         :=True;            QrComDivisas.QrSubDetail1.Enabled    :=True;
               QrComDivisas.QRBand2.Enabled         :=True;            QrComDivisas.QRBand3.Enabled         :=True;
               QrComDivisas.QRSubDetail2.Enabled    :=True;            QrComDivisas.QRBand4.Enabled         :=True;
               QrComDivisas.QRSubDetail4.Enabled    :=True;

               QrComDivisas.QrlCopia1.Caption := 'CLIENTE';            QrComDivisas.QrlCopia2.Caption := 'OPERACION';
               //MAGV201509 muestra la plaza en el comprobante
               QrComDivisas.qrlPlaza.Caption := vlPlaza;
               QrComDivisas.qrlPlaza2.Caption := vlPlaza;
               QrComDivisas.Print;
            end
            else
            begin
               QrComDivisas.PrinterSettings.PrinterIndex:=pPrinterIndex;
               QrComDivisas.GroupHeaderBand2.Enabled:=True;            QrComDivisas.QRSubDetalleOper.Enabled:=True;
               QrComDivisas.GroupFooterBand1.Enabled:=True;            QrComDivisas.GroupHeaderBand3.Enabled:=True;
               QrComDivisas.QRSubDetalleLiq.Enabled :=True;            QrComDivisas.GroupFooterBand2.Enabled:=True;
               QrComDivisas.QRSubDetail3.Enabled    :=True;            QrComDivisas.QRSdSeparador.Enabled   :=True;

               QrComDivisas.QRBAND1.Enabled         :=False;           QrComDivisas.QrSubDetail1.Enabled    :=False;
               QrComDivisas.QRBand2.Enabled         :=False;           QrComDivisas.QRBand3.Enabled         :=False;
               QrComDivisas.QRSubDetail2.Enabled    :=False;           QrComDivisas.QRBand4.Enabled         :=False;
               QrComDivisas.QRSubDetail4.Enabled    :=False;
               QrComDivisas.QrlCopia1.Caption := 'CLIENTE';            QrComDivisas.Print;
            
               QrComDivisas.PrinterSettings.PrinterIndex:=pPrinterIndex2;
               {QrComDivisas.GroupHeaderBand2.Enabled:=False;           QrComDivisas.QRSubDetalleOper.Enabled:=False;
               QrComDivisas.GroupFooterBand1.Enabled:=False;           QrComDivisas.GroupHeaderBand3.Enabled:=False;
               QrComDivisas.QRSubDetalleLiq.Enabled :=False;           QrComDivisas.GroupFooterBand2.Enabled:=False;
               QrComDivisas.QRSubDetail3.Enabled    :=False;           QrComDivisas.QRSdSeparador.Enabled   :=False;

               QrComDivisas.QRBAND1.Enabled         :=True;            QrComDivisas.QrSubDetail1.Enabled    :=True;
               QrComDivisas.QRBand2.Enabled         :=True;            QrComDivisas.QRBand3.Enabled         :=True;
               QrComDivisas.QRSubDetail2.Enabled    :=True;            QrComDivisas.QRBand4.Enabled         :=True;
               QrComDivisas.QRSubDetail4.Enabled    :=True;
               QrComDivisas.QrlCopia2.Caption := 'OPERACION';}
               QrComDivisas.QrlCopia1.Caption := 'OPERACION';
               QrComDivisas.Print;
            end;
         end;
         {MARA4356 SE ELIMINA LA PARTE DE CONTABILIDAD Y OPERACION; DESAPARECE OPERACION Y EL DE CONTABILIDAD SE IMPRIME POR PANTALLA ESPECIAL}
         {if (pPrinterIndex3 <> 0) or (pPrinterIndex4 <> 0) then
         begin
            QrComDivisas.PrinterSettings.PrinterIndex:=pPrinterIndex3;
            if pPrinterIndex3 = pPrinterIndex4 then
            begin
               QrComDivisas.GroupHeaderBand2.Enabled:=True;            QrComDivisas.QRSubDetalleOper.Enabled:=True;
               QrComDivisas.GroupFooterBand1.Enabled:=True;            QrComDivisas.GroupHeaderBand3.Enabled:=True;
               QrComDivisas.QRSubDetalleLiq.Enabled :=True;            QrComDivisas.GroupFooterBand2.Enabled:=True;
               QrComDivisas.QRSubDetail3.Enabled    :=True;            QrComDivisas.QRSdSeparador.Enabled   :=True;

               QrComDivisas.QRBAND1.Enabled         :=True;            QrComDivisas.QrSubDetail1.Enabled    :=True;
               QrComDivisas.QRBand2.Enabled         :=True;            QrComDivisas.QRBand3.Enabled         :=True;
               QrComDivisas.QRSubDetail2.Enabled    :=True;            QrComDivisas.QRBand4.Enabled         :=True;
               QrComDivisas.QRSubDetail4.Enabled    :=True;
            
               QrComDivisas.QrlCopia1.Caption := 'CONTABILIDAD';       QrComDivisas.QrlCopia2.Caption := 'CONTABILIDAD';
               QrComDivisas.Print;
            end
            else
            begin
               QrComDivisas.GroupHeaderBand2.Enabled:=True;            QrComDivisas.QRSubDetalleOper.Enabled:=True;
               QrComDivisas.GroupFooterBand1.Enabled:=True;            QrComDivisas.GroupHeaderBand3.Enabled:=True;
               QrComDivisas.QRSubDetalleLiq.Enabled :=True;            QrComDivisas.GroupFooterBand2.Enabled:=True;
               QrComDivisas.QRSubDetail3.Enabled    :=True;            QrComDivisas.QRSdSeparador.Enabled   :=True;

               QrComDivisas.QRBAND1.Enabled         :=False;            QrComDivisas.QrSubDetail1.Enabled    :=False;
               QrComDivisas.QRBand2.Enabled         :=False;            QrComDivisas.QRBand3.Enabled         :=False;
               QrComDivisas.QRSubDetail2.Enabled    :=False;            QrComDivisas.QRBand4.Enabled         :=False;
               QrComDivisas.QRSubDetail4.Enabled    :=False;
               QrComDivisas.QrlCopia1.Caption := 'CONTABILIDAD';        QrComDivisas.Print;
            end;
         end;}
         Execute_ImpCompDiv:=True;

      finally
        QrComDivisas.qContrato.Close;
        QrComDivisas.qOperacion.Close;
        QrComDivisas.qLiquidacion.Close;
        QrComDivisas.free;
      end;

end;

procedure TQrComDivisas.qOperacionCalcFields(DataSet: TDataSet);
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

procedure TQrComDivisas.qLiquidacionCalcFields(DataSet: TDataSet);
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

procedure TQrComDivisas.qContratoCalcFields(DataSet: TDataSet);
begin
      if qContrato.FieldByName('SIT_CONTRATO').AsString = 'CA'
      then qContrato.FieldByName('Comentario').AsString:='Este Contrato ya fue liquidado  y se esta <CANCELANDO> en este momento'
      else qContrato.FieldByName('Comentario').AsString:=Dataset.FieldByName('TX_COMENTARIO').AsString;
end;

// EIB2AARJ 23 nov 2010 Modificaciones para presentar los datos de sellado electrónico
procedure TQrComDivisas.QRSubDetail3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
     SelloP1, SelloP2,REGIMEN, TIPO_CAMBIO,METODO_PAGO, CUENTA,MUNICIPIO, PAIS, DESC_MONEDAS : String;
     Cadena1, Cadena2, Cadena3,Cadena4,
     Cadena5, Cadena6, Cadena7: String;
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
procedure TQrComDivisas.QRSubDetail4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
     SelloP1, SelloP2 : String;
     Cadena1, Cadena2, Cadena3,Cadena4,
     Cadena5, Cadena6, Cadena7: String;
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
