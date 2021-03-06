//PAGNIV
//CVE_GEN_TIP_PAG

{
*************************************************************
*********************REGISTRO DE CAMBIOS*********************

HERJA 26.08.2010
Juan Aaron Hernandez Rodriguez
1. Se anexa procedimiento para calcular Tasa de Interes al d�a para el cualculo de Financiamientos Adicionales

              
*************************************************************
}
unit IntMQrTasaActB;

interface
              
uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, IntGenCre,UnSQL2,Dialogs;           

type                                                    
  TQrTasaActB = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    qyEncabezado: TQuery;                     
    QRFoot1: TQRBand;
    qyConsulta: TQuery;
    QRLabel27: TQRLabel;
    QRBand2: TQRBand;                          
    QRMemo1: TQRMemo;
    qyEncabezadoID_CREDITO: TFloatField;
    qyEncabezadoID_CONTRATO: TFloatField;               
    qyEncabezadoID_TITULAR: TFloatField;
    qyEncabezadoNOMBRE: TStringField;
    qyEncabezadoCALLE_NUMERO: TStringField;
    qyEncabezadoCODIGO_POSTAL: TStringField;
    qyEncabezadoCOLONIA: TStringField;
    qyEncabezadoCIUDAD: TStringField;
    qyEncabezadoESTADO: TStringField;
    qyEncabezadoPAIS: TStringField;
    qyEncabezadoCHEQUERA: TStringField;
    qyEncabezadoPRODUCTO: TStringField;
    qyEncabezadoCVE_MONEDA: TFloatField;
    qyEncabezadoDESC_MONEDA: TStringField;
    qyEncabezadoIMP_CREDITO: TFloatField;
    qyEncabezadoTASAPACTADA: TStringField;
    qyEncabezadoTASA_APLICADA: TFloatField;
    qyEncabezadoCALCULO: TStringField;
    qyEncabezadoAMORTIZACION: TStringField;
    qyEncabezadoFORMPAGINTER: TStringField;
    qyEncabezadoPERIODOCAPITAL: TStringField;
    qyEncabezadoPERIODOINTERES: TStringField;
    qyEncabezadoFACT_MORAS: TFloatField;
    qyEncabezadoAPLICAIVA: TStringField;
    qyEncabezadoREVOLVENTE: TStringField;
    qyEncabezadoF_AUTORIZA: TDateTimeField;
    qyEncabezadoF_INICIO: TDateTimeField;
    qyEncabezadoF_VENCIMIENTO: TDateTimeField;
    qyEncabezadoSDO_INSOLUTO: TFloatField;
    qyEncabezadoIMP_INTERES: TFloatField;
    qyEncabezadoIMP_IVA_INTERES: TFloatField;
    qyEncabezadoIMP_COMISION: TFloatField;
    qyEncabezadoIMP_IVACOM: TFloatField;
    qyEncabezadoCAPITALPROG: TFloatField;
    qyEncabezadoIMP_CAPITAL_VDO: TFloatField;
    qyEncabezadoIMP_INTERES_VDO: TFloatField;
    qyEncabezadoIMP_IVA_INT_VDO: TFloatField;
    qyEncabezadoIMP_COMISION_VDO: TFloatField;
    qyEncabezadoIMP_IVA_COM_VDO: TFloatField;
    qyEncabezadoIMP_MOR_CAPITAL: TFloatField;
    qyEncabezadoIMP_IVA_MOR_CAP: TFloatField;
    qyEncabezadoIMP_MOR_COMISION: TFloatField;
    qyEncabezadoIMP_IVA_MOR_COM: TFloatField;
    qyEncabezadoADEUDOVIGENTE: TFloatField;
    qyEncabezadoADEUDOVENCIDO: TFloatField;
    qyEncabezadoTOTALADEUDO: TFloatField;
    qyConsultaCAPTASA: TFloatField;
    qyConsultaCAPTASAMOR: TFloatField;
    QRShape12: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRLabel50: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    QRDBText50: TQRDBText;
    QRDBText57: TQRDBText;
    QRDBText59: TQRDBText;
    QRDBText60: TQRDBText;
    QRLabel76: TQRLabel;
    QRDBText67: TQRDBText;
    QRLabel77: TQRLabel;
    QRDBText68: TQRDBText;
    QRLabel78: TQRLabel;
    QRLabel79: TQRLabel;
    QRLabel80: TQRLabel;
    QRLabel81: TQRLabel;
    QRLabel82: TQRLabel;
    QRDBText69: TQRDBText;
    QRDBText70: TQRDBText;
    QRDBText76: TQRDBText;
    QRDBText77: TQRDBText;
    QRDBText78: TQRDBText;
    QRDBText79: TQRDBText;
    QRDBText80: TQRDBText;
    QRDBText81: TQRDBText;
    QRDBText82: TQRDBText;
    QRLabel83: TQRLabel;
    QRDBText83: TQRDBText;
    QRDBText84: TQRDBText;
    QRDBText85: TQRDBText;
    QRLabel84: TQRLabel;
    QRDBText86: TQRDBText;
    QRDBText87: TQRDBText;
    QRDBText88: TQRDBText;
    QRDBText89: TQRDBText;
    QRLabel85: TQRLabel;
    QRLabel86: TQRLabel;
    QRDBText90: TQRDBText;
    QRDBText91: TQRDBText;
    QRDBText92: TQRDBText;
    QRLabel87: TQRLabel;
    QRDBText93: TQRDBText;
    QRLabel88: TQRLabel;
    QRDBText94: TQRDBText;
    QRLabel89: TQRLabel;
    QRLabel90: TQRLabel;
    QRLabel91: TQRLabel;
    QRLabel92: TQRLabel;
    QRLabel93: TQRLabel;
    QRLabel94: TQRLabel;
    QRLabel95: TQRLabel;
    QRLabel96: TQRLabel;
    QRDBText95: TQRDBText;
    QRDBText98: TQRDBText;
    QRDBText99: TQRDBText;
    QRLabel97: TQRLabel;
    QRDBText100: TQRDBText;
    QRLabel98: TQRLabel;
    QRDBText101: TQRDBText;
    QRLabel99: TQRLabel;
    QRDBText102: TQRDBText;
    QRLabel100: TQRLabel;
    QRDBText103: TQRDBText;
    QRLabel101: TQRLabel;
    QRDBText104: TQRDBText;
    QRLabel102: TQRLabel;
    QRLabel103: TQRLabel;
    QRLabel104: TQRLabel;
    QRDBText106: TQRDBText;
    QRLabel106: TQRLabel;
    QRDBText107: TQRDBText;
    QRLbNumRefer: TQRLabel;
    QRDBText108: TQRDBText;
    QRLabel108: TQRLabel;
    QRLabel109: TQRLabel;
    QRLabel110: TQRLabel;
    QRLabel111: TQRLabel;
    QRDBText111: TQRDBText;
    QRDBText112: TQRDBText;
    QRDBText113: TQRDBText;
    QRDBText114: TQRDBText;
    qyEncabezadoTASA_ACTUAL: TFloatField;
    QRDBText21: TQRDBText;
    qyEncabezadoTASA_CREDITO: TFloatField;
    QRFoot2: TQRBand;
    QRLabel15: TQRLabel;
    qrlSum1: TQRLabel;
    qrlSum2: TQRLabel;
    qrlSum3: TQRLabel;
    qrlSuma4: TQRLabel;
    qrlSuma3: TQRLabel;
    qrlSuma2: TQRLabel;
    qrlSuma1: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBText25: TQRDBText;
    qyEncabezadoSDO_FINAN_ADIC: TFloatField;
    qyEncabezadoIMP_VDO_FINAN_A: TFloatField;
    qyEncabezadoIMP_MOR_FINAN_A: TFloatField;
    qyEncabezadoIMP_IVA_MOR_FIN: TFloatField;
    Group1: TQRGroup;
    QRShape8: TQRShape;
    QRLabel112: TQRLabel;
    QRLabel113: TQRLabel;
    QRLabel114: TQRLabel;
    QRLabel115: TQRLabel;
    QRLabel116: TQRLabel;
    QRLabel117: TQRLabel;
    QRLabel118: TQRLabel;
    QRLabel119: TQRLabel;
    Group3: TQRGroup;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    Group5: TQRGroup;
    QRShape9: TQRShape;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRFoot3: TQRBand;
    QRLabel25: TQRLabel;
    qrlSuma03: TQRLabel;
    qrlSuma02: TQRLabel;
    qrlSuma01: TQRLabel;
    QRIntVig: TQRLabel;
    QRIntVigIVA: TQRLabel;
    QRTotalVig: TQRLabel;
    QRTotalAdeudo: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel31: TQRLabel;
    QRShape10: TQRShape;
    QRLabel32: TQRLabel;
    QRIntPro: TQRLabel;
    QRConPro: TQRLabel;
    QRTotPro: TQRLabel;
    QRLabel33: TQRLabel;
    qyEncabezadoSDO_FINAN_ADICPROG: TFloatField;
    qyEncabezadoPER_INTERESPROG: TFloatField;
    qyEncabezadoIMP_COMISIONPROG: TFloatField;
    qyEncabezadoIMP_IVACOMPROG: TFloatField;
    QRLabel34: TQRLabel;
    QRDBText33: TQRDBText;
    qyEncabezadoCAPITAL_VIG: TFloatField;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    SummaryBand1: TQRBand;
    Group9: TQRGroup;
    Group10: TQRGroup;
    Group7: TQRGroup;
    QRShape2: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    Group8: TQRGroup;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRShape3: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRFoot4: TQRBand;
    qyConsultaIDGRUPO: TFloatField;
    qyConsultaNUM_PERIODO: TFloatField;
    qyConsultaIMPORTE: TFloatField;
    qyConsultaIVA_VENC: TFloatField;
    qyConsultaF_VENCIMIENTO: TDateTimeField;
    qyConsultaF_PROG_PAGO: TDateTimeField;
    qyConsultaF_ULT_PAG: TDateTimeField;
    qyConsultaDIAS: TFloatField;
    qyConsultaTASA: TFloatField;
    qyConsultaTASA_MORAS: TFloatField;
    qyConsultaMORATORIOS: TFloatField;
    qyConsultaIVA_MOR: TFloatField;
    qyConsultaBENEFICIO: TFloatField;
    qyConsultaID_CREDITO: TFloatField;
    qyConsultaFACT_MORAS: TFloatField;
    qyConsultaCVE_COMISION: TStringField;
    qyConsultaDESC_COMISION: TStringField;
    qyConsultaTITULAR: TStringField;
    qyConsultaBANCO: TStringField;
    qyConsultaCONVENIOCUENTA: TStringField;
    qyConsultaSUCURSAL: TStringField;
    qyConsultaID_BANCO: TFloatField;
    QRLabel51: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRShape13: TQRShape;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRDBText42: TQRDBText;
    QRDBText47: TQRDBText;
    QRFoot5: TQRBand;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    qyConsultaCOMTASAMOR: TFloatField;
    QRLbIntProTrans: TQRLabel;
    QRIntProTrans: TQRLabel;
    QRlbIntVigTrans: TQRLabel;
    QRLabel46: TQRLabel;
    QRIntVigTrans: TQRLabel;
    QRIntVigIVATrans: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel42: TQRLabel;
    QRDBText48: TQRDBText;
    QRDBText14: TQRDBText;
    qyEncabezadoIMP_MOR_INTERES: TFloatField;
    qyEncabezadoIMP_IVA_MOR_INT: TFloatField;
    qyConsultaINTTASAMOR: TFloatField;
    QRLabel43: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRBand1: TQRBand;
    QRDBText53: TQRDBText;
    QRDBText54: TQRDBText;
    QRDBText55: TQRDBText;
    qrdbTasa: TQRDBText;
    QRDBText61: TQRDBText;
    QRDBText62: TQRDBText;
    QRDBText63: TQRDBText;
    qrdbIvaVenc: TQRDBText;
    QRDBText65: TQRDBText;
    QRDBText66: TQRDBText;
    qrdbUltPag: TQRDBText;
    qrTasaMoras: TQRLabel;
    QRDBText1: TQRDBText;
    QRShape14: TQRShape;
    QRShape11: TQRShape;
    QRLabel49: TQRLabel;
    qyConsultaREFERENCIA: TStringField;
    QRShape17: TQRShape;
    QRLabel63: TQRLabel;
    QRTotalAdeudoPrVe: TQRLabel;
    QRFinAdic: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel105: TQRLabel;
    QRLabel107: TQRLabel;
    QRLabel120: TQRLabel;
    QRShape18: TQRShape;
    QRLabel121: TQRLabel;
    QRLabel122: TQRLabel;
    QRLabel123: TQRLabel;
    QRLabel124: TQRLabel;
    QRShape24: TQRShape;
    qrdbTasaMoras: TQRDBText;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure Group3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure Group7BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure Group1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFoot1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFoot2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure Group5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFoot3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup7BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure Group9BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFoot4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFoot5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure Group10BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
  public
   dSumaINTVENCIDO, dSumaINTIVAVENCIDO, dSumaBENEFICIO : Double;
   dSumaCAPVENCIDO, dSumaCAPMORATORIOS, dSumaCAPIVAMORA, dSumaBENEFICIO_1: Double;
   dSumaREFINAN01, dSumaREFINAN02, dSumaREFINAN03 : Double;
   dSumaCOMVENCIDO, dSumaCOMMORATORIOS, dSumaCOMIVAMORA: Double;
   dSumaCOMVENCIDO_TOT,  dSumaCOMMORATORIOS_TOT, dSumaCOMIVAMORA_TOT : Double;
   dINTTASAMOR,dCAPTASA,dCAPTASAMOR,dCOMTASAMOR :Double;

   VGInteres : Double;
   VGInteresIva : Double;

   VGInteresTrans : Double;
   VGInteresIvaTrans : Double;

   VGInteresProy : Double;
   VGInteresIvaProy : Double;

   VGTasaTrans: String;

   VGIntProyTrans : Double;
   VGIntIvaProyTrans : Double;

   VGTasaProyTrans: String;

   VGFechaIni : String;

   {ROIM 18112005 PASA EL PARAMETRO DE NIVELACI�N}
   BNivela :String;
   {/ROIM}


     Apli : TInterApli;
     Function  LlenaEncabezado( sCesion,sFechaIni, sFechaFin :String; pAPli : TInterApli) : String;
     Function  LlenaConsulta( sCesion,sFechaIni, sFechaFin,
                              sEmpresa, sSucursal :String; pAPli : TInterApli) : String;

     Function  CalculoTasa(vlidcredito, vlperiodo:integer):single;
     Procedure Intereses;

     Function ReferenciaDigVer(strReferencia : String; Apli : TInterApli) : String;
     Procedure HabilitaGrupos;
     Function ObtieneTasa(dCredito: Double; dPeriodo : Integer; sAccesorio: String):Double;
     Function ObtieneTasaMoras(dCredito: Double;dPeriodo : Integer; sAccesorio: String):Double;

  end;

var
  QrTasaActB: TQrTasaActB;

Procedure EjecutarReporteProAdeudo(sCesion,sFechaIni, sFechaFin,
                                   sEmpresa, sSucursal:String;
                                   {ROIM 18112005 PASA EL PARAMETRO DE NIVELACI�N}
                                   BNivela:String;
                                   {/ROIM}
                                   pAPli     : TInterApli;
                                   pPreview  : Boolean);
Implementation
{$R *.DFM}

Procedure EjecutarReporteProAdeudo(sCesion,sFechaIni, sFechaFin,
                            sEmpresa, sSucursal :String;
                            {ROIM 18112005 PASA EL PARAMETRO DE NIVELACI�N}
                            BNivela:String;
                            {/ROIM}
                            pAPli     : TInterApli;
                            pPreview  : Boolean);
Var
    QrTasaActB   : TQrTasaActB;
    Preview     : TIntQRPreview;
