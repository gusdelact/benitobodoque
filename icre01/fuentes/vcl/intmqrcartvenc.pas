unit IntMQrCartVenc;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, IntGenCre,UnSQL2;

type
  TQrCartVenc = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    qyConsulta: TQuery;
    QRBand1: TQRBand;
    QRFoot1: TQRBand;
    QRBand4: TQRBand;
    QRBand5: TQRBand;
    QRExpr6: TQRExpr;
    QRDBText7: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRFoot2: TQRBand;
    QRExpr3: TQRExpr;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape2: TQRShape;
    QRLabel16: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel9: TQRLabel;
    QRFoot3: TQRBand;
    QRGroup3: TQRGroup;
    QRDBText5: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText16: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel17: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel24: TQRLabel;
    v: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText24: TQRDBText;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr15: TQRExpr;
    QRLabel31: TQRLabel;
    QRExpr17: TQRExpr;
    QRExpr18: TQRExpr;
    QRExpr19: TQRExpr;
    QRExpr20: TQRExpr;
    QRLabel4: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText21: TQRDBText;
    qyConsultaID_CREDITO: TFloatField;
    qyConsultaID_CONTRATO: TFloatField;
    qyConsultaID_TITULAR: TFloatField;
    qyConsultaCLIENTE: TStringField;
    qyConsultaID_PERS_ASOCIAD: TFloatField;
    qyConsultaPROMASOC: TStringField;
    qyConsultaID_PROM_ADM: TFloatField;
    qyConsultaPROMADM: TStringField;
    qyConsultaF_AUTORIZA: TDateTimeField;
    qyConsultaF_INICIO: TDateTimeField;
    qyConsultaIMP_CREDITO: TFloatField;
    qyConsultaF_VENCIMIENTO: TDateTimeField;
    qyConsultaCVE_PRODUCTO_CRE: TStringField;
    qyConsultaDESC_L_PRODUCTO: TStringField;
    qyConsultaID_CRED_EXTERNO: TStringField;
    qyConsultaID_CONTROL_EXT: TStringField;
    qyConsultaIMP_CAPITAL_VDO: TFloatField;
    qyConsultaIMP_VDO_FINAN_A: TFloatField;
    qyConsultaIMP_INTERES_VDO: TFloatField;
    qyConsultaIMPMORCAP: TFloatField;
    qyConsultaPCT_COMISION: TFloatField;
    qyConsultaIMP_IVA_COM_VDO: TFloatField;
    qyConsultaTOTVENCIDO: TFloatField;
    QRExpr4: TQRExpr;
    QRExpr22: TQRExpr;
    QRExpr23: TQRExpr;
    QRExpr24: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
  private
  public
     Apli : TInterApli;
     Function LlenaEncabezado(sFInicio,sFFin,sProducto,
                         sPromAsoc,sPromAdmon, sEmpresa, sSucursal : String) : String;
  end;
var
  QrCartVenc: TQrCartVenc;

Procedure EjecutarReporteIngPromotor(  sF_Inicio,sF_Fin,sProducto,
                            sPromAsoc,sPromAdmon,
                            sEmpresa, sSucursal :String;//SASB
                            pAPli     : TInterApli;
                            pPreview  : Boolean);
Implementation
{$R *.DFM}

Procedure EjecutarReporteIngPromotor(   sF_Inicio,sF_Fin,sProducto,
                            sPromAsoc,sPromAdmon, sEmpresa, sSucursal :String;
                            pAPli     : TInterApli;
                            pPreview  : Boolean);
Var
    QrCartVenc   : TQrCartVenc;
    Preview     : TIntQRPreview;
Begin
      QrCartVenc   := TQrCartVenc.Create(Nil);
      Preview := TIntQRPreview.CreatePreview(Application, QrCartVenc);
      QrCartVenc.Apli := pAPli;
      Try
        QrCartVenc.QRInterEncabezado1.Apli:=pApli;
        QrCartVenc.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
        QrCartVenc.QRInterEncabezado1.NomReporte:='IntMQrCartVenc';
        QrCartVenc.QRInterEncabezado1.Titulo1:='Reporte Cartera Vencida por Promotor';
        QrCartVenc.QRInterEncabezado1.Titulo2:='Periodo del '+  sF_Inicio + ' al ' + sF_Fin;
        QrCartVenc.qyConsulta.DatabaseName := pApli.DataBaseName;
        QrCartVenc.qyConsulta.SessionName := pApli.SessionName;
        QrCartVenc.qyConsulta.Active:=False;
        QrCartVenc.qyConsulta.SQL.Text:= QrCartVenc.LlenaEncabezado( sF_Inicio,sF_Fin,sProducto,
                                                                   sPromAsoc,sPromAdmon,sEmpresa, sSucursal);
        QrCartVenc.qyConsulta.Active:=True;
        If pPreview Then
            QrCartVenc.Preview
        Else
            QrCartVenc.Print;
    Finally
        QrCartVenc.free;
        If Assigned(Preview) Then Preview.Free;
    End;
End;

Function TQrCartVenc.LlenaEncabezado(sFInicio,sFFin,sProducto,
                     sPromAsoc,sPromAdmon,
                     sEmpresa, sSucursal : String) : String;
Var
    sSQL:String;
Begin
    sSQL:= ' SELECT CRD.ID_CREDITO,CRD.ID_CONTRATO, CONT.ID_TITULAR, PER.NOMBRE AS CLIENTE, CONT.ID_PERS_ASOCIAD, ' +
           '        PRAS.NOMBRE AS PROMASOC,CRD.ID_PROM_ADM, PRAD.NOMBRE AS PROMADM, ' +
           '        CRD.F_AUTORIZA, CRD.F_INICIO, CRD.IMP_CREDITO, CRD.F_VENCIMIENTO, ' +
           '        CRCONT.CVE_PRODUCTO_CRE, PROD.DESC_L_PRODUCTO, ' +
           '        CRD.ID_CRED_EXTERNO, CRD.ID_CONTROL_EXT, ' +
           '        CRD.IMP_CAPITAL_VDO, CRD.IMP_VDO_FINAN_A, CRD.IMP_INTERES_VDO, ' +
           '        (NVL(CRD.IMP_MOR_CAPITAL,0) + NVL(CRD.IMP_MOR_FINAN_A,0) + NVL(CRD.IMP_MOR_COMISION,0)) AS IMPMORCAP, ' +
           '        CATCOM.PCT_COMISION, CRD.IMP_IVA_COM_VDO, ' +
           '        (NVL(CRD.IMP_CAPITAL_VDO,0) + NVL(CRD.IMP_VDO_FINAN_A,0) + NVL(CRD.IMP_INTERES_VDO,0) + (NVL(CRD.IMP_MOR_CAPITAL,0) + ' +
           '         NVL(CRD.IMP_MOR_FINAN_A,0) + NVL(CRD.IMP_MOR_COMISION,0)) + NVL(CRD.IMP_IVA_COM_VDO,0)) AS TOTVENCIDO ' +
           ' FROM CR_CREDITO CRD, CONTRATO CONT, PERSONA PER, PERSONA PRAS, PERSONA PRAD, CR_CONTRATO CRCONT,CR_PRODUCTO PROD, ' +
           '      CR_COMISION CRCOM, CR_CAT_COMISION CATCOM ' +
           ' WHERE CRD.ID_CONTRATO = CONT.ID_CONTRATO ' +
           ' AND CONT.ID_TITULAR = PER.ID_PERSONA ' +
           ' AND CONT.ID_PERS_ASOCIAD = PRAS.ID_PERSONA ' +
           ' AND CRD.ID_PROM_ADM = PRAD.ID_PERSONA ' +
           ' AND CONT.ID_CONTRATO = CRCONT.ID_CONTRATO ' +
           ' AND CRCONT.CVE_PRODUCTO_CRE = PROD.CVE_PRODUCTO_CRE ' +
           ' AND CRD.ID_CREDITO = CRCOM.ID_CREDITO(+) ' +
           ' AND CRCOM.CVE_COMISION = CATCOM.CVE_COMISION(+) ' +
           ' AND CRD.SIT_CREDITO = ''AC''' ;

        If (Trim(sFInicio)<>'') Then Begin
            sSQL:= sSQL + ' AND CRD.F_INICIO >= TO_DATE('''+
                   FormatDateTime('DD/MM/YYYY',StrToDate(sFInicio))+''',''DD/MM/YYYY'')';
        End;
        If (Trim(sFFin)<>'') Then Begin
            sSQL:= sSQL + ' AND CRD.F_INICIO <= TO_DATE('''+
                   FormatDateTime('DD/MM/YYYY',StrToDate(sFFin))+''',''DD/MM/YYYY'')';
        End;
        If (Trim(sProducto)<>'') Then
            sSQL:= sSQL + ' AND  PROD.CVE_PRODUCTO_CRE ='''+sProducto+'''';
        If (Trim(sPromAsoc)<>'') Then
            sSQL:= sSQL + ' AND  CONT.ID_PERS_ASOCIAD ='+ sPromAsoc;
        If (Trim(sPromAdmon)<>'') Then
            sSQL:= sSQL + ' AND  CRD.ID_PROM_ADM ='+ sPromAdmon;
        If (Trim(sEmpresa)<>'') Then //SASB
            sSQL:= sSQL + ' AND  PROD.ID_EMPRESA ='+ Trim(sEmpresa);

       sSQL:= sSQL + ' ORDER BY PROMASOC, PROMADM';
    Result:= sSQL;
End;
End.