Begin
      QrTasaActB   := TQrTasaActB.Create(Nil);
      Preview := TIntQRPreview.CreatePreview(Application, QrTasaActB);
      QrTasaActB.Apli := pAPli;
      Try

        {ROIM 18112005 PASA EL PARAMETRO DE NIVELACI�N}
        QrTasaActB.BNivela := BNivela;
        {/ROIM}

        QrTasaActB.QRInterEncabezado1.Apli:=pApli;
        QrTasaActB.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
        QrTasaActB.QRInterEncabezado1.NomReporte:='IntMQrTasaAct';

        QrTasaActB.VGFechaIni := sFechaIni;

        QrTasaActB.QRInterEncabezado1.Titulo1:='Reporte Pron�stico de Adeudo ' + sCesion;
        If Trim(sFechaIni)<>'' Then
           QrTasaActB.QRInterEncabezado1.Titulo2:='Pron�stico al ' + Trim(sFechaIni)
        Else
           QrTasaActB.QRInterEncabezado1.Titulo2:='Pron�stico al ' + DateToStr(pAPli.DameFechaEmpresa);

        QrTasaActB.QRLabel89.Caption := 'Adeudo Vigente al : ' + DateToStr(pAPli.DameFechaEmpresa);
        QrTasaActB.QRLabel26.Caption := 'Programado al : ' + Trim(sFechaIni);
        QrTasaActB.QRLabel64.Caption := 'Pago Total al : ' + Trim(sFechaIni);

        QrTasaActB.qyEncabezado.DatabaseName := pApli.DataBaseName;
        QrTasaActB.qyEncabezado.SessionName := pApli.SessionName;
        QrTasaActB.qyEncabezado.Active:=False;
        QrTasaActB.qyEncabezado.SQL.Text:= QrTasaActB.LlenaEncabezado(sCesion,sFechaIni,sFechaFin,pAPli );
        QrTasaActB.qyEncabezado.SQL.SaveToFile('c:\qyEncabezado.txt');
        QrTasaActB.qyEncabezado.Active:=True;

        QrTasaActB.qyConsulta.DatabaseName := pApli.DataBaseName;
        QrTasaActB.qyConsulta.SessionName := pApli.SessionName;
        QrTasaActB.qyConsulta.Active:=False;
        QrTasaActB.qyConsulta.SQL.Text:= QrTasaActB.LlenaConsulta(sCesion,sFechaIni,sFechaFin,
                                        sEmpresa, sSucursal,pAPli );
        QrTasaActB.qyConsulta.SQL.SaveToFile('c:\qyConsulta.txt');
        QrTasaActB.qyConsulta.Active:=True;

        If pPreview Then
            QrTasaActB.Preview
        Else
            QrTasaActB.Print;
    Finally
        QrTasaActB.free;
        If Assigned(Preview) Then Preview.Free;
    End;
End;

Function TQrTasaActB.LlenaEncabezado(sCesion,sFechaIni, sFechaFin:String; pAPli : TInterApli) : String;
Var
    sSQL1:String;
    sSQL2:String;
    sSQL21:String;
    sSQL22:String;
    sSQL3:String;
Begin
    sSQL1:=' SELECT ' + coCRLF +
           '       PERINT.PERIODOINT,CRD.ID_CREDITO, CRD.ID_CONTRATO, CONT.ID_TITULAR, PER.NOMBRE, CALLE_NUMERO, CODIGO_POSTAL,COLONIA, POB1.DESC_POBLACION AS CIUDAD, ' + coCRLF +
           '       POB2.DESC_POBLACION AS ESTADO, POB3.DESC_POBLACION AS PAIS, ' + coCRLF +
           '       (SUBSTR((PKGCRPERIODO.STPObtchqCte(CONT.ID_TITULAR,DECODE(CP.CVE_SUB_DIVISION, NULL,''0''), '+ coCRLF +
           '       CRD.ID_CREDITO,''AC'',''AD'',''CR'')),1,20)) AS CHEQUERA, '  + coCRLF +
           '       (CRCONT.CVE_PRODUCTO_CRE||''   ''||PROD.DESC_L_PRODUCTO) AS PRODUCTO, CONT.CVE_MONEDA, MON.DESC_MONEDA, ' + coCRLF +
           '       CRD.IMP_CREDITO,' + coCRLF +
           '       DECODE(CRD.CVE_TASA_REFER,''FIJA'',CRD.CVE_TASA_REFER||'' AL ''||CRD.TASA_BASE||''''||CRD.OPERADOR_STASA||''''||CRD.SOBRETASA||''%'', ' + coCRLF +
           '       TAFIN.DESC_TASA_INDIC||''   ''||CRD.CVE_TASA_REFER||''   ''||CRD.OPERADOR_STASA||''   ''||CRD.SOBRETASA||''%'') AS TASAPACTADA, ' + coCRLF +
           '       PERINT.TASA_APLICADA, ' + coCRLF +
           '       (CRD.CVE_CALCULO||''   ''||CALC.DESC_CALCULO) AS CALCULO, ' + coCRLF +
           '       (CRD.CVE_AMORTIZACION||''   ''||AMOR.DESC_AMORTIZA) AMORTIZACION, ' + coCRLF +
           '       (CRD.CVE_PAG_INTERES||''   ''||PAGINT.DESC_PAG_INTERES) FORMPAGINTER, ' + coCRLF +
           '       (PERCAP.PERIODOCAP||''  Con vencimiento al   ''||PERCAP.FECHVENCAP) AS PERIODOCAPITAL, ' + coCRLF +
           '       (PERINT.PERIODOINT||''  Con vencimiento al   ''||PERINT.FECHVENINT ) AS PERIODOINTERES, ' + coCRLF +
           '       CRD.FACT_MORAS, DECODE(CRD.B_APLICA_IVA,''F'',''NO'',''V'',''SI'','''',''NO'') AS APLICAIVA, ' + coCRLF +
           '       DECODE(CRCONT.B_REVOLVENTE,''F'',''NO'',''V'',''SI'','''',''NO'') AS REVOLVENTE, ' + coCRLF +
           '       CRD.F_AUTORIZA, CRD.F_INICIO,CRD.F_VENCIMIENTO, ' + coCRLF ;
           //SALDOS VIGENTES
{ROIM 18112005 SE AGREGA PARAMETRO DE TIPO DE NIVELACI�N}
    if BNivela = 'T' then
    begin
           sSQL1:= sSQL1 +
           '       CRD.SDO_INSOLUTO, ' + coCRLF +
//HERJA ENERO 2013
//           '       (NVL(PERCAP.IMP_CAPITAL,0) - NVL(PERCAP.IMP_PAGADO,0)) AS CAPITAL_VIG, ' + coCRLF +
           '       (NVL(PERCAP.IMP_CAPITAL,0) - NVL(PERCAP.IMP_PAGADO,0) + NVL(CA_HIST_PGDMCP2.IMP_HIST_PGDMCP,0) ) AS CAPITAL_VIG, ' + coCRLF +
           //
           '       (NVL(PERFIN.IMP_FINAN_ADIC,0) - NVL(PERFIN.IMP_PAGADO,0)) AS SDO_FINAN_ADIC, ' + coCRLF +
           '       0 AS IMP_INTERES,  0 AS IMP_IVA_INTERES, ' + coCRLF +
           '       (NVL(PERCOM.IMP_COMISION,0) - NVL(PERCOM.IMP_PAGADO,0)) AS IMP_COMISION, (NVL(PERCOM.IMP_IVACOM,0) - NVL(PERCOM.IMP_IVA_PAGADO,0)) AS IMP_IVACOM,  ' + coCRLF;
    end
    else if BNivela = 'N' then
    begin
           sSQL1:= sSQL1 +
           '       CRD.IMP_CREDITO AS SDO_INSOLUTO, ' + coCRLF +
           '       (NVL(PERCAP.IMP_CAPITAL,0)) AS CAPITAL_VIG, ' + coCRLF +
           '       (NVL(PERFIN.IMP_FINAN_ADIC,0)) AS SDO_FINAN_ADIC, ' + coCRLF +
           '       (NVL(PERINT.IMP_INTERES,0)) AS IMP_INTERES, (NVL(PERINT.IMP_IVA,0) ) AS IMP_IVA_INTERES,  ' + coCRLF +
           '       (NVL(PERCOM.IMP_COMISION,0)) AS IMP_COMISION, (NVL(PERCOM.IMP_IVACOM,0)) AS IMP_IVACOM,  ' + coCRLF;
    end;
{/ROIM}

           sSQL1:= sSQL1 +
           '       0  AS ADEUDOVIGENTE, ' + coCRLF +
           //SALDOS PROGRAMADO
           //HERJA ENERO 2013
//           '       (NVL(PERCAPP.IMP_CAPITAL,0) - NVL(PERCAPP.IMP_PAGADO,0)) AS CAPITALPROG, ' + coCRLF +
           '       (NVL(PERCAPP.IMP_CAPITAL,0) - NVL(PERCAPP.IMP_PAGADO,0) + NVL(CA_HIST_PGDMCP3.IMP_HIST_PGDMCP,0) ) AS CAPITALPROG, ' + coCRLF +
//
           '       (NVL(PERFINP.IMP_FINAN_ADIC,0) - NVL(PERFINP.IMP_PAGADO,0)) AS SDO_FINAN_ADICPROG, ' + coCRLF;
{ROIM 18112005 SE AGREGA PARAMETRO DE TIPO DE NIVELACI�N}
    if BNivela = 'T' then
    begin
           sSQL1:= sSQL1 +
           '       (PERINTP.NUM_PERIODO) AS PER_INTERESPROG, ' + coCRLF ;
    end
    else if BNivela = 'N' then
    begin
           sSQL1:= sSQL1 +
           '       (NVL(PERINTP.IMP_INTERES,0) - NVL(PERINTP.IMP_PAGADO,0) + NVL(PERINTP.IMP_IVA ,0)  - NVL(PERINTP.IMP_IVA_PAGADO ,0)) AS PER_INTERESPROG, ' + coCRLF;
    end;
{/ROIM}
           sSQL1:= sSQL1 +
           '       (NVL(PERCOMP.IMP_COMISION,0) - NVL(PERCOMP.IMP_PAGADO,0)) AS IMP_COMISIONPROG, (NVL(PERCOMP.IMP_IVACOM,0) - NVL(PERCOMP.IMP_IVA_PAGADO,0)) AS IMP_IVACOMPROG,  ' + coCRLF +
           //SALDOS VENCIDOS
//HERJA ENERO 2013
//           '       PERCAPV.IMP_CAPITAL_VDO, PERCAPV.IMP_MOR_CAPITAL, PERCAPV.IMP_IVA_MOR_CAP,  ' + coCRLF +
           '       (PERCAPV.IMP_CAPITAL_VDO + NVL(CA_HIST_PGDMCP.IMP_HIST_PGDMCP,0)) AS IMP_CAPITAL_VDO, PERCAPV.IMP_MOR_CAPITAL, PERCAPV.IMP_IVA_MOR_CAP,  ' + coCRLF +
//
           '       PERFINV.IMP_VDO_FINAN_A, PERFINV.IMP_MOR_FINAN_A, PERFINV.IMP_IVA_MOR_FIN, ' + coCRLF +
           '       PERINTV.IMP_INTERES_VDO, PERINTV.IMP_IVA_INT_VDO, PERINTV.IMP_MOR_INTERES, PERINTV.IMP_IVA_MOR_INT  , ' + coCRLF +//EASA4011  26102005
           '       PERCOMV.IMP_COMISION_VDO, PERCOMV.IMP_IVA_COM_VDO, PERCOMV.IMP_MOR_COMISION, PERCOMV.IMP_IVA_MOR_COM, ' + coCRLF +
           '       (NVL(PERCAPV.IMP_CAPITAL_VDO,0) + NVL(PERCAPV.IMP_MOR_CAPITAL,0) + NVL(PERCAPV.IMP_IVA_MOR_CAP,0) +  ' + coCRLF +
           '        NVL(PERFINV.IMP_VDO_FINAN_A,0) + NVL(PERFINV.IMP_MOR_FINAN_A,0) + NVL(PERFINV.IMP_IVA_MOR_FIN,0) + ' + coCRLF +
           '        NVL(PERINTV.IMP_INTERES_VDO,0) + NVL(PERINTV.IMP_IVA_INT_VDO,0) + NVL(PERINTV.IMP_MOR_INTERES,0) + NVL(PERINTV.IMP_IVA_MOR_INT,0) + ' +coCRLF +
//HERJA ENERO 2013
//           '        NVL(PERCOMV.IMP_COMISION_VDO,0)+ NVL(PERCOMV.IMP_IVA_COM_VDO,0) + NVL(PERCOMV.IMP_MOR_COMISION,0)+ NVL(PERCOMV.IMP_IVA_MOR_COM,0)) AS ADEUDOVENCIDO,  ' + coCRLF +
           '        NVL(PERCOMV.IMP_COMISION_VDO,0)+ NVL(PERCOMV.IMP_IVA_COM_VDO,0) + NVL(PERCOMV.IMP_MOR_COMISION,0)+ NVL(PERCOMV.IMP_IVA_MOR_COM,0) + NVL(CA_HIST_PGDMCP.IMP_HIST_PGDMCP,0) ) AS ADEUDOVENCIDO,  ' + coCRLF +
//
           //SALDO TOTAL
           '       0 AS TOTALADEUDO, ' + coCRLF +
           //OTROS DATOS
           '       NVL(CI.TASA_APLICADA,CRD.TASA_CREDITO) TASA_ACTUAL, ' + coCRLF +
           '       CRD.TASA_CREDITO '+ coCRLF  ;
    sSQL2:=
           ' FROM ' + coCRLF +
           '       CR_CREDITO CRD, CONTRATO CONT, PERSONA PER, DOMICILIO DOM,POBLACION POB1,POBLACION POB2, POBLACION POB3, ' + coCRLF +
           '       CR_CONTRATO CRCONT, CR_PRODUCTO PROD, MONEDA MON,TASA_INDIC_FINAN TAFIN, '+ coCRLF +
           '       CR_CALCULO_INT CALC, CR_AMORTIZACION AMOR, CR_PAGO_INTERES PAGINT, ' + coCRLF +
           //CAPITAL VIG
//HERJA ENERO 2013
//           '       (SELECT ID_CREDITO,MAX(NUM_PERIODO) AS PERIODOCAP, MAX(F_VENCIMIENTO) AS FECHVENCAP, SUM(IMP_CAPITAL) AS IMP_CAPITAL, ' + coCRLF +
           '       (SELECT ID_CREDITO,MIN(NUM_PERIODO) AS MINPERCAP,MAX(NUM_PERIODO) AS PERIODOCAP, MAX(F_VENCIMIENTO) AS FECHVENCAP, SUM(IMP_CAPITAL) AS IMP_CAPITAL, ' + coCRLF +
//
           '               SUM(NVL(PKGCRCOMUN.STPOBTIMPPAGADO(''CP'',''IMPBRU'',ID_CREDITO,NUM_PERIODO,NULL,' + SQLFecha(StrToDate(sFechaIni )) + ',''V''),0)) AS IMP_PAGADO ' + coCRLF +
           '        FROM CR_CAPITAL ' + coCRLF +
           '        WHERE ID_CREDITO = '+ sCesion + coCRLF +
           '          AND ' + SQLFecha(StrToDate(sFechaIni )) + ' BETWEEN  F_VENCIMIENTO - (PLAZO-1) AND F_VENCIMIENTO ' + coCRLF +
//f_p vs f_v           '  AND TO_DATE(' + #39 + sFechaIni + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 +') BETWEEN  F_VENCIMIENTO - (PLAZO-1) AND F_PROG_PAGO ' +
           '        GROUP BY ID_CREDITO) PERCAP, ' + coCRLF +
// HERJA 2013
	   '-- HERJA  ' + coCRLF +
           '        ( ' + coCRLF +
           '             SELECT CT.ID_CREDITO, CT.ID_PERIODO, ' + coCRLF +
           '                NVL(SUM(CDT.IMP_CONCEPTO),0) AS IMP_HIST_PGDMCP ' + coCRLF +
           '           FROM CR_TRANSACCION CT, CR_DET_TRANSAC CDT ' + coCRLF +
           '          WHERE 1=1 ' + coCRLF +
           '            AND CT.SIT_TRANSACCION = ''AC'' ' + coCRLF +
           '            AND CT.ID_TRANS_CANCELA IS NULL ' + coCRLF +
           '            AND CT.ID_TRANSACCION = CDT.ID_TRANSACCION ' + coCRLF +
           '            AND CT.CVE_OPERACION IN (''PGDMCP'') ' + coCRLF +
           '            AND CDT.CVE_CONCEPTO IN (''IMPBRU'') ' + coCRLF +
           '            AND CT.ID_CREDITO = '+ sCesion + coCRLF +
           '          GROUP BY CT.ID_CREDITO, CT.ID_PERIODO ' + coCRLF +
           '            ) CA_HIST_PGDMCP2, ' + coCRLF +
           '            -- FIN HERJA ' + coCRLF +
//FIN HERJA           
           //INTERES VIG
           '       (SELECT ID_CREDITO,MAX(NUM_PERIODO) AS PERIODOINT,MAX(F_VENCIMIENTO) AS FECHVENINT, ' + coCRLF +
           '               SUM(IMP_INTERES) AS IMP_INTERES, SUM(NVL(PKGCRCOMUN.STPOBTIMPPAGADO(''IN'',''IMPBRU'',ID_CREDITO,NUM_PERIODO,NULL,' + SQLFecha(StrToDate(sFechaIni )) + ',''V''),0)) AS IMP_PAGADO, ' + coCRLF +
           '               SUM(IMP_IVA) AS IMP_IVA, SUM(NVL(PKGCRCOMUN.STPOBTIMPPAGADO(''IN'',''IMPIVA'',ID_CREDITO,NUM_PERIODO,NULL,' + SQLFecha(StrToDate(sFechaIni )) + ',''V''),0)) AS IMP_IVA_PAGADO, ' + coCRLF +
           '               MAX(TASA_APLICADA) as TASA_APLICADA ' + coCRLF +
           '        FROM CR_INTERES ' + coCRLF +
           '        WHERE ID_CREDITO = '+ sCesion + coCRLF;
{ROIM 18112005 SE AGREGA PARAMETRO DE TIPO DE NIVELACI�N}
    if BNivela = 'T' then
    begin
       sSQL2:= sSQL2 +
           '          AND ' + SQLFecha(StrToDate(sFechaIni )) + ' BETWEEN  F_VENCIMIENTO - (PLAZO-1) AND F_VENCIMIENTO ' + coCRLF;
    end;
{/ROIM}
       sSQL2:= sSQL2 +
//f_p vs f_v           '  AND TO_DATE(' + #39 + sFechaIni + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 +') BETWEEN  F_VENCIMIENTO - (PLAZO-1) AND F_PROG_PAGO ' +
           '        GROUP BY ID_CREDITO) PERINT, ' + coCRLF +
           //COMISION VIG
           '       (SELECT ID_CREDITO,MAX(NUM_PERIODO) AS PERIODOCOM,MAX(F_VENCIMIENTO) AS FECHVENCOM, ' + coCRLF +
           '               SUM(IMP_COMISION) AS IMP_COMISION,  ' + coCRLF +
//ROIM JULIO 2009 CORRECCI�N PARA CONSIDERAR CLAVE DE COMISION
//           '               SUM(NVL(PKGCRCOMUN.STPOBTIMPPAGADO(''CN'',''IMPBRU'',ID_CREDITO,NUM_PERIODO,NULL,' + SQLFecha(StrToDate(sFechaIni )) + ',''V''),0)) AS IMP_PAGADO, '+ coCRLF +
           '               SUM(NVL(PKGCRCOMUN.STPOBTIMPPAGADO(''CN'',''IMPBRU'',ID_CREDITO,NUM_PERIODO,CVE_COMISION,' + SQLFecha(StrToDate(sFechaIni )) + ',''V''),0)) AS IMP_PAGADO, '+ coCRLF +
//           '               SUM(IMP_IVA) AS IMP_IVACOM, SUM(NVL(PKGCRCOMUN.STPOBTIMPPAGADO(''CN'',''IMPIVA'',ID_CREDITO,NUM_PERIODO,NULL,' + SQLFecha(StrToDate(sFechaIni )) + ',''V''),0)) AS IMP_IVA_PAGADO '+ coCRLF +
           '               SUM(IMP_IVA) AS IMP_IVACOM, SUM(NVL(PKGCRCOMUN.STPOBTIMPPAGADO(''CN'',''IMPIVA'',ID_CREDITO,NUM_PERIODO,CVE_COMISION,' + SQLFecha(StrToDate(sFechaIni )) + ',''V''),0)) AS IMP_IVA_PAGADO '+ coCRLF +
//// ROIM
           '        FROM CR_COMISION ' + coCRLF +
           '        WHERE ID_CREDITO = '+ sCesion + coCRLF ;
{ROIM 18112005 SE AGREGA PARAMETRO DE TIPO DE NIVELACI�N}
    if BNivela = 'T' then
    begin
       sSQL2:= sSQL2 +
{ROIM 15/07/2009 SE CORRIGE QUE SOLO CONSIDERE LAS COMISIONES VIGENTES}
//           '          AND ' + SQLFecha(StrToDate(sFechaIni )) + ' BETWEEN  F_ALTA AND F_VENCIMIENTO ' + coCRLF;
           '          AND ' + SQLFecha(StrToDate(sFechaIni )) + ' = F_VENCIMIENTO ' + coCRLF;
{//ROIM}
    end;
{/ROIM}
//f_p vs f_v           '  AND TO_DATE(' + #39 + sFechaIni + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 +') BETWEEN  F_ALTA AND F_PROG_PAGO ' +
{ROIM 18112005 SE AGREGA PARAMETRO DE TIPO DE NIVELACI�N}
    if BNivela = 'T' then
    begin
       sSQL2:= sSQL2 +
           '          AND SIT_COMISION NOT IN (''LQ'',''CA'')' + coCRLF; //EASA4011    17/06/2005
    end
    else if BNivela = 'N' then
    begin
       sSQL2:= sSQL2 +
           '          AND SIT_COMISION NOT IN (''CA'')' + coCRLF; //EASA4011    17/06/2005
    end;
{/ROIM}
       sSQL2:= sSQL2 +
           '        GROUP BY ID_CREDITO) PERCOM, ' + coCRLF +
           //FINAN VIG
           '       (SELECT ID_CREDITO,MAX(NUM_PERIODO) AS PERIODOREF, MAX(F_VENCIMIENTO) AS FECHVENCAP, ' + coCRLF +
           '               SUM(IMP_FINAN_ADIC) AS IMP_FINAN_ADIC, SUM(NVL(PKGCRCOMUN.STPOBTIMPPAGADO(''FN'',''IMPBRU'',ID_CREDITO,NUM_PERIODO,NULL,' + SQLFecha(StrToDate(sFechaIni )) + ',''V''),0)) AS IMP_PAGADO ' + coCRLF +
           '        FROM CR_FINAN_ADIC ' + coCRLF +
           '        WHERE ID_CREDITO = '+ sCesion + coCRLF +
           '          AND ' + SQLFecha(StrToDate(sFechaIni )) + ' BETWEEN  F_VENCIMIENTO - (PLAZO-1) AND F_VENCIMIENTO ' + coCRLF +
//f_p vs f_v           '  AND TO_DATE(' + #39 + sFechaIni + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 +') BETWEEN  F_VENCIMIENTO - (PLAZO-1) AND F_PROG_PAGO ' +
           '        GROUP BY ID_CREDITO) PERFIN, '+ coCRLF ;


    sSQL22:=
           //CAPITAL PROG
//HERJA ENERO 2013
//           '       (SELECT ID_CREDITO, SUM(IMP_CAPITAL) AS IMP_CAPITAL, SUM(NVL(PKGCRCOMUN.STPOBTIMPPAGADO(''CP'',''IMPBRU'',ID_CREDITO,NUM_PERIODO,NULL,' + SQLFecha(StrToDate(sFechaIni )) + ',''V''),0)) AS IMP_PAGADO ' + coCRLF +
           '       (SELECT ID_CREDITO, MIN(NUM_PERIODO) AS MINPERCAP, MAX(NUM_PERIODO) AS MAXPERCAP, SUM(IMP_CAPITAL) AS IMP_CAPITAL, SUM(NVL(PKGCRCOMUN.STPOBTIMPPAGADO(''CP'',''IMPBRU'',ID_CREDITO,NUM_PERIODO,NULL,' + SQLFecha(StrToDate(sFechaIni )) + ',''V''),0)) AS IMP_PAGADO ' + coCRLF +
//
           '        FROM CR_CAPITAL ' + coCRLF +
           '        WHERE ID_CREDITO = '+ sCesion + coCRLF +
           '          AND ' + SQLFecha(StrToDate(sFechaIni )) + ' = F_VENCIMIENTO ' + coCRLF +
//f_p vs f_v           '  AND TO_DATE(' + #39 + sFechaIni + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 +') BETWEEN F_VENCIMIENTO AND F_PROG_PAGO ' +
           '        GROUP BY ID_CREDITO) PERCAPP, ' + coCRLF +
// HERJA 2013
	   '-- HERJA  ' + coCRLF +
           '        ( ' + coCRLF +
           '             SELECT CT.ID_CREDITO, CT.ID_PERIODO, ' + coCRLF +
           '                NVL(SUM(CDT.IMP_CONCEPTO),0) AS IMP_HIST_PGDMCP ' + coCRLF +
           '           FROM CR_TRANSACCION CT, CR_DET_TRANSAC CDT ' + coCRLF +
           '          WHERE 1=1 ' + coCRLF +
           '            AND CT.SIT_TRANSACCION = ''AC'' ' + coCRLF +
           '            AND CT.ID_TRANS_CANCELA IS NULL ' + coCRLF +
           '            AND CT.ID_TRANSACCION = CDT.ID_TRANSACCION ' + coCRLF +
           '            AND CT.CVE_OPERACION IN (''PGDMCP'') ' + coCRLF +
           '            AND CDT.CVE_CONCEPTO IN (''IMPBRU'') ' + coCRLF +
           '            AND CT.ID_CREDITO = '+ sCesion + coCRLF +
           '          GROUP BY CT.ID_CREDITO, CT.ID_PERIODO ' + coCRLF +
           '            ) CA_HIST_PGDMCP3, ' + coCRLF +
           '            -- FIN HERJA ' + coCRLF +
//FIN HERJA           
           //INTERES PROG
           '       (SELECT ID_CREDITO,MAX(NUM_PERIODO) AS NUM_PERIODO, ' + coCRLF +
           '               SUM(IMP_INTERES) AS IMP_INTERES, SUM(NVL(PKGCRCOMUN.STPOBTIMPPAGADO(''IN'',''IMPBRU'',ID_CREDITO,NUM_PERIODO,NULL,' + SQLFecha(StrToDate(sFechaIni )) + ',''V''),0)) AS IMP_PAGADO, ' + coCRLF +
           '               SUM(IMP_IVA) AS IMP_IVA, SUM(NVL(PKGCRCOMUN.STPOBTIMPPAGADO(''IN'',''IMPIVA'',ID_CREDITO,NUM_PERIODO,NULL,' + SQLFecha(StrToDate(sFechaIni )) + ',''V''),0)) AS IMP_IVA_PAGADO' + coCRLF +
           '        FROM CR_INTERES  ' + coCRLF +
           '        WHERE ID_CREDITO = '+ sCesion + coCRLF +
           '          AND ' + SQLFecha(StrToDate(sFechaIni )) + ' = F_VENCIMIENTO ' + coCRLF +
//f_p vs f_v           '  AND TO_DATE(' + #39 + sFechaIni + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 +') BETWEEN F_VENCIMIENTO AND F_PROG_PAGO ' +
           '        GROUP BY ID_CREDITO) PERINTP, ' + coCRLF +
           //COMISION PROG
           '       (SELECT ID_CREDITO,MAX(NUM_PERIODO) AS PERIODOCOM,MAX(F_VENCIMIENTO) AS FECHVENCOM, ' + coCRLF +
//ROIM JULIO 2009 CORRECCI�N PARA CONSIDERAR CLAVE DE COMISION
//           '               SUM(IMP_COMISION) AS IMP_COMISION, SUM(NVL(PKGCRCOMUN.STPOBTIMPPAGADO(''CN'',''IMPBRU'',ID_CREDITO,NUM_PERIODO,NULL,' + SQLFecha(StrToDate(sFechaIni )) + ',''V''),0)) AS IMP_PAGADO, '+ coCRLF +
           '               SUM(IMP_COMISION) AS IMP_COMISION, SUM(NVL(PKGCRCOMUN.STPOBTIMPPAGADO(''CN'',''IMPBRU'',ID_CREDITO,NUM_PERIODO,CVE_COMISION,' + SQLFecha(StrToDate(sFechaIni )) + ',''V''),0)) AS IMP_PAGADO, '+ coCRLF +
//           '               SUM(IMP_IVA) AS IMP_IVACOM, SUM(NVL(PKGCRCOMUN.STPOBTIMPPAGADO(''CN'',''IMPIVA'',ID_CREDITO,NUM_PERIODO,NULL,' + SQLFecha(StrToDate(sFechaIni )) + ',''V''),0)) AS IMP_IVA_PAGADO '+ coCRLF +
           '               SUM(IMP_IVA) AS IMP_IVACOM, SUM(NVL(PKGCRCOMUN.STPOBTIMPPAGADO(''CN'',''IMPIVA'',ID_CREDITO,NUM_PERIODO,CVE_COMISION,' + SQLFecha(StrToDate(sFechaIni )) + ',''V''),0)) AS IMP_IVA_PAGADO '+ coCRLF +
////ROIM
           '        FROM CR_COMISION ' + coCRLF +
           '        WHERE ID_CREDITO = '+ sCesion + coCRLF +
           '          AND SIT_COMISION NOT IN (''CA'')'+ coCRLF +
           '          AND ' + SQLFecha(StrToDate(sFechaIni )) + ' = F_VENCIMIENTO ' + coCRLF +
//f_p vs f_v           '  AND TO_DATE(' + #39 + sFechaIni + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 +') BETWEEN F_VENCIMIENTO AND F_PROG_PAGO ' +
           '        GROUP BY ID_CREDITO) PERCOMP, ' + coCRLF +
           //FINAN PROG
           '       (SELECT ID_CREDITO,MAX(NUM_PERIODO) AS PERIODOREF, MAX(F_VENCIMIENTO) AS FECHVENCAP, ' +
           '                SUM(IMP_FINAN_ADIC) AS IMP_FINAN_ADIC, SUM(NVL(PKGCRCOMUN.STPOBTIMPPAGADO(''FN'',''IMPBRU'',ID_CREDITO,NUM_PERIODO,NULL,' + SQLFecha(StrToDate(sFechaIni )) + ',''V''),0)) AS IMP_PAGADO ' + coCRLF +
           '        FROM CR_FINAN_ADIC ' + coCRLF +
           '        WHERE ID_CREDITO = '+ sCesion + coCRLF +
           '          AND ' + SQLFecha(StrToDate(sFechaIni )) + ' = F_VENCIMIENTO ' + coCRLF +
//f_p vs f_v           '  AND TO_DATE(' + #39 + sFechaIni + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 +') BETWEEN F_VENCIMIENTO AND F_PROG_PAGO ' +
           '        GROUP BY ID_CREDITO) PERFINP, '+ coCRLF ;

    sSQL21:=
           //CAPITAL VEN
//HERJA 2013
//           '       (SELECT ID_CREDITO, SUM(IMP_CAPITAL - ' +
           '       (SELECT ID_CREDITO, MIN(NUM_PERIODO) AS MINPERCAP, MAX(NUM_PERIODO) AS MAXPERCAP, SUM(IMP_CAPITAL - ' +
//
           '               NVL(PKGCRCOMUN.STPOBTIMPPAGADO(''CP'',''IMPBRU'',ID_CREDITO,NUM_PERIODO,NULL,' +
                                                          SQLFecha(StrToDate(sFechaIni )) + ',''V''),0)) AS IMP_CAPITAL_VDO, ' + coCRLF +
           '               SUM(PKGCRPERIODO.FUNOBTENMORA(1,''V'',ID_CREDITO ,NUM_PERIODO ,NULL,NULL,'+ coCRLF +
                                                          SQLFecha(StrToDate(sFechaIni )) + ' ,NULL))    AS IMP_MOR_CAPITAL,'+ coCRLF +
           '               SUM(PKGCRPERIODO.FUNOBTENMORA(1,''F'',ID_CREDITO ,NUM_PERIODO ,NULL,NULL,'+ coCRLF +
                                                          SQLFecha(StrToDate(sFechaIni )) + ' ,NULL))    AS IMP_IVA_MOR_CAP'+ coCRLF +
           '        FROM CR_CAPITAL ' + coCRLF +
           '        WHERE ID_CREDITO = '+ sCesion + coCRLF +
           '          AND TO_DATE(' + #39 + sFechaIni + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 +') > F_VENCIMIENTO ' + coCRLF +
//f_p vs f_v           '  AND TO_DATE(' + #39 + sFechaIni + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 +') > F_PROG_PAGO ' +
//           '          AND IMP_CAPITAL - IMP_PAGADO > 0' + coCRLF +   //HERJA
           '          AND SIT_CAPITAL IN (''IM'') ' +coCRLF +   //HERJA
           '        GROUP BY ID_CREDITO) PERCAPV, ' + coCRLF +
// HERJA 2013
	   '-- HERJA  ' + coCRLF +
           '        ( ' + coCRLF +
           '             SELECT CT.ID_CREDITO, CT.ID_PERIODO, ' + coCRLF +
           '                NVL(SUM(CDT.IMP_CONCEPTO),0) AS IMP_HIST_PGDMCP ' + coCRLF +
           '           FROM CR_TRANSACCION CT, CR_DET_TRANSAC CDT ' + coCRLF +
           '          WHERE 1=1 ' + coCRLF +
           '            AND CT.SIT_TRANSACCION = ''AC'' ' + coCRLF +
           '            AND CT.ID_TRANS_CANCELA IS NULL ' + coCRLF +
           '            AND CT.ID_TRANSACCION = CDT.ID_TRANSACCION ' + coCRLF +
           '            AND CT.CVE_OPERACION IN (''PGDMCP'') ' + coCRLF +
           '            AND CDT.CVE_CONCEPTO IN (''IMPBRU'') ' + coCRLF +
           '            AND CT.ID_CREDITO = '+ sCesion + coCRLF +
           '          GROUP BY CT.ID_CREDITO, CT.ID_PERIODO ' + coCRLF +
           '            ) CA_HIST_PGDMCP, ' + coCRLF +
           '            -- FIN HERJA ' + coCRLF +
//FIN HERJA           
           //INTERES VEN
           '       (SELECT ID_CREDITO, SUM(IMP_INTERES - '+coCRLF +
           '               NVL(PKGCRCOMUN.STPOBTIMPPAGADO(''IN'',''IMPBRU'',ID_CREDITO,NUM_PERIODO,NULL,' +coCRLF +
                                                         SQLFecha(StrToDate(sFechaIni )) + ',''V''),0) - NVL(IMP_CONDONA,0)) AS IMP_INTERES_VDO, ' +coCRLF +
           '               SUM(IMP_IVA - NVL(PKGCRCOMUN.STPOBTIMPPAGADO(''IN'',''IMPIVA'',ID_CREDITO,NUM_PERIODO,NULL,' +
                                                          SQLFecha(StrToDate(sFechaIni )) + ',''V''),0)) AS IMP_IVA_INT_VDO, ' +coCRLF +
           '               SUM(PKGCRPERIODO.FUNOBTENMORA(4,''V'',ID_CREDITO ,NUM_PERIODO ,NULL,NULL,'+coCRLF +
                                                          SQLFecha(StrToDate(sFechaIni)) +', NULL)) AS IMP_MOR_INTERES,'+coCRLF +
           '               SUM(PKGCRPERIODO.FUNOBTENMORA(4,''F'',ID_CREDITO ,NUM_PERIODO ,NULL,NULL,'+coCRLF +
                                                          SQLFecha(StrToDate(sFechaIni )) + ',NULL)) AS IMP_IVA_MOR_INT'+coCRLF +
           '        FROM CR_INTERES ' +coCRLF +
           '        WHERE ID_CREDITO = '+ sCesion +coCRLF +
           '          AND ' + SQLFecha(StrToDateTime(sFechaIni)) + ' > PKGCRCOMUN.STPOBTFVENCIMIENTO( ID_CREDITO, NUM_PERIODO, F_VENCIMIENTO ) ' +coCRLF +
           //HERJA 06.09.2010
           //'          AND IMP_INTERES - IMP_PAGADO > 0 ' +coCRLF +
           //'          AND (B_FINAN_ADIC IS NULL OR B_FINAN_ADIC = ''F'')' +coCRLF +
           '          AND SIT_INTERES IN (''IM'') ' +coCRLF +
           //FINHERJA 06.09.2010
           '        GROUP BY ID_CREDITO ' +coCRLF +
           '       )PERINTV, ' +coCRLF +
           //COMISION VEN
           '       (SELECT ID_CREDITO, SUM(IMP_COMISION - ' +
//ROIM JULIO 2009 CORRECCI�N PARA CONSIDERAR CLAVE DE COMISION
//           '               NVL(PKGCRCOMUN.STPOBTIMPPAGADO(''CN'',''IMPBRU'',ID_CREDITO,NUM_PERIODO,NULL,' +
//                                                          SQLFecha(StrToDate(sFechaIni )) + ',''V''),0)) AS IMP_COMISION_VDO, ' + coCRLF +
           '               NVL(PKGCRCOMUN.STPOBTIMPPAGADO(''CN'',''IMPBRU'',ID_CREDITO,NUM_PERIODO,CVE_COMISION,' +
                                                          SQLFecha(StrToDate(sFechaIni )) + ',''V''),0)) AS IMP_COMISION_VDO, ' + coCRLF +
//           '               SUM(IMP_IVA - NVL(PKGCRCOMUN.STPOBTIMPPAGADO(''CN'',''IMPIVA'',ID_CREDITO,NUM_PERIODO,NULL,' +
//                                                          SQLFecha(StrToDate(sFechaIni )) + ',''V''),0)) AS IMP_IVA_COM_VDO, ' + coCRLF +
           '               SUM(IMP_IVA - NVL(PKGCRCOMUN.STPOBTIMPPAGADO(''CN'',''IMPIVA'',ID_CREDITO,NUM_PERIODO,CVE_COMISION,' +
                                                          SQLFecha(StrToDate(sFechaIni )) + ',''V''),0)) AS IMP_IVA_COM_VDO, ' + coCRLF +
////ROIM
           '               SUM(PKGCRPERIODO.FUNOBTENMORA(2,''V'',ID_CREDITO ,NUM_PERIODO ,CVE_COMISION,NULL,'+ coCRLF +
                                                          SQLFecha(StrToDate(sFechaIni )) + ',NULL))     AS IMP_MOR_COMISION,'+ coCRLF +
           '               SUM(PKGCRPERIODO.FUNOBTENMORA(2,''F'',ID_CREDITO ,NUM_PERIODO ,CVE_COMISION,NULL,'+
                                                          SQLFecha(StrToDate(sFechaIni )) + ',NULL))     AS IMP_IVA_MOR_COM'+ coCRLF +
           '        FROM CR_COMISION ' +coCRLF +
           '        WHERE ID_CREDITO = '+ sCesion +coCRLF +
           '          AND ' + SQLFecha(StrToDate(sFechaIni )) + ' > F_VENCIMIENTO ' + coCRLF +
//f_p vs f_v           '  AND TO_DATE(' + #39 + sFechaIni + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 +') > F_PROG_PAGO ' +
//           '          AND IMP_COMISION - IMP_PAGADO > 0 ' + coCRLF +
//           '          AND SIT_COMISION NOT IN (''LQ'',''CA'')' + coCRLF + //EASA4011    17/06/2005
           '          AND SIT_COMISION IN (''IM'') ' +coCRLF +   //HERJA
           '        GROUP BY ID_CREDITO) PERCOMV, ' + coCRLF +
           //FINAN VEN
           '       (SELECT ID_CREDITO, SUM(IMP_FINAN_ADIC - '+
           '               NVL(PKGCRCOMUN.STPOBTIMPPAGADO(''FN'',''IMPBRU'',ID_CREDITO,NUM_PERIODO,NULL,' +
                                                          SQLFecha(StrToDate(sFechaIni )) + ',''V''),0)) AS IMP_VDO_FINAN_A, ' + coCRLF +
           '               SUM(PKGCRPERIODO.FUNOBTENMORA(3,''V'',ID_CREDITO ,NUM_PERIODO ,NULL,NULL,'+
                                                          SQLFecha(StrToDate(sFechaIni ))+' , NULL))     AS IMP_MOR_FINAN_A,'+ coCRLF +
           '               SUM(PKGCRPERIODO.FUNOBTENMORA(3,''F'',ID_CREDITO ,NUM_PERIODO ,NULL,NULL,'+
                                                          SQLFecha(StrToDate(sFechaIni ))+' , NULL))     AS IMP_IVA_MOR_FIN' + coCRLF +
           '        FROM CR_FINAN_ADIC ' + coCRLF +
           '        WHERE ID_CREDITO = '+ sCesion + coCRLF +
           '          AND ' + SQLFecha(StrToDate(sFechaIni ))+ ' > F_VENCIMIENTO ' + coCRLF +
//f_p vs f_v           '  AND TO_DATE(' + #39 + sFechaIni + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 +') > F_PROG_PAGO ' +
//           '          AND IMP_FINAN_ADIC - IMP_PAGADO > 0 ' + coCRLF +
           '          AND SIT_FINAN_ADIC IN (''IM'') ' +coCRLF +   //HERJA
           '        GROUP BY ID_CREDITO) PERFINV, ' + coCRLF +

           //OTROS
           '       (SELECT ID_CREDITO, TASA_APLICADA FROM CR_INTERES ' + coCRLF +
           '        WHERE SIT_INTERES = ''AC'' ) CI, '+ coCRLF +
           '       (SELECT ID_CREDITO,CVE_SUB_DIVISION  FROM CR_PROCAMPO ) CP '+ coCRLF ;
    sSQL3:=
           ' WHERE CRD.ID_CREDITO = '+ sCesion + coCRLF +
           ' AND   CONT.ID_CONTRATO = CRD.ID_CONTRATO' + coCRLF +
           ' AND   PER.ID_PERSONA = CONT.ID_TITULAR' + coCRLF +
           ' AND   DOM.ID_DOMICILIO = CONT.ID_DOMICILIO' + coCRLF +
           ' AND   POB1.CVE_POBLACION = DOM.CVE_CIUDAD' + coCRLF +
           ' AND   POB2.CVE_POBLACION = DOM.CVE_ESTADO' + coCRLF +
           ' AND   POB3.CVE_POBLACION = DOM.CVE_PAIS' + coCRLF +
           ' AND   CRCONT.ID_CONTRATO = CONT.ID_CONTRATO' + coCRLF +
           ' AND   PROD.CVE_PRODUCTO_CRE = CRCONT.CVE_PRODUCTO_CRE' + coCRLF +
           ' AND   MON.CVE_MONEDA = CONT.CVE_MONEDA' + coCRLF +
           ' AND   TAFIN.CVE_TASA_INDICAD = CRD.CVE_TASA_REFER' + coCRLF +
           ' AND   CALC.CVE_CALCULO_INT = CRD.CVE_CALCULO' + coCRLF +
           ' AND   AMOR.CVE_AMORTIZACION = CRD.CVE_AMORTIZACION' + coCRLF +
           ' AND   PAGINT.CVE_PAG_INTERES = CRD.CVE_PAG_INTERES' + coCRLF +
           ' AND   PERCAP.ID_CREDITO (+)= CRD.ID_CREDITO' + coCRLF +
           ' AND   PERINT.ID_CREDITO (+)= CRD.ID_CREDITO' + coCRLF +
           ' AND   PERCOM.ID_CREDITO (+)= CRD.ID_CREDITO' + coCRLF +
           ' AND   PERFIN.ID_CREDITO (+)= CRD.ID_CREDITO' + coCRLF +
           ' AND   PERCAPP.ID_CREDITO (+)= CRD.ID_CREDITO' + coCRLF +
           ' AND   PERINTP.ID_CREDITO (+)= CRD.ID_CREDITO' + coCRLF +
           ' AND   PERCOMP.ID_CREDITO (+)= CRD.ID_CREDITO' + coCRLF +
           ' AND   PERFINP.ID_CREDITO (+)= CRD.ID_CREDITO' + coCRLF +
           ' AND   PERCAPV.ID_CREDITO (+)= CRD.ID_CREDITO' + coCRLF +
           ' AND   PERINTV.ID_CREDITO (+)= CRD.ID_CREDITO' + coCRLF +
           ' AND   PERCOMV.ID_CREDITO (+)= CRD.ID_CREDITO' + coCRLF +
           ' AND   PERFINV.ID_CREDITO (+)= CRD.ID_CREDITO' + coCRLF +
//HERJA ENERO 2013
           ' -- HERJA' + coCRLF +
           '  AND   CA_HIST_PGDMCP.ID_CREDITO(+) = PERCAPV.ID_CREDITO' + coCRLF +
           '  AND   CA_HIST_PGDMCP.ID_PERIODO(+) >= PERCAPV.MINPERCAP' + coCRLF +
           '  AND   CA_HIST_PGDMCP.ID_PERIODO(+) <= PERCAPV.MAXPERCAP' + coCRLF +
           ' --' + coCRLF +
           '  AND   CA_HIST_PGDMCP2.ID_CREDITO(+) = PERCAP.ID_CREDITO' + coCRLF +
           '  AND   CA_HIST_PGDMCP2.ID_PERIODO(+) >= PERCAP.MINPERCAP' + coCRLF +
           '  AND   CA_HIST_PGDMCP2.ID_PERIODO(+) <= PERCAP.PERIODOCAP' + coCRLF +
           ' --' + coCRLF +
           '  AND   CA_HIST_PGDMCP3.ID_CREDITO(+) = PERCAPP.ID_CREDITO' + coCRLF +
           '  AND   CA_HIST_PGDMCP3.ID_PERIODO(+) >= PERCAPP.MINPERCAP' + coCRLF +
           '  AND   CA_HIST_PGDMCP3.ID_PERIODO(+) <= PERCAPP.MAXPERCAP' + coCRLF +
           ' -- FIN HERJA' + coCRLF +
//FIN HERJA           
           ' AND   CI.ID_CREDITO (+)= CRD.ID_CREDITO' + coCRLF +
           ' AND   CP.ID_CREDITO(+) = CRD.ID_CREDITO ' + coCRLF ;
    Result:= sSQL1+sSQL2+sSQL22+sSQL21+sSQL3;
End;

//HERJA 26.08.2010
Function TQrTasaActB.CalculoTasa(vlidcredito, vlperiodo:integer):single;
var stpObtTasa : TStoredProc;
    Qry       : Tquery;
    vlStrSql  : String;
begin
   CalculoTasa:=0;
   vlStrSql := ' SELECT (F_VENCIMIENTO - PLAZO) AS F_INICIO '+
               ' FROM   CR_INTERES '+
               ' WHERE ID_CREDITO='+IntToStr(vlidcredito)+' AND NUM_PERIODO='+IntToStr(vlperiodo);

   Qry := GetSQLQueryNoNil(vlStrSql, Apli.DataBaseName,  Apli.SessionName, False );
   if Assigned(Qry) and not( Qry.IsEmpty ) then
   begin

      stpObtTasa := TStoredProc.Create(Nil);
      If Assigned(stpObtTasa) Then
      begin
         With stpObtTasa Do
         Try
            DatabaseName := Apli.DataBaseName;
            SessionName  := Apli.SessionName;
            StoredProcName := 'PKGCRCOMUN.STPOBTENTASAINT';
            Params.CreateParam(ftString, 'PECVEACCESORIO',ptInput);
            Params.CreateParam(ftInteger, 'PEIDCREDITO',ptInput);
            Params.CreateParam(ftInteger,  'PENUMPERIODO',ptInput);
            Params.CreateParam(ftDate,  'PEFECHATASA',ptInput);
            Params.CreateParam(ftString,'PEBSOLOFONDEO',ptInput);
            Params.CreateParam(ftString,'PEBTASAGTIA',ptInput);
            // RABA DIC 2013 PROYECTO CAMBIO DE TASAS
            Params.CreateParam(ftString,'PEBAPLICACT',ptInput);
            Params.CreateParam(ftString,'PEBREINICIAPER',ptInput);
            // FIN RABA
            //
            Params.CreateParam(ftFloat, 'PSVALTASA',ptOutput);
            // RABA DIC 2013 PROYECTO CAMBIO DE TASAS
            Params.CreateParam(ftFloat, 'PSTASABASE',ptOutput);
            Params.CreateParam(ftFloat, 'PSSOBRETASA',ptOutput);
            // FIN RABA
            Params.CreateParam(ftFloat, 'PSRESULTADO',ptOutput);
            Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
            Prepare;
            ParamByName('PECVEACCESORIO').AsString := 'IN';
            ParamByName('PEIDCREDITO').AsInteger := vlidcredito;
            ParamByName('PENUMPERIODO').AsInteger := vlperiodo;
            ParamByName('PEFECHATASA').AsDateTime :=  StrToDateTime(Qry.FieldByName('F_INICIO').AsString);
            ParamByName('PEBSOLOFONDEO').AsString := 'F';
            ParamByName('PEBTASAGTIA').AsString := 'F';
            // RABA DIC 2013 PROYECTO CAMBIO DE TASAS
            ParamByName('PEBAPLICACT').AsString := 'V';
            ParamByName('PEBREINICIAPER').AsString := 'F';
            // FIN RABA
            ExecProc;
            if ParamByName('PSRESULTADO').AsFloat = 0 then
               CalculoTasa:= ParamByName('PSVALTASA').AsFloat;
         Finally
            Close;
            Params.Clear;
            Free;
         End;
      end;
   end;

   if Assigned(Qry) then
   begin
      Qry.Close;        Qry.Free;
   end;
End;
//FIN HERJA 26.08.2010
Procedure TQrTasaActB.Intereses;
var stpDigVer : TStoredProc;
    Qry       : Tquery;
    vlStrSql  : String;
    vlFint    : TDate;
begin
 VGInteres := 0;
 VGInteresIva := 0;
 VGInteresTrans := 0;
 VGInteresIvaTrans := 0;
 VGInteresProy := 0;
 VGInteresIvaProy := 0;
 VGIntProyTrans := 0;
 VGIntIvaProyTrans := 0;
 VGTasaTrans := '';
 VGTasaProyTrans := '';
 //

 vlStrSql := 'SELECT ID_CREDITO,  '   +coCRLF +
             '       NUM_PERIODO, '   +coCRLF +
             '       DECODE( F_VENCIMIENTO - F_VENCTO, 0 , ''A'', ''B'' ) TIPO_PERIODO, ' +coCRLF +
             '       F_VENCIMIENTO, ' +coCRLF +
             '       F_VENCTO '       +coCRLF +
             'FROM   (SELECT ID_CREDITO,    ' +coCRLF +
             '               NUM_PERIODO,   ' +coCRLF +
             '               F_VENCIMIENTO - PLAZO F_INICIO, ' +coCRLF +
             '               F_VENCIMIENTO, ' +coCRLF +
             '               PKGCRCOMUN.STPOBTFVENCIMIENTO( ID_CREDITO, NUM_PERIODO, F_VENCIMIENTO ) F_VENCTO ' +coCRLF +
             '        FROM   CR_INTERES '   +coCRLF +
             '        WHERE  ID_CREDITO = ' + qyEncabezadoID_CREDITO.AsString +coCRLF +
             '       ) ' +coCRLF +
             'WHERE  '   + SQLFecha( StrToDate(VGFechaIni) )  + ' BETWEEN F_INICIO + 1 AND F_VENCTO' + coCRLF;

 Qry := GetSQLQueryNoNil(vlStrSql, Apli.DataBaseName,  Apli.SessionName, False );
 if Assigned(Qry) and not( Qry.IsEmpty ) then
 begin
    while not Qry.Eof do
    begin
       //INTERES AL D�A
       stpDigVer := TStoredProc.Create(Nil);
       If Assigned(stpDigVer) Then
        With stpDigVer Do
         Try
         DatabaseName := Apli.DataBaseName;
         SessionName  := Apli.SessionName;
         StoredProcName := 'PKGCRCOMUN.STPINTERES';
         Params.CreateParam(ftFloat,'PEIDCREDITO',ptInput);
         Params.CreateParam(ftFloat,'PENUMPERIODO',ptInput);
         Params.CreateParam(ftDate,'PEFREFERENCIA',ptInput);
         Params.CreateParam(ftDate,'PEFCALCULO',ptInput);
         Params.CreateParam(ftString,'PEBFINDIA',ptInput);
         Params.CreateParam(ftString,'PEBSOLOFONDEO',ptInput);
         Params.CreateParam(ftFloat,'PSTASA',ptOutput);
         Params.CreateParam(ftFloat,'PSINTDIA',ptOutput);
         Params.CreateParam(ftFloat,'PSINTERES',ptOutput);
         Params.CreateParam(ftFloat,'PSINTPROY',ptOutput);
         Params.CreateParam(ftFloat,'PSIMPIVA',ptOutput);
         Params.CreateParam(ftFloat,'PSIVAPROY',ptOutput);
         Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
         Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
         Prepare;
         ParamByName('PEIDCREDITO').AsFloat := qyEncabezadoID_CREDITO.AsFloat;
         ParamByName('PENUMPERIODO').AsFloat := Qry.FieldByName('NUM_PERIODO').AsFloat;
         //
         // Manda fecha de referencia  o fecha de vencimiento
         if Qry.FieldByName('TIPO_PERIODO').AsString  = 'A' then
         begin
           ParamByName('PEFREFERENCIA').AsDateTime := Apli.DameFechaEmpresa;
           ParamByName('PEFCALCULO').AsDateTime    := Apli.DameFechaEmpresa;
         end else if Qry.FieldByName('TIPO_PERIODO').AsString  = 'B' then
         begin
           vlFint := Apli.DameFechaEmpresa;
           if vlFint > Qry.FieldByName('F_VENCIMIENTO').AsDateTime then
             vlFint := Qry.FieldByName('F_VENCIMIENTO').AsDateTime;
           //ends_if
           ParamByName('PEFREFERENCIA').AsDateTime := vlFint;
           ParamByName('PEFCALCULO').AsDateTime    := vlFint;
         end;
         ParamByName('PEBFINDIA').AsString := 'F';
         ParamByName('PEBSOLOFONDEO').AsString := 'F';
         ExecProc;
         //
         // Suma interes periodo actual o interes transferido
         if Qry.FieldByName('TIPO_PERIODO').AsString  = 'A' then
         begin
           VGInteres := VGInteres + ParamByName('PSINTERES').AsFloat;
           VGInteresIva := VGInteresIva + ParamByName('PSIMPIVA').AsFloat;
         end else if Qry.FieldByName('TIPO_PERIODO').AsString  = 'B' then
         begin
           VGInteresTrans    := VGInteresTrans + ParamByName('PSINTERES').AsFloat;
           VGInteresIvaTrans := VGInteresIvaTrans + ParamByName('PSIMPIVA').AsFloat;
           VGTasaTrans       := FormatFloat('##.0000', ParamByName('PSTASA').AsFloat );
         end;
        Finally
         Close;
         Params.Clear;
         Free;
        End;
       //INTERES AL D�A PAGADO
       stpDigVer := TStoredProc.Create(Nil);
       If Assigned(stpDigVer) Then
        With stpDigVer Do
         Try
         DatabaseName := Apli.DataBaseName;
         SessionName  := Apli.SessionName;
         StoredProcName := 'PKGCRCOMUN.STPOBTENIMPPAGADO';
         Params.CreateParam(ftString,'PECVEACCESORIO',ptInput);
         Params.CreateParam(ftString,'PECVECONCEPTO',ptInput);
         Params.CreateParam(ftFloat,'PEIDCREDITO',ptInput);
         Params.CreateParam(ftFloat,'PENUMPERIODO',ptInput);
         Params.CreateParam(ftString,'PECVECOMISION',ptInput);
         Params.CreateParam(ftDate,'PEFCALCULO',ptInput);
         Params.CreateParam(ftString,'PEBFINDIA',ptInput);
         Params.CreateParam(ftFloat,'PSIMPPAGADO',ptOutput);
         Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
         Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
         Prepare;
         ParamByName('PECVEACCESORIO').AsString := 'IN';
         ParamByName('PECVECONCEPTO').AsString := 'IMPBRU';
         ParamByName('PEIDCREDITO').AsFloat := qyEncabezadoID_CREDITO.AsFloat;
         ParamByName('PENUMPERIODO').AsFloat := Qry.FieldByName('NUM_PERIODO').AsFloat;
         ParamByName('PEFCALCULO').AsDateTime := Apli.DameFechaEmpresa;
         ParamByName('PEBFINDIA').AsString := 'V';
         ExecProc;
         if Qry.FieldByName('TIPO_PERIODO').AsString  = 'A' then begin
           VGInteres := VGInteres - ParamByName('PSIMPPAGADO').AsFloat;
         end else if Qry.FieldByName('TIPO_PERIODO').AsString  = 'B' then begin
           VGInteresTrans := VGInteresTrans - ParamByName('PSIMPPAGADO').AsFloat;
         end;//ends_if
        Finally
         Close;
         Params.Clear;
         Free;
        End;
       //IVA INTERES AL D�A PAGADO
       stpDigVer := TStoredProc.Create(Nil);
       If Assigned(stpDigVer) Then
        With stpDigVer Do
         Try
         DatabaseName := Apli.DataBaseName;
         SessionName  := Apli.SessionName;
         StoredProcName := 'PKGCRCOMUN.STPOBTENIMPPAGADO';
         Params.CreateParam(ftString,'PECVEACCESORIO',ptInput);
         Params.CreateParam(ftString,'PECVECONCEPTO',ptInput);
         Params.CreateParam(ftFloat,'PEIDCREDITO',ptInput);
         Params.CreateParam(ftFloat,'PENUMPERIODO',ptInput);
         Params.CreateParam(ftString,'PECVECOMISION',ptInput);
         Params.CreateParam(ftDate,'PEFCALCULO',ptInput);
         Params.CreateParam(ftString,'PEBFINDIA',ptInput);
         Params.CreateParam(ftFloat,'PSIMPPAGADO',ptOutput);
         Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
         Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
         Prepare;
         ParamByName('PECVEACCESORIO').AsString := 'IN';
         ParamByName('PECVECONCEPTO').AsString := 'IMPIVA';
         ParamByName('PEIDCREDITO').AsFloat := qyEncabezadoID_CREDITO.AsFloat;
         ParamByName('PENUMPERIODO').AsFloat := Qry.FieldByName('NUM_PERIODO').AsFloat;
         ParamByName('PEFCALCULO').AsDateTime := Apli.DameFechaEmpresa;
         ParamByName('PEBFINDIA').AsString := 'V';
         ExecProc;
         if Qry.FieldByName('TIPO_PERIODO').AsString  = 'A' then begin
           VGInteresIva := VGInteresIva - ParamByName('PSIMPPAGADO').AsFloat;
         end else if Qry.FieldByName('TIPO_PERIODO').AsString  = 'B' then begin
           VGInteresIvaTrans := VGInteresIvaTrans - ParamByName('PSIMPPAGADO').AsFloat;
         end;//ends_if
        Finally
         Close;
         Params.Clear;
         Free;
        End;
//       if qyEncabezadoPER_INTERESPROG.AsFloat > 0  then
       begin
           //INTERES PROYECTADO
           stpDigVer := TStoredProc.Create(Nil);
           If Assigned(stpDigVer) Then
            With stpDigVer Do
             Try
             DatabaseName := Apli.DataBaseName;
             SessionName  := Apli.SessionName;
             StoredProcName := 'PKGCRCOMUN.STPINTERES';
             Params.CreateParam(ftFloat,'PEIDCREDITO',ptInput);
             Params.CreateParam(ftFloat,'PENUMPERIODO',ptInput);
             Params.CreateParam(ftDate,'PEFREFERENCIA',ptInput);
             Params.CreateParam(ftDate,'PEFCALCULO',ptInput);
             Params.CreateParam(ftString,'PEBFINDIA',ptInput);
             Params.CreateParam(ftString,'PEBSOLOFONDEO',ptInput);
             Params.CreateParam(ftFloat,'PSTASA',ptOutput);
             Params.CreateParam(ftFloat,'PSINTDIA',ptOutput);
             Params.CreateParam(ftFloat,'PSINTERES',ptOutput);
             Params.CreateParam(ftFloat,'PSINTPROY',ptOutput);
             Params.CreateParam(ftFloat,'PSIMPIVA',ptOutput);
             Params.CreateParam(ftFloat,'PSIVAPROY',ptOutput);
             Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
             Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
             Prepare;
             ParamByName('PEIDCREDITO').AsFloat := qyEncabezadoID_CREDITO.AsFloat;
             ParamByName('PENUMPERIODO').AsFloat := Qry.FieldByName('NUM_PERIODO').AsFloat;
             ParamByName('PEFREFERENCIA').AsDateTime := Apli.DameFechaEmpresa;

             if Qry.FieldByName('TIPO_PERIODO').AsString  = 'A' then begin
               ParamByName('PEFCALCULO').AsDateTime :=  StrToDateTime(VGFechaIni);
             end else if Qry.FieldByName('TIPO_PERIODO').AsString  = 'B' then begin
               vlFint := StrToDateTime(VGFechaIni);
               if vlFint > Qry.FieldByName('F_VENCIMIENTO').AsDateTime then
                  vlFint := Qry.FieldByName('F_VENCIMIENTO').AsDateTime;
               //ends_if
               ParamByName('PEFCALCULO').AsDateTime :=  vlFint;
             end;


             ParamByName('PEBFINDIA').AsString := 'F';
             ParamByName('PEBSOLOFONDEO').AsString := 'F';
             ExecProc;
             if Qry.FieldByName('TIPO_PERIODO').AsString  = 'A' then begin
               VGInteresProy := VGInteresProy + ParamByName('PSINTERES').AsFloat;
               VGInteresIvaProy := VGInteresIvaProy + ParamByName('PSIMPIVA').AsFloat;
             end else if Qry.FieldByName('TIPO_PERIODO').AsString  = 'B' then begin
               VGIntProyTrans    := VGIntProyTrans + ParamByName('PSINTERES').AsFloat;
               VGIntIvaProyTrans := VGIntIvaProyTrans + ParamByName('PSIMPIVA').AsFloat;
               VGTasaProyTrans   := FormatFloat('##.0000', ParamByName('PSTASA').AsFloat );
             end;
            Finally
             Close;
             Params.Clear;
             Free;
            End;
             //INTERES AL PROYECTADO PAGADO
             stpDigVer := TStoredProc.Create(Nil);
             If Assigned(stpDigVer) Then
              With stpDigVer Do
               Try
               DatabaseName := Apli.DataBaseName;
               SessionName  := Apli.SessionName;
               StoredProcName := 'PKGCRCOMUN.STPOBTENIMPPAGADO';
               Params.CreateParam(ftString,'PECVEACCESORIO',ptInput);
               Params.CreateParam(ftString,'PECVECONCEPTO',ptInput);
               Params.CreateParam(ftFloat,'PEIDCREDITO',ptInput);
               Params.CreateParam(ftFloat,'PENUMPERIODO',ptInput);
               Params.CreateParam(ftString,'PECVECOMISION',ptInput);
               Params.CreateParam(ftDate,'PEFCALCULO',ptInput);
               Params.CreateParam(ftString,'PEBFINDIA',ptInput);
               Params.CreateParam(ftFloat,'PSIMPPAGADO',ptOutput);
               Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
               Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
               Prepare;
               ParamByName('PECVEACCESORIO').AsString := 'IN';
               ParamByName('PECVECONCEPTO').AsString := 'IMPBRU';
               ParamByName('PEIDCREDITO').AsFloat := qyEncabezadoID_CREDITO.AsFloat;
               ParamByName('PENUMPERIODO').AsFloat := Qry.FieldByName('NUM_PERIODO').AsFloat;
               ParamByName('PEFCALCULO').AsDateTime := StrToDateTime(VGFechaIni);
               ParamByName('PEBFINDIA').AsString := 'V';
               ExecProc;
               if Qry.FieldByName('TIPO_PERIODO').AsString  = 'A' then begin
                 VGInteresProy := VGInteresProy - ParamByName('PSIMPPAGADO').AsFloat;
               end else if Qry.FieldByName('TIPO_PERIODO').AsString  = 'B' then begin
                 VGIntProyTrans := VGIntProyTrans - ParamByName('PSIMPPAGADO').AsFloat;
               end;
              Finally
               Close;
               Params.Clear;
               Free;
              End;
             //IVA INTERES AL D�A PROYECTADO
             stpDigVer := TStoredProc.Create(Nil);
             If Assigned(stpDigVer) Then
              With stpDigVer Do
               Try
               DatabaseName := Apli.DataBaseName;
               SessionName  := Apli.SessionName;
               StoredProcName := 'PKGCRCOMUN.STPOBTENIMPPAGADO';
               Params.CreateParam(ftString,'PECVEACCESORIO',ptInput);
               Params.CreateParam(ftString,'PECVECONCEPTO',ptInput);
               Params.CreateParam(ftFloat,'PEIDCREDITO',ptInput);
               Params.CreateParam(ftFloat,'PENUMPERIODO',ptInput);
               Params.CreateParam(ftString,'PECVECOMISION',ptInput);
               Params.CreateParam(ftDate,'PEFCALCULO',ptInput);
               Params.CreateParam(ftString,'PEBFINDIA',ptInput);
               Params.CreateParam(ftFloat,'PSIMPPAGADO',ptOutput);
               Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
               Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
               Prepare;
               ParamByName('PECVEACCESORIO').AsString := 'IN';
               ParamByName('PECVECONCEPTO').AsString := 'IMPIVA';
               ParamByName('PEIDCREDITO').AsFloat := qyEncabezadoID_CREDITO.AsFloat;
               ParamByName('PENUMPERIODO').AsFloat := Qry.FieldByName('NUM_PERIODO').AsFloat;
               ParamByName('PEFCALCULO').AsDateTime := StrToDateTime(VGFechaIni);
               ParamByName('PEBFINDIA').AsString := 'V';
               ExecProc;
               if Qry.FieldByName('TIPO_PERIODO').AsString  = 'A' then begin
                 VGInteresIvaProy := VGInteresIvaProy - ParamByName('PSIMPPAGADO').AsFloat;
               end else if Qry.FieldByName('TIPO_PERIODO').AsString  = 'B' then begin
                 VGIntIvaProyTrans := VGIntIvaProyTrans - ParamByName('PSIMPPAGADO').AsFloat;
               end;
              Finally
               Close;
               Params.Clear;
               Free;
              End;
        end;
        Qry.Next;
    end;//ends_if
 end;
 if Assigned(Qry) then
 begin
      Qry.Close;        Qry.Free;
 end;
End;



Function TQrTasaActB.ReferenciaDigVer(strReferencia : String; Apli : TInterApli) : String;
var stpDigVer : TStoredProc;
begin
 Result := '';
 stpDigVer := TStoredProc.Create(Nil);
 If Assigned(stpDigVer) Then
  With stpDigVer Do
   Try
   DatabaseName := Apli.DataBaseName;
   SessionName  := Apli.SessionName;
   StoredProcName := 'PKGDIGVRF.STPDIGVERIFICADOR';
   Params.CreateParam(ftFloat,'PEREFNUMERICA',ptInput);
   Params.CreateParam(ftString,'PEREFALFNUMERICA',ptInput);
   Params.CreateParam(ftInteger,'PEIdMetodo',ptInput); //  ^^Migraci�n^^ STP V
   Params.CreateParam(ftFloat,'PSDIGVERIFICADORN',ptOutput);
   Params.CreateParam(ftString,'PSDIGVERIFICADORV',ptOutput);
   Params.CreateParam(ftFloat,'PSREFDIGVRFNUM',ptOutput);
   Params.CreateParam(ftString,'PSREFDIGVRFVCH',ptOutput);
   Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
   Prepare; //  ^^Migraci�n^^
   ParamByName('PEREFNUMERICA').AsFloat := 0;
   ParamByName('PEREFALFNUMERICA').AsString := strReferencia;
   ParamByName('PEIDMETODO').AsFloat := 2;
   ExecProc;
   Result := ParamByName('PSREFDIGVRFVCH').AsString;
  Finally
   Close;
   Params.Clear;
   Free;
  End;
end;

procedure TQrTasaActB.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
    Group1.Enabled:= True;
    Group3.Enabled:= True;
    Group5.Enabled:= True;
    Group7.Enabled:= True;
    Group8.Enabled:= True;
    Group9.Enabled:= True;
    Group10.Enabled:= True;
    QRFoot1.Enabled := True;
    QRFoot2.Enabled := True;
    QRFoot3.Enabled := True;
    QRFoot4.Enabled := True;
    QRFoot5.Enabled := True;

  self.QRLbNumRefer.Caption := ReferenciaDigVer(qyEncabezadoID_CONTRATO.AsString, Apli);
end;

Procedure TQrTasaActB.HabilitaGrupos;
Begin
    Group1.Enabled:= False;
    Group3.Enabled:= False;
    Group5.Enabled:= False;
    Group7.Enabled:= False;
    Group8.Enabled:= False;
    Group9.Enabled:= False;
    Group10.Enabled:= False;
    QRFoot1.Enabled := False;
    QRFoot2.Enabled := False;
    QRFoot3.Enabled := False;
    QRFoot4.Enabled := False;
    QRFoot5.Enabled := False;

  If qyConsultaIDGRUPO.AsInteger = 1 Then Begin
    Group1.Enabled:= True;
    Group3.Enabled:= False;
    Group5.Enabled:= False;
    Group7.Enabled:= False;
    Group8.Enabled:= False;
    Group9.Enabled:= False;
    Group10.Enabled:= False;
    QRFoot1.Enabled := True;
    QRFoot2.Enabled := False;
    QRFoot3.Enabled := False;
    QRFoot4.Enabled := False;
    QRFoot5.Enabled := False;
  End
  Else If qyConsultaIDGRUPO.AsInteger = 2 Then Begin
    Group1.Enabled:= False;
    Group3.Enabled:= True;
    Group5.Enabled:= False;
    Group7.Enabled:= False;
    Group8.Enabled:= False;
    Group9.Enabled:= False;
    Group10.Enabled:= False;
    QRFoot1.Enabled := False;
    QRFoot2.Enabled := True;
    QRFoot3.Enabled := False;
    QRFoot4.Enabled := False;
    QRFoot5.Enabled := False;    
  End
  Else If qyConsultaIDGRUPO.AsInteger = 3 Then Begin
    Group1.Enabled:= False;
    Group3.Enabled:= False;
    Group5.Enabled:= True;
    Group7.Enabled:= False;
    Group8.Enabled:= False;
    Group9.Enabled:= False;
    Group10.Enabled:= False;
    QRFoot1.Enabled := False;
    QRFoot2.Enabled := False;
    QRFoot3.Enabled := True;
    QRFoot4.Enabled := False;
    QRFoot5.Enabled := False;        
  End
  Else If qyConsultaIDGRUPO.AsInteger = 4 Then Begin
    Group1.Enabled:= False;
    Group3.Enabled:= False;
    Group5.Enabled:= False;
    Group7.Enabled:= False;
    Group8.Enabled:= False;
    Group9.Enabled:= True;
    Group10.Enabled:= True;
    QRFoot1.Enabled := False;
    QRFoot2.Enabled := False;
    QRFoot3.Enabled := False;
    QRFoot4.Enabled := True;
    QRFoot5.Enabled := True;
  End
  Else If qyConsultaIDGRUPO.AsInteger = 5 Then Begin

    Group1.Enabled:= False;
    Group3.Enabled:= False;
    Group5.Enabled:= False;
    Group7.Enabled:= True;
    Group8.Enabled:= True;
    Group9.Enabled:= False;
    Group10.Enabled:= False;
    QRFoot1.Enabled := False;
    QRFoot2.Enabled := False;
    QRFoot3.Enabled := False;
    QRFoot4.Enabled := False;
    QRFoot5.Enabled := False;
  End;


   If qyConsultaIDGRUPO.AsInteger = 1 Then Begin //EASA4011     01112005
      dINTTASAMOR := qyConsultaFACT_MORAS.AsFloat * qyConsultaTASA.AsFloat;
      qrTasaMoras.Caption:= FormatFloat('###,###,###,###,##0.00',dINTTASAMOR);
   End;
   If qyConsultaIDGRUPO.AsInteger = 2 Then Begin
      dCAPTASA:= ObtieneTasa(qyConsultaID_CREDITO.AsInteger,qyConsultaNUM_PERIODO.AsInteger,'CP');
// HEGC MODIFICACION PARA QUE OBTENGA LA TASA DE MORATORIOS CORRECTA
      //      dCAPTASAMOR := qyConsultaFACT_MORAS.AsFloat * ObtieneTasa(qyConsultaID_CREDITO.AsInteger,qyConsultaNUM_PERIODO.AsInteger,'CP');
      dCAPTASAMOR :=0;
// hegc se deja la etiqueta pero no se pinta
      qrTasaMoras.Caption:= FormatFloat('###,###,###,###,##0.00',dCAPTASAMOR);
   End;
   If qyConsultaIDGRUPO.AsInteger = 4 Then Begin
      dCOMTASAMOR := qyConsultaFACT_MORAS.AsFloat * ObtieneTasa(qyConsultaID_CREDITO.AsInteger,qyConsultaNUM_PERIODO.AsInteger,'CN');
      qrTasaMoras.Caption:= FormatFloat('###,###,###,###,##0.00',dCOMTASAMOR);
   End;

End;

procedure TQrTasaActB.Group1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   Self.HabilitaGrupos;
   dSumaINTVENCIDO:=0;
   dSumaINTIVAVENCIDO:=0;
   dSumaBENEFICIO:=0;
end;

procedure TQrTasaActB.Group3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  Self.HabilitaGrupos;
  dSumaCAPVENCIDO:=0;
  dSumaCAPMORATORIOS:=0;
  dSumaCAPIVAMORA:=0;
  dSumaBENEFICIO_1:=0;
end;

procedure TQrTasaActB.Group7BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  Self.HabilitaGrupos;
end;

Function TQrTasaActB.ObtieneTasa(dCredito: Double;dPeriodo : Integer; sAccesorio: String):Double;
Var
   STP_TASA : TStoredProc;
   vlError : String;
Begin
   STP_TASA := TStoredProc.Create(Self);
   Try
      With STP_TASA Do Begin
         STP_TASA.DatabaseName:= Apli.DatabaseName;
         STP_TASA.SessionName:= Apli.SessionName;
         STP_TASA.StoredProcName:='PKGCRCOMUN.STPOBTENTASA';
         Params.Clear;
         Params.CreateParam(ftString,'PECVEACCESORIO',ptInput);
         Params.CreateParam(ftFloat,'PEIDCREDITO',ptInput);
         Params.CreateParam(ftInteger,'PENUMPERIODO',ptInput);
         Params.CreateParam(ftDateTime,'PEFECHATASA',ptInput);
         Params.CreateParam(ftFloat,'PSVALTASA',ptOutput);
         Params.CreateParam(ftInteger,'PSRESULTADO',ptOutput);
         Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);

         ParamByName('PECVEACCESORIO').AsString := sAccesorio;
         ParamByName('PEIDCREDITO').AsFloat := dCredito;
         ParamByName('PENUMPERIODO').AsInteger := dPeriodo;
         ParamByName('PEFECHATASA').AsDateTime := Apli.DameFechaEmpresaDia('D000');
         ExecProc;

         If (STP_TASA.ParamByName('PSRESULTADO').AsInteger <>0) Then Begin
            Result := 0;
            vlError := 'PROBLEMAS AL OBTENER EL TASA: '+ STP_TASA.ParamByName('PSTXRESULTADO').AsString +
                       ' : '+  IntToStr(STP_TASA.ParamByName('PSRESULTADO').AsInteger);
            //AddLine(MErrores,vlError);
         End Else Begin
            Result := STP_TASA.ParamByName('PSVALTASA').AsFloat;
         End;
      End;
   Finally
      STP_TASA.Free;
   End;
End;
// HEGC ASTECI 7/ABR/2010
Function TQrTasaActB.ObtieneTasaMoras(dCredito: Double;dPeriodo : Integer; sAccesorio: String):Double;
Var
   STP_TASA : TStoredProc;
   vlError : String;
Begin
   STP_TASA := TStoredProc.Create(Self);
   Try
      With STP_TASA Do Begin
         STP_TASA.DatabaseName:= Apli.DatabaseName;
         STP_TASA.SessionName:= Apli.SessionName;
         STP_TASA.StoredProcName:='PKGCRCOMUN.STPOBTENTASAMORA';
         Params.Clear;

         Params.CreateParam(ftFloat,'PEIDCREDITO',ptInput);
         Params.CreateParam(ftInteger,'PENUMPERIODO',ptInput);
         Params.CreateParam(ftString,'PECVECOMISION',ptInput);
         Params.CreateParam(ftString,'PECVEACCESORIO',ptInput);
         Params.CreateParam(ftInteger,'PESOBRETASAM',ptInput);
         Params.CreateParam(ftDateTime,'PEFTASA',ptInput);
         Params.CreateParam(ftFloat,'PSVALTASA',ptOutput);
         Params.CreateParam(ftInteger,'PSRESULTADO',ptOutput);
         Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);

         ParamByName('PECVEACCESORIO').AsString := sAccesorio;
         ParamByName('PECVECOMISION').AsString := 'CN';
         ParamByName('PEIDCREDITO').AsFloat := dCredito;
         ParamByName('PENUMPERIODO').AsInteger := dPeriodo;
         ParamByName('PESOBRETASAM').Asinteger := 2;
         ParamByName('PEFTASA').AsDateTime := Apli.DameFechaEmpresaDia('D000');
         ExecProc;

         If (STP_TASA.ParamByName('PSRESULTADO').AsInteger <>0) Then Begin
            Result := 0;
            vlError := 'PROBLEMAS AL OBTENER LA TASA DE MORAS: '+ STP_TASA.ParamByName('PSTXRESULTADO').AsString +
                       ' : '+  IntToStr(STP_TASA.ParamByName('PSRESULTADO').AsInteger);
            //AddLine(MErrores,vlError);
         End Else Begin
            Result := STP_TASA.ParamByName('PSVALTASA').AsFloat;
         End;
      End;
   Finally
      STP_TASA.Free;
   End;
End;


Function TQrTasaActB.LlenaConsulta(sCesion,sFechaIni, sFechaFin,
                                  sEmpresa, sSucursal:String;
                                  pAPli : TInterApli) : String;
Var
    sSQL, sSQLInt, sSQLCap, sSQLRef, sSQLComis,sSQLBan:String;
Begin
///BSS
   //INTERES
   sSQLInt:= ' SELECT 1 AS IDGRUPO,'+coCRLF +
             '        CRINT.NUM_PERIODO ,'+coCRLF +
             '        (CRINT.IMP_INTERES - CRINT.IMP_PAGADO) AS IMPORTE,'+coCRLF +
             '        (CRINT.IMP_IVA - CRINT.IMP_IVA_PAGADO) AS IVA_VENC,'+coCRLF +
             '        CRINT.F_VENCIMIENTO, CRINT.F_PROG_PAGO, '+coCRLF +
             '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_ULT_PAG,'+coCRLF +
             '        CRINT.NUM_DIAS_VENCIDO AS DIAS,'+coCRLF +
             '        CRINT.TASA_APLICADA AS TASA,'+coCRLF +
             '        PKGCRCOMUN.FUNOBTENTASAMORAS(CRINT.ID_CREDITO,CRINT.NUM_PERIODO,''CN'',''IN'',CRD.sobretasa_M,TO_DATE(' + #39 + sFechaIni + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + ')-1 ) AS TASA_MORAS,';
//HEGC
//             '        0 AS TASA_MORAS, ';
// HEGC
{ROIM 18/11/2005 SE INCORPORA RUTINA DE CALCULO DE IVA}
             //'        0 AS MORATORIOS, 0 AS IVA_MOR,'+coCRLF +
   sSQLInt:=    sSQLInt +
           '               (PKGCRPERIODO.FUNOBTENMORA(4,''V'',CRINT.ID_CREDITO ,CRINT.NUM_PERIODO ,NULL,NULL,'+coCRLF +
                                                          SQLFecha(StrToDate(sFechaIni)) +', NULL)) AS MORATORIOS,'+coCRLF +
           '               (PKGCRPERIODO.FUNOBTENMORA(4,''F'',CRINT.ID_CREDITO ,CRINT.NUM_PERIODO ,NULL,NULL,'+coCRLF +
                                                          SQLFecha(StrToDate(sFechaIni )) + ',NULL)) AS IVA_MOR,'+coCRLF;
{/ROIM}
   sSQLInt:=    sSQLInt +
             '        (CRINT.IMP_BENEF_BCO + CRINT.IMP_BENEF_GOB) AS BENEFICIO,'+coCRLF +
             '	       CRD.ID_CREDITO, CRD.FACT_MORAS,'+coCRLF +
             '        '' '' CVE_COMISION,'' '' DESC_COMISION,'+coCRLF +
             '        '' '' AS TITULAR,'' '' AS BANCO, '' '' AS CONVENIOCUENTA,'+coCRLF +
             '        '' '' AS SUCURSAL, 0 AS ID_BANCO,'+coCRLF +
             '        '' '' AS REFERENCIA'+coCRLF +
             '   FROM CR_INTERES CRINT, CR_CREDITO CRD, CR_CONTRATO, CR_PRODUCTO'+coCRLF +
             '  WHERE CRINT.ID_CREDITO = '+ sCesion +coCRLF +
             '    AND TO_DATE(' + #39 + sFechaIni + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 +') > ' +coCRLF +
             '        PKGCRCOMUN.STPOBTFVENCIMIENTO( CRINT.ID_CREDITO, CRINT.NUM_PERIODO, CRINT.F_VENCIMIENTO ) ' +coCRLF +
           //  '    AND CRINT.IMP_INTERES - CRINT.IMP_PAGADO > 0'+coCRLF + //HERJA 06.09.2010
             '    AND CRD.ID_CREDITO = CRINT.ID_CREDITO'+coCRLF +
             '    AND CRD.ID_CONTRATO = CR_CONTRATO.ID_CONTRATO'+coCRLF +
             '    AND CRD.FOL_CONTRATO = CR_CONTRATO.FOL_CONTRATO'+coCRLF +
             '    AND CR_CONTRATO.CVE_PRODUCTO_CRE = CR_PRODUCTO.CVE_PRODUCTO_CRE'+ coCRLF +
           //  '    AND (CRINT.B_FINAN_ADIC IS NULL OR CRINT.B_FINAN_ADIC = ''F'')' +coCRLF ; //HERJA 06.09.2010
             ' AND CRINT.SIT_INTERES IN (''IM'') ' +coCRLF ; //HERJA 06.09.2010

      If Trim(sEmpresa)<>'' Then
         sSQLInt:= sSQLInt + '    AND CR_PRODUCTO.ID_EMPRESA ='+ Trim(sEmpresa);

   //CAPITAL
   sSQLCap:= ' UNION ALL '+coCRLF +
               ' SELECT 2 AS IDGRUPO,'+coCRLF +
               '        CRCAP.NUM_PERIODO,'+coCRLF +
               '        (CRCAP.IMP_CAPITAL - CRCAP.IMP_PAGADO) AS IMPORTE,'+coCRLF +
               '			0 AS IVA_VENC, CRCAP.F_VENCIMIENTO, CRCAP.F_PROG_PAGO,'+coCRLF +
               '        CRCAP.F_PAGO AS F_ULT_PAG, CRCAP.NUM_DIAS_VENCIDO AS DIAS,'+coCRLF +
// hegc asteci abril/09/2010 Que muestre la tasa de moras correcta
//               '        0 AS TASA, 0 AS TASA_MORAS,'+coCRLF +
               '        0 AS TASA,  '+coCRLF +
               '        PKGCRCOMUN.FUNOBTENTASAMORAS(CRCAP.ID_CREDITO,CRCAP.NUM_PERIODO,''CN'',''CP'',CRD.sobretasa_M,TO_DATE(' + #39 + sFechaIni + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + ')-1 ) AS TASA_MORAS,'+coCRLF +
// hegc
               '        PKGCRPERIODO.FUNOBTENMORA(1,''V'',CRCAP.ID_CREDITO ,CRCAP.NUM_PERIODO ,NULL,NULL, TO_DATE(' + #39 + sFechaIni + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 +'), NULL) AS MORATORIOS,'+coCRLF +
               '        PKGCRPERIODO.FUNOBTENMORA(1,''F'',CRCAP.ID_CREDITO ,CRCAP.NUM_PERIODO ,NULL,NULL, TO_DATE(' + #39 + sFechaIni + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 +'), NULL) AS IVA_MOR,'+coCRLF +
               '        (CRCAP.IMP_BENEF_BCO + CRCAP.IMP_BENEF_GOB) AS BENEFICIO,'+coCRLF +
               '			CRD.ID_CREDITO, CRD.FACT_MORAS,'+coCRLF +
               '        '' '' CVE_COMISION,'' '' DESC_COMISION,'+coCRLF +
               '        '' '' AS TITULAR,'' '' AS BANCO, '' '' AS CONVENIOCUENTA,'' '' AS SUCURSAL,'+coCRLF +
               '        0 AS ID_BANCO,'+coCRLF +
               '        '' '' AS REFERENCIA'+coCRLF +
               '   FROM CR_CAPITAL CRCAP, CR_CREDITO CRD, CR_CONTRATO, CR_PRODUCTO'+coCRLF +
               '  WHERE CRCAP.ID_CREDITO = '+ sCesion +coCRLF +
               '    AND TO_DATE(' + #39 + sFechaIni + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 +') > CRCAP.F_VENCIMIENTO ' +coCRLF +
               '    AND CRCAP.IMP_CAPITAL - CRCAP.IMP_PAGADO > 0'+coCRLF +
               '    AND CRD.ID_CREDITO = CRCAP.ID_CREDITO'+coCRLF +
             '    AND CRD.ID_CONTRATO = CR_CONTRATO.ID_CONTRATO'+coCRLF +
             '    AND CRD.FOL_CONTRATO = CR_CONTRATO.FOL_CONTRATO'+coCRLF +
             '    AND CR_CONTRATO.CVE_PRODUCTO_CRE = CR_PRODUCTO.CVE_PRODUCTO_CRE'+coCRLF ;

      If Trim(sEmpresa)<>'' Then
         sSQLCap:= sSQLCap + '    AND CR_PRODUCTO.ID_EMPRESA ='+ Trim(sEmpresa)+ coCRLF ;

   //FINANCIAMIENTO
   sSQLRef:=' UNION ALL '+coCRLF +
            ' SELECT 3 AS IDGRUPO, FINAN.NUM_PERIODO,'+coCRLF +
            '        (FINAN.IMP_FINAN_ADIC - FINAN.IMP_PAGADO) IMPORTE,'+coCRLF +
            '			0 AS IVA_VENC, FINAN.F_VENCIMIENTO,'+coCRLF +
            '			FINAN.F_PROG_PAGO, FINAN.F_PAGO AS F_ULT_PAG,'+coCRLF +
            '        0 AS DIAS, 0 AS TASA, '+coCRLF +
            '        PKGCRCOMUN.FUNOBTENTASAMORAS(FINAN.ID_CREDITO,FINAN.NUM_PERIODO,''CN'',''FN'',CRD.sobretasa_M,TO_DATE(' + #39 + sFechaIni + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + ')-1 ) AS TASA_MORAS,'+coCRLF +
//            0 AS TASA_MORAS,'+coCRLF +
            '        PKGCRPERIODO.FUNOBTENMORA(3,''V'',FINAN.ID_CREDITO ,FINAN.NUM_PERIODO ,NULL,NULL, TO_DATE(' + #39 + sFechaIni + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 +') , NULL) AS MORATORIOS,'+coCRLF +
            '        PKGCRPERIODO.FUNOBTENMORA(3,''F'',FINAN.ID_CREDITO ,FINAN.NUM_PERIODO ,NULL,NULL, TO_DATE(' + #39 + sFechaIni + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 +') , NULL) AS IVA_MOR,'+coCRLF +
            '        0 AS BENEFICIO, CRD.ID_CREDITO, CRD.FACT_MORAS,'+coCRLF +
            '        '' '' CVE_COMISION,'' '' DESC_COMISION,'+coCRLF +
            '        '' '' AS TITULAR,'' '' AS BANCO,'' '' AS CONVENIOCUENTA,'' '' AS SUCURSAL,'+coCRLF +
            '        0 AS ID_BANCO,'+coCRLF +
            '        '' '' AS REFERENCIA'+coCRLF +
            '   FROM CR_FINAN_ADIC FINAN, CR_CREDITO CRD, CR_CONTRATO, CR_PRODUCTO'+coCRLF +
            '  WHERE FINAN.ID_CREDITO = '+ sCesion +coCRLF +
            '    AND   TO_DATE(' + #39 + sFechaIni + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 +') > FINAN.F_VENCIMIENTO ' +coCRLF +
            '    AND   FINAN.IMP_FINAN_ADIC - FINAN.IMP_PAGADO > 0'+coCRLF +
            '    AND   CRD.ID_CREDITO = FINAN.ID_CREDITO'+coCRLF +
            '    AND CRD.ID_CONTRATO = CR_CONTRATO.ID_CONTRATO'+coCRLF +
            '    AND CRD.FOL_CONTRATO = CR_CONTRATO.FOL_CONTRATO'+coCRLF +
            '    AND CR_CONTRATO.CVE_PRODUCTO_CRE = CR_PRODUCTO.CVE_PRODUCTO_CRE'+coCRLF ;

      If Trim(sEmpresa)<>'' Then
         sSQLRef:= sSQLRef + '    AND CR_PRODUCTO.ID_EMPRESA ='+ Trim(sEmpresa)+coCRLF ;
   //COMISION
   sSQLComis := ' UNION ALL '+coCRLF +
                  ' SELECT 4 AS IDGRUPO,'+coCRLF +
                  '        CR_COMISION.NUM_PERIODO,'+coCRLF +
                  '        (CR_COMISION.IMP_COMISION - CR_COMISION.IMP_PAGADO) AS IMPORTE,'+coCRLF +
                  '			0 AS IVA_VENC,CR_COMISION.F_VENCIMIENTO,'+coCRLF +
                  '        CR_COMISION.F_PROG_PAGO,'+coCRLF +
                  '        CR_COMISION.F_PAGO AS F_ULT_PAG,'+coCRLF +
                  '        CR_COMISION.NUM_DIAS_VENCIDO  AS DIAS,'+coCRLF +
                  '        0 AS TASA,'+coCRLF +
                  '        PKGCRCOMUN.FUNOBTENTASAMORAS(CR_COMISION.ID_CREDITO,CR_COMISION.NUM_PERIODO,CR_COMISION.CVE_COMISION,''CN'',CR_CREDITO.sobretasa_M,TO_DATE(' + #39 + sFechaIni + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + ')-1 ) AS TASA_MORAS,'+coCRLF +
//                  0 AS TASA_MORAS,'+coCRLF +
                  '        PKGCRPERIODO.FUNOBTENMORA(2,''V'',CR_COMISION.ID_CREDITO ,CR_COMISION.NUM_PERIODO ,CR_COMISION.CVE_COMISION,NULL, TO_DATE(' + #39 + sFechaIni + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 +') , NULL) AS MORATORIOS,'+coCRLF +
                  '        PKGCRPERIODO.FUNOBTENMORA(2,''F'',CR_COMISION.ID_CREDITO ,CR_COMISION.NUM_PERIODO ,CR_COMISION.CVE_COMISION,NULL, TO_DATE(' + #39 + sFechaIni + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 +') , NULL) AS IVA_MOR,'+coCRLF +
                  '        0 AS BENEFICIO, CR_COMISION.ID_CREDITO, CR_CREDITO.FACT_MORAS,'+coCRLF +
                  '			CR_CAT_COMISION.CVE_COMISION,DESC_COMISION,'+coCRLF +
                  '			'' '' AS TITULAR,'' '' AS BANCO, '' '' AS CONVENIOCUENTA,'+coCRLF +
                  '			'' '' AS SUCURSAL, 0 AS ID_BANCO,'+coCRLF +
                  '        '' '' AS REFERENCIA'+coCRLF +
                  '   FROM CR_COMISION, CR_CAT_COMISION, CR_CREDITO, CR_CONTRATO, CR_PRODUCTO'+coCRLF +
                  '  WHERE CR_COMISION.ID_CREDITO = '+ sCesion +coCRLF +
                  '    AND TO_DATE(' + #39 + sFechaIni + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 +') >  CR_COMISION.F_VENCIMIENTO'+coCRLF +
                  '    AND CR_COMISION.SIT_COMISION NOT IN (''LQ'',''CA'')' + coCRLF +//EASA4011    17/06/2005
                  '    AND CR_COMISION.IMP_COMISION - CR_COMISION.IMP_PAGADO > 0'+coCRLF +
                  '    AND CR_COMISION.CVE_COMISION = CR_CAT_COMISION.CVE_COMISION'+coCRLF +
                  '    AND CR_CREDITO.ID_CREDITO = CR_COMISION.ID_CREDITO'+coCRLF +
                  '	  AND CR_CREDITO.ID_CONTRATO = CR_CONTRATO.ID_CONTRATO'+coCRLF +
                  '	  AND CR_CREDITO.FOL_CONTRATO = CR_CONTRATO.FOL_CONTRATO'+coCRLF +
                  '    AND CR_CONTRATO.CVE_PRODUCTO_CRE = CR_PRODUCTO.CVE_PRODUCTO_CRE'+coCRLF;

      If Trim(sEmpresa)<>'' Then
         sSQLComis:= sSQLComis + '    AND CR_PRODUCTO.ID_EMPRESA ='+ Trim(sEmpresa)+coCRLF ;

   //REFERENCIAS
   sSQLBan:=' UNION ALL '+coCRLF +
            ' SELECT 5 AS IDGRUPO, 0 NUM_PERIODO, 0 IMPORTE, 0 AS IVA_VENC,'+coCRLF +
            '			TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_VENCIMIENTO,'+coCRLF +
            '			TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_PROG_PAGO,'+coCRLF +
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_ULT_PAG,'+coCRLF +
            '        0 AS DIAS, 0 AS TASA, 0 AS TASA_MORAS, 0 AS MORATORIOS,'+coCRLF +
            '        0 AS  IVA_MOR, 0 AS BENEFICIO, 0 AS ID_CREDITO,'+coCRLF +
            '        0 AS FACT_MORAS, '' '' CVE_COMISION,'' '' DESC_COMISION,'+coCRLF +
            '        P.NOMBRE AS TITULAR,NOM_INET AS BANCO,'+coCRLF +
            '			CVE_CONVENIO AS CONVENIOCUENTA,'+coCRLF +
            '			CVE_SUC_BANCO AS SUCURSAL,'+coCRLF +
            '        ID_BANCO_CHQRA AS ID_BANCO,'+coCRLF +
            '        SCP.REFERENCIA'+coCRLF +
            '  FROM  (SELECT * FROM (SELECT ID_EMPRESA, CVE_CONVENIO, ID_BANCO_CHQRA, CVE_SUC_BANCO,'+coCRLF +
            '                to_char(PKGDIGVRF.FUNDIGVRFREFNUM(NVL('+ SQLSTR(qyEncabezadoCHEQUERA.AsString)+ ',0), ID_METODO)) AS REFERENCIA'+coCRLF +
            '           FROM SC_CHEQRA_PROPIA'+coCRLF +
            '          WHERE ID_EMPRESA = '+ sEmpresa +coCRLF +
            '            AND B_DEP_REFER  = ''V'''+coCRLF +
            '            AND SIT_CHEQUERA = ''AC'''+coCRLF +
            '         ORDER BY REFERENCIA) '+coCRLF +
            '        ) SCP,'+coCRLF +
            '        (SELECT ID_INTERMEDIARIO, NOM_INET'+coCRLF +
            '           FROM INTERMEDIARIO) I,  PERSONA P'+coCRLF +
            '          WHERE I.ID_INTERMEDIARIO = SCP.ID_BANCO_CHQRA'+coCRLF +
            '            AND P.ID_PERSONA = SCP.ID_EMPRESA'+coCRLF;

   //REFERENCIAS
   sSQLBan:= sSQLBan +
            ' UNION ALL '+coCRLF +
            ' SELECT 5 AS IDGRUPO, 0 NUM_PERIODO, 0 IMPORTE, 0 AS IVA_VENC,'+coCRLF +
            '			TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_VENCIMIENTO,'+coCRLF +
            '			TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_PROG_PAGO,'+coCRLF +
            '        TO_DATE(''01/01/2000'',''DD/MM/YYYY'') AS F_ULT_PAG,'+coCRLF +
            '        0 AS DIAS, 0 AS TASA, 0 AS TASA_MORAS, 0 AS MORATORIOS,'+coCRLF +
            '        0 AS  IVA_MOR, 0 AS BENEFICIO, 0 AS ID_CREDITO,'+coCRLF +
            '        0 AS FACT_MORAS, '' '' CVE_COMISION,'' '' DESC_COMISION,'+coCRLF +
            '			'' '' AS TITULAR,'' '' AS BANCO, '' '' AS CONVENIOCUENTA,'+coCRLF +
            '			'' '' AS SUCURSAL, 0 AS ID_BANCO,'+coCRLF +
            '        '' '' AS REFERENCIA'+coCRLF +
            '  FROM  DUAL '+coCRLF;

//BSS
    sSQL:= sSQLInt + sSQLCap + sSQLRef + sSQLComis + sSQLBan +
           ' ORDER BY IDGRUPO, CVE_COMISION, DESC_COMISION, NUM_PERIODO '+coCRLF ;
    Result:= sSQL;
End;
 //cr_finan_adic

procedure TQrTasaActB.QRFoot1BeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
   qrlSum1.Caption:= FormatFloat('###,###,###,###,##0.00',dSumaINTVENCIDO);
   qrlSum2.Caption:= FormatFloat('###,###,###,###,##0.00',dSumaINTIVAVENCIDO);
   qrlSum3.Caption:= FormatFloat('###,###,###,###,##0.00',dSumaBENEFICIO);
end;

procedure TQrTasaActB.QRFoot2BeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
   qrlSuma1.Caption:= FormatFloat('###,###,###,###,##0.00',dSumaCAPVENCIDO);
   qrlSuma2.Caption:= FormatFloat('###,###,###,###,##0.00',dSumaCAPMORATORIOS);
   qrlSuma3.Caption:= FormatFloat('###,###,###,###,##0.00',dSumaCAPIVAMORA);
   qrlSuma4.Caption:= FormatFloat('###,###,###,###,##0.00',dSumaBENEFICIO_1);
end;

procedure TQrTasaActB.Group5BeforePrint(Sender: TQRCustomBand;   var PrintBand: Boolean);
begin
  Self.HabilitaGrupos;
  dSumaREFINAN01:= 0;
  dSumaREFINAN02:= 0;
  dSumaREFINAN03:= 0;

end;

procedure TQrTasaActB.QRFoot3BeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
   qrlSuma01.Caption:= FormatFloat('###,###,###,###,##0.00',dSumaREFINAN01);
   qrlSuma02.Caption:= FormatFloat('###,###,###,###,##0.00',dSumaREFINAN02);
   qrlSuma03.Caption:= FormatFloat('###,###,###,###,##0.00',dSumaREFINAN03);
end;

procedure TQrTasaActB.QRGroup7BeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
var VLTotalVig       : Double;
    VLIntIVAPro      : Double;
    VLIntIVAProTrans : Double;
    VLComIVAPro      : Double;
    VLTotPro         : Double;
    VLTotalMor       : Double;
    VLFinanAdicGen   : Double;

    VLIntProyFinan   : Double;
    VLInteresFinan   : Double;

    VLBFechaProg     : Boolean;

    Function DameFinanciamiento(sCesion,sFechaIni:String; var InteresProy,Interes : Double; var FProgramada : Boolean ) : Double;
    var
        Qry       : Tquery;
        vlStrSql  : String;
        VLSaldoBase : Double;
        VLFinanAdic : Double;
        VLTasaInteres : Double;
        VLPlazo     : Integer;
        UltimaFVenc : TDateTime;

        VLBFechaProgramada : Boolean;
    begin
        VLSaldoBase := 0;
        VLFinanAdic := 0;
        InteresProy := 0;
        Interes := 0;
        VLBFechaProgramada := False;
        FProgramada := False;

        VLTasaInteres := 0;

        //BUSCA FECHA PROGRAMADA
        vlStrSql := 'SELECT ID_CREDITO FROM CR_FINAN_ADIC WHERE ID_CREDITO = ' + sCesion +
                    '  AND  F_VENCIMIENTO = ' + SQLFecha(StrToDate(sFechaIni ));
        Qry := GetSQLQueryNoNil(vlStrSql, Apli.DataBaseName,  Apli.SessionName, False );
        if Assigned(Qry) and not( Qry.IsEmpty ) then
        begin
            while not Qry.Eof do
            begin
                 VLBFechaProgramada :=  True;
                 FProgramada := True;
                 Qry.Next;
            end;//ends_if
        end;
        if Assigned(Qry) then
        begin
              Qry.Close;        Qry.Free;
        end;

//        if VLBFechaProgramada then
        begin
              //BUSCA SALDO BASE PARA CALCULO DE INTER�S
              vlStrSql := 'SELECT SDO_VIG_TOTAL FROM CR_CREDITO WHERE ID_CREDITO = ' + sCesion;
              Qry := GetSQLQueryNoNil(vlStrSql, Apli.DataBaseName,  Apli.SessionName, False );
              if Assigned(Qry) and not( Qry.IsEmpty ) then
              begin
                  while not Qry.Eof do
                  begin
                       VLSaldoBase :=  Qry.FieldByName('SDO_VIG_TOTAL').AsFloat;
                      Qry.Next;
                  end;//ends_if
              end;
              if Assigned(Qry) then
              begin
                    Qry.Close;        Qry.Free;
              end;
              //BUSCA LOS PERIODOS DE INTERES
              vlStrSql := '  SELECT NUM_PERIODO, PLAZO, IMP_INTERES_PROY, F_VENCIMIENTO, SIT_INTERES, B_FINAN_ADIC, TASA_APLICADA, ' +
                          ' (IMP_INTERES - IMP_PAGADO) AS IMP_INTERES' +
                          '  FROM CR_INTERES'+
                          '  WHERE 1 = 1'+
                          '  AND   ID_CREDITO = ' + sCesion +
                          '  AND   F_VENCIMIENTO > ' + SQLFecha(Apli.DameFechaEmpresa) +
                          '  AND   F_VENCIMIENTO <= ' + SQLFecha(StrToDate(sFechaIni )) +
                          '  ORDER BY NUM_PERIODO';
              Qry := GetSQLQueryNoNil(vlStrSql, Apli.DataBaseName,  Apli.SessionName, False );
              if Assigned(Qry) and not( Qry.IsEmpty ) then
              begin
                  if VLTasaInteres = 0 then
                       //HERJA 26.08.2010
                       //VLTasaInteres := Qry.FieldByName('TASA_APLICADA').AsFloat;
                       VLTasaInteres := CalculoTasa(StrToInt(sCesion), Qry.FieldByName('NUM_PERIODO').AsInteger);

                  while not Qry.Eof do
                  begin
                       if ((Qry.FieldByName('B_FINAN_ADIC').Asstring  = 'V') and (StrToDate(sFechaIni) > Qry.FieldByName('F_VENCIMIENTO').AsDateTime)) then
                       begin
                            if Qry.FieldByName('SIT_INTERES').Asstring  = 'AC' then
                            begin
                                 VLFinanAdic := VLFinanAdic + Qry.FieldByName('IMP_INTERES_PROY').AsFloat;
                                 VLSaldoBase := VLSaldoBase + Qry.FieldByName('IMP_INTERES_PROY').AsFloat;
                                 VLTasaInteres := Qry.FieldByName('TASA_APLICADA').AsFloat;
                                 Interes := Qry.FieldByName('IMP_INTERES').AsFloat;
                            end
                            else
                            begin
                                 VLPlazo :=  Qry.FieldByName('PLAZO').AsInteger;
//HERJA 05-2010
//                                 VLFinanAdic := VLFinanAdic + (VLSaldoBase * VLTasaInteres  * VLPlazo / 36000);
//                                 VLSaldoBase :=  VLSaldoBase + (VLSaldoBase * VLTasaInteres  * VLPlazo / 36000);
                                 VLFinanAdic := VLFinanAdic + ((ROUND(VLSaldoBase * VLTasaInteres/360)/100) * VLPlazo);
                                 VLSaldoBase := VLSaldoBase + ((ROUND(VLSaldoBase * VLTasaInteres/360)/100) * VLPlazo);
                            end;
                       end;

                       if StrToDate(sFechaIni) = Qry.FieldByName('F_VENCIMIENTO').AsDateTime then
                       begin
                            VLPlazo :=  Qry.FieldByName('PLAZO').AsInteger;
//HERJA 05-2010
//                            InteresProy := (VLSaldoBase * VLTasaInteres  * VLPlazo / 36000);
                              InteresProy := ((ROUND(VLSaldoBase * VLTasaInteres/360)/100) * VLPlazo);
                       end;

                       UltimaFVenc := Qry.FieldByName('F_VENCIMIENTO').AsDateTime;

                       Qry.Next;
                  end;//ends_if

                  if UltimaFVenc < StrToDate(sFechaIni) then
                  begin
                       VLPlazo :=  trunc(StrToDate(sFechaIni) - UltimaFVenc);
//HERJA 05-2010
//                       InteresProy := (VLSaldoBase * VLTasaInteres  * VLPlazo / 36000);
                         InteresProy := ((ROUND(VLSaldoBase * VLTasaInteres/360)/100) * VLPlazo);
//                         InteresProy := (ROUND(VLSaldoBase * VLTasaInteres/36000) * VLPlazo);
                  end;

              end;
              if Assigned(Qry) then
              begin
                    Qry.Close;        Qry.Free;
              end;
        end;
        Result:=       VLFinanAdic;
    end;


begin
    VLTotalVig := 0;
    VLIntIVAPro := 0;
    VLIntIVAProTrans := 0;
    VLComIVAPro := 0;
    VLTotPro    := 0;
    VLTotalMor  := 0;
    VLFinanAdicGen := 0;
    VLIntProyFinan := 0;
    VLInteresFinan := 0;

    Intereses;

    VLFinanAdicGen := DameFinanciamiento(qyEncabezadoID_CREDITO.AsString ,VGFechaIni,VLIntProyFinan,VLInteresFinan,VLBFechaProg);


{ROIM 18112005 SE AGREGA PARAMETRO DE TIPO DE NIVELACI�N}
    if BNivela = 'N' then
    begin
         VGInteres := qyEncabezadoIMP_INTERES.AsFloat;
         VGInteresIva := qyEncabezadoIMP_IVA_INTERES.AsFloat;
    end;
{/ROIM}
    //VIGENTE
    QRlbIntVigTrans.Caption := Format('Int. Vig. Trans.: (%s)', [ VGTasaTrans ] );


    if VLFinanAdicGen > 0 then
    begin
         VGInteres := VLInteresFinan;
    end;


    QRIntVig.Caption := FormatFloat('###,###,###,###,##0.00',VGInteres);
    QRIntVigIVA.Caption := FormatFloat('###,###,###,###,##0.00',VGInteresIva);


    QRIntVigTrans.Caption    := FormatFloat('###,###,###,###,##0.00',VGInteresTrans);
    QRIntVigIVATrans.Caption := FormatFloat('###,###,###,###,##0.00',VGInteresIvaTrans);
    VLTotalVig := qyEncabezadoSDO_INSOLUTO.AsFloat +
                  qyEncabezadoSDO_FINAN_ADIC.AsFloat +
                  VGInteres +
                  VGInteresIva +
                  VGInteresTrans +
                  VGInteresIvaTrans+
                  qyEncabezadoIMP_COMISION.AsFloat +
                  qyEncabezadoIMP_IVACOM.AsFloat;



    QRTotalVig.Caption := FormatFloat('###,###,###,###,##0.00',VLTotalVig);


{ROIM 18112005 SE AGREGA PARAMETRO DE TIPO DE NIVELACI�N}
    if BNivela = 'T' then
    begin
         QRTotalAdeudo.Caption := FormatFloat('###,###,###,###,##0.00',qyEncabezadoADEUDOVENCIDO.AsFloat + VLTotalVig);
         QRTotalAdeudoPrVe.Caption := FormatFloat('###,###,###,###,##0.00',VLTotPro + VLTotalVig + VLFinanAdicGen);
    end
    else if BNivela = 'N' then
    begin
         VLTotalMor := qyEncabezadoIMP_MOR_CAPITAL.AsFloat +
                       qyEncabezadoIMP_IVA_MOR_CAP.AsFloat +
                       qyEncabezadoIMP_MOR_INTERES.AsFloat +
                       qyEncabezadoIMP_IVA_MOR_INT.AsFloat +
                       qyEncabezadoIMP_MOR_COMISION.AsFloat+
                       qyEncabezadoIMP_IVA_MOR_COM.AsFloat;
         QRTotalAdeudo.Caption := FormatFloat('###,###,###,###,##0.00',VLTotalVig + VLTotalMor);
         QRTotalAdeudoPrVe.Caption := FormatFloat('###,###,###,###,##0.00',VLTotalVig + VLTotalMor + VLFinanAdicGen);
    end;
{/ROIM}

{ROIM 18112005 SE AGREGA PARAMETRO DE TIPO DE NIVELACI�N}
    //PROYECTADO
    if BNivela = 'T' then
    begin
         VLIntIVAPro := VGInteresProy + VGInteresIvaProy;
    end
    else if BNivela = 'N' then
    begin
         VLIntIVAPro := qyEncabezadoPER_INTERESPROG.AsFloat;
    end;
{/ROIM}

    if VLFinanAdicGen > 0 then
    begin
         VLIntIVAPro := VLIntProyFinan;
    end;

    VLIntIVAProTrans := VGIntProyTrans + VGIntIvaProyTrans;

    VLComIVAPro := qyEncabezadoIMP_COMISIONPROG.AsFloat + qyEncabezadoIMP_IVACOMPROG.AsFloat;

    VLTotPro    := qyEncabezadoCAPITALPROG.AsFloat +
                   qyEncabezadoSDO_FINAN_ADICPROG.AsFloat +
                   VLIntIVAPro +
                   VLIntIVAProTrans +
                   VLComIVAPro;



    QRIntPro.Caption :=  FormatFloat('###,###,###,###,##0.00',VLIntIVAPro);

    QRLbIntProTrans.Caption := Format('Int. (+ IVA) Transf.: (%s)', [ VGTasaProyTrans ] );

    QRIntProTrans.Caption   := FormatFloat('###,###,###,###,##0.00',VLIntIVAProTrans);

    QRConPro.Caption :=  FormatFloat('###,###,###,###,##0.00',VLComIVAPro);

    if VLBFechaProg then
       QRTotPro.Caption :=  FormatFloat('###,###,###,###,##0.00',VLTotPro + VLFinanAdicGen)
    else
       QRTotPro.Caption :=  FormatFloat('###,###,###,###,##0.00',VLTotPro);
    //end if;

    if VLBFechaProg then
       QRFinAdic.Caption :=  FormatFloat('###,###,###,###,##0.00', VLFinanAdicGen + qyEncabezadoSDO_FINAN_ADICPROG.AsFloat)
    else
       QRFinAdic.Caption :=  FormatFloat('###,###,###,###,##0.00', qyEncabezadoSDO_FINAN_ADICPROG.AsFloat);
    //end if;

    QRLabel67.Caption :=  FormatFloat('###,###,###,###,##0.00', VLFinanAdicGen + qyEncabezadoSDO_FINAN_ADIC.AsFloat);

    QRLabel105.Caption :=  FormatFloat('###,###,###,###,##0.00',VLIntIVAPro);

    if VLBFechaProg then
       VLComIVAPro := 0;
    //end if;


{ROIM 18112005 SE AGREGA PARAMETRO DE TIPO DE NIVELACI�N}
    if BNivela = 'T' then
    begin
         if VLBFechaProg then
            QRTotalAdeudoPrVe.Caption := FormatFloat('###,###,###,###,##0.00',qyEncabezadoADEUDOVENCIDO.AsFloat + VLTotPro + VLFinanAdicGen)
         else
            QRTotalAdeudoPrVe.Caption := FormatFloat('###,###,###,###,##0.00',qyEncabezadoADEUDOVENCIDO.AsFloat + VLTotPro);
         //end if
    end
    else if BNivela = 'N' then
    begin
         if VLBFechaProg then
            QRTotalAdeudoPrVe.Caption := FormatFloat('###,###,###,###,##0.00',VLTotPro + VLTotalMor + VLFinanAdicGen)
         else
            QRTotalAdeudoPrVe.Caption := FormatFloat('###,###,###,###,##0.00',VLTotPro + VLTotalMor);
         //end if
    end;
{/ROIM}

    QRLabel120.Caption :=  FormatFloat('###,###,###,###,##0.00',VLComIVAPro);

    QRLabel122.Caption :=  FormatFloat('###,###,###,###,##0.00',qyEncabezadoSDO_INSOLUTO.AsFloat +
                                                                VLFinanAdicGen + qyEncabezadoSDO_FINAN_ADIC.AsFloat +
                                                                VLIntIVAPro +
                                                                VLComIVAPro);

    QRLabel124.Caption :=  FormatFloat('###,###,###,###,##0.00',qyEncabezadoSDO_INSOLUTO.AsFloat +
                                                                VLFinanAdicGen + qyEncabezadoSDO_FINAN_ADIC.AsFloat +
                                                                VLIntIVAPro +
                                                                VLComIVAPro +
                                                                qyEncabezadoADEUDOVENCIDO.AsFloat);


end;

procedure TQrTasaActB.Group9BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  Self.HabilitaGrupos;
  dSumaCOMVENCIDO_TOT:=0;
  dSumaCOMMORATORIOS_TOT:=0;
  dSumaCOMIVAMORA_TOT:=0;

end;

procedure TQrTasaActB.QRFoot4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   QRLabel55.Caption:= FormatFloat('###,###,###,###,##0.00',dSumaCOMVENCIDO);
   QRLabel54.Caption:= FormatFloat('###,###,###,###,##0.00',dSumaCOMMORATORIOS);
   QRLabel53.Caption:= FormatFloat('###,###,###,###,##0.00',dSumaCOMIVAMORA);
end;

procedure TQrTasaActB.QRFoot5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   QRLabel41.Caption:= FormatFloat('###,###,###,###,##0.00',dSumaCOMVENCIDO_TOT);
   QRLabel40.Caption:= FormatFloat('###,###,###,###,##0.00',dSumaCOMMORATORIOS_TOT);
   QRLabel39.Caption:= FormatFloat('###,###,###,###,##0.00',dSumaCOMIVAMORA_TOT);
end;

procedure TQrTasaActB.Group10BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  Self.HabilitaGrupos;
  dSumaCOMVENCIDO:=0;
  dSumaCOMMORATORIOS:=0;
  dSumaCOMIVAMORA:=0;
end;

procedure TQrTasaActB.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   qrdbUltPag.Enabled:= True;
   qrdbIvaVenc.Enabled:= False;
   qrdbTasa.Enabled:= False;

   If qyConsultaIDGRUPO.AsInteger = 1 Then Begin
      dSumaINTVENCIDO:=dSumaINTVENCIDO + qyConsulta.FieldByName('IMPORTE').AsFloat;
      dSumaINTIVAVENCIDO:=dSumaINTIVAVENCIDO + qyConsulta.FieldByName('IVA_VENC').AsFloat;
      dSumaBENEFICIO:=dSumaBENEFICIO + qyConsulta.FieldByName('BENEFICIO').AsFloat;
      qrdbUltPag.Enabled:= False;
      qrdbIvaVenc.Enabled:= True;
      qrdbTasa.Enabled:= True;
   End;
   If qyConsultaIDGRUPO.AsInteger = 2 Then Begin
     dSumaCAPVENCIDO:= dSumaCAPVENCIDO + qyConsulta.FieldByName('IMPORTE').AsFloat;
     dSumaCAPMORATORIOS:= dSumaCAPMORATORIOS + qyConsulta.FieldByName('MORATORIOS').AsFloat;
     dSumaCAPIVAMORA:= dSumaCAPIVAMORA + qyConsulta.FieldByName('IVA_MOR').AsFloat;
     dSumaBENEFICIO_1:= dSumaBENEFICIO_1 + qyConsulta.FieldByName('BENEFICIO').AsFloat;
   End;
   If qyConsultaIDGRUPO.AsInteger = 3 Then Begin
      dSumaREFINAN01:= dSumaREFINAN01 + qyConsulta.FieldByName('IMPORTE').AsFloat;
      dSumaREFINAN02:= dSumaREFINAN02 + qyConsulta.FieldByName('MORATORIOS').AsFloat;
      dSumaREFINAN03:= dSumaREFINAN03 + qyConsulta.FieldByName('IVA_MOR').AsFloat;
   End;
   If qyConsultaIDGRUPO.AsInteger = 4 Then Begin
     dSumaCOMVENCIDO:= dSumaCOMVENCIDO + qyConsulta.FieldByName('IMPORTE').AsFloat;
     dSumaCOMMORATORIOS:= dSumaCOMMORATORIOS + qyConsulta.FieldByName('MORATORIOS').AsFloat;
     dSumaCOMIVAMORA:= dSumaCOMIVAMORA + qyConsulta.FieldByName('IVA_MOR').AsFloat;

     dSumaCOMVENCIDO_TOT:=dSumaCOMVENCIDO_TOT + qyConsulta.FieldByName('IMPORTE').AsFloat;
     dSumaCOMMORATORIOS_TOT:=dSumaCOMMORATORIOS_TOT + qyConsulta.FieldByName('MORATORIOS').AsFloat;;
     dSumaCOMIVAMORA_TOT:=dSumaCOMIVAMORA_TOT + qyConsulta.FieldByName('IVA_MOR').AsFloat;
   End;
   If qyConsultaIDGRUPO.AsInteger = 5 Then
      PrintBand:= False
   Else  PrintBand:= True;
end;

End.

