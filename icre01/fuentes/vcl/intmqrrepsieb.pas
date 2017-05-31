unit IntMQrRepSieb;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview;

type
  TQrRepSieb = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    ColumnHeaderBand1: TQRBand;
    QRDBText8: TQRDBText;
    QRDBText1: TQRDBText;
    qyQuery: TQuery;
    QRBandPromotor: TQRBand;
    QRExpr6: TQRExpr;
    QRBandEmisor: TQRBand;
    QRDBText21: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRExpr23: TQRExpr;
    QRLabel14: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape1: TQRShape;
    QRLabel9: TQRLabel;
    QRShape2: TQRShape;
    QRLabel13: TQRLabel;
    QRShape5: TQRShape;
    QRLabel18: TQRLabel;
    QRShape6: TQRShape;
    QRLabel20: TQRLabel;
    QRShape7: TQRShape;
    QRLabel22: TQRLabel;
    QRShape8: TQRShape;
    QRLabel24: TQRLabel;
    QRShape9: TQRShape;
    QRLabel25: TQRLabel;
    QRShape10: TQRShape;
    QRLabel27: TQRLabel;
    QRShape13: TQRShape;
    QRShape20: TQRShape;
    QRDBText17: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText32: TQRDBText;
    QRShape4: TQRShape;

    QRGroupMoneda: TQRGroup;
    QRGroupPromotor: TQRGroup;
    QRGroupEmisor: TQRGroup;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape14: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel15: TQRLabel;
    BandMoneda: TQRBand;
    QRExpr3: TQRExpr;
    QRLabel17: TQRLabel;
    QRShape18: TQRShape;
    QRDBText31: TQRDBText;
    QRDBText33: TQRDBText;
    QRLabel26: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRShape3: TQRShape;
    QRLabel7: TQRLabel;
    QRShape19: TQRShape;
    QRLabel11: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
  private
  public
    Function FormaQuery(sMoneda,sPromotor,sAcreditado,
                        sEmpresa, sSucursal:String;pAPli: TInterApli):String;
  end;

var
  QrRepSieb: TQrRepSieb;

Procedure RepSieb( sMoneda,sPromotor,sAcreditado,
                   sEmpresa, sSucursal:String;
                   pAPli     : TInterApli; pPreview  : Boolean);
Implementation
{$R *.DFM}

Procedure RepSieb(sMoneda,sPromotor,sAcreditado,
                  sEmpresa, sSucursal:String;
                  pAPli     : TInterApli; pPreview  : Boolean);
Var
    QrRepSieb : TQrRepSieb;
    VLTitulo  : String;
    Preview   : TIntQRPreview;
Begin
    VLTitulo := '';
    QrRepSieb:=TQrRepSieb.Create(Nil);
    Preview := TIntQRPreview.CreatePreview(Application, QrRepSieb);
    Try
        QrRepSieb.QRInterEncabezado1.Apli:=pApli;
        QrRepSieb.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
        QrRepSieb.QRInterEncabezado1.NomReporte:='IntMQrRepSieb';
        QrRepSieb.QRInterEncabezado1.Titulo1:='Reporte de SIEBAN';

        QrRepSieb.qyQuery.DatabaseName := pApli.DataBaseName;
        QrRepSieb.qyQuery.SessionName := pApli.SessionName;
        QrRepSieb.qyQuery.Active:=False;
        QrRepSieb.qyQuery.SQL.Text:= QrRepSieb.FormaQuery(sMoneda, sPromotor, sAcreditado,
                                                          sEmpresa, sSucursal, pAPli);

        If (Trim(sMoneda)<>'') Then
            VLTitulo := VLTitulo + ' Por Moneda';
        If (Trim(sPromotor)<>'') Then
            VLTitulo := VLTitulo + ' Por Prom.Adm.';
        If (Trim(sAcreditado)<>'') Then
            VLTitulo := VLTitulo + ' Por Acreditado';

        QrRepSieb.QRInterEncabezado1.Titulo2 := VLTitulo;
        QrRepSieb.qyQuery.Active:=False;
        QrRepSieb.qyQuery.Active:=True;

        If pPreview Then
            QrRepSieb.Preview
        Else
            QrRepSieb.Print;
    Finally
        QrRepSieb.free;
    End;
End;

Function TQrRepSieb.FormaQuery(sMoneda,sPromotor,sAcreditado,
                               sEmpresa, sSucursal :String;pAPli: TInterApli):String;
Var
    sSQL:String;
Begin
    sSQL:=  'SELECT TABLA.*, '+
            '       (IMP_SIEBAN*100/(100+PCT_IVA)) IMP_NETO, '+
            '       (IMP_SIEBAN*PCT_IVA/(100+PCT_IVA)) IMP_SIN_IVA, '+
            '       (100 - PCT_COMPARTIR)PCT_BANCO, '+
            '       (IMP_SIEBAN*(100 - PCT_COMPARTIR)/(100+PCT_IVA)) IMP_BANCO, '+
            '       (IMP_SIEBAN* PCT_COMPARTIR/(100+PCT_IVA)) IMP_PARA, '+
            '       (IMP_SIEBAN*(100 - PCT_COMPARTIR)/(100)) IMP_BANCO_CI, '+
            '       (IMP_SIEBAN* PCT_COMPARTIR/(100)) IMP_PARA_CI, '+
            '       DECODE(SITUACION,''DI'',FECHA_INI.F_LIQ_CLIENTE,''DT'',FECHA_FIN.F_LIQ_CLIENTE,NULL)FECHA '+
            '  FROM ( '+
            '        SELECT CR_CREDITO.ID_CONTROL_EXT, '+
            '               CR_REL_DISP_SIEB.ID_CREDITO, '+
            '               CR_REL_DISP_SIEB.ID_SOLICITUD, '+
            '               CR_CREDITO.F_AUTORIZA, '+
            '               CR_CREDITO.IMP_CREDITO, '+
            '               CR_REL_DISP_SIEB.F_RECEPCION, '+
            '               FACT.F_PAGO, '+
            '               FACT.ID_FACTURA, '+
            '               FACT.NUM_FACTURA, '+
            '               FACT.F_ALTA, '+
            '               PKGCRDOCUMENTACION.OBTIVA(CR_CREDITO.ID_CONTRATO, CR_CREDITO.ID_CREDITO,CR_REL_DISP_SIEB.IMP_SIEBAN)PCT_IVA, '+
            '               CR_REL_DISP_SIEB.IMP_SIEBAN, '+
            '               NVL(DEVUELTO.PCT_INI,0)PCT_INI, '+
            '               NVL(DEVUELTO.PCT_FIN,0)PCT_FIN, '+
            '               NVL(DEVUELTO.IMP_INI,0)IMP_INI, '+
            '               NVL(DEVUELTO.IMP_FIN,0)IMP_FIN, '+
            '               CR_REL_DISP_SIEB.PCT_COMPARTIR, '+
            '               (NVL(DEVUELTO.PCT_INI,0) + NVL(DEVUELTO.PCT_FIN,0))PCT_COMPART, '+
            '               (NVL(DEVUELTO.IMP_INI,0)+ NVL(DEVUELTO.IMP_FIN,0))IMP_COMPART, '+
            '               DECODE(CR_REL_DISP_SIEB.SIT_REL_DISP_SIE,''AC'',''Activo'',''FA'',''Facturado'',''DI'',''Dev.Inicio'',''DT'',''Dev.Total'',''CA'',''Cancelado'','' '')SIT_REL_DISP_SIE, '+
            '               CR_REL_DISP_SIEB.SIT_REL_DISP_SIE SITUACION,'+
            '               CR_CONTRATO.CVE_MONEDA, '+
            '               MONEDA.DESC_MONEDA, '+
            '               CR_CREDITO.ID_PROM_ADM, '+
            '               PERSONA.NOMBRE NOM_PROM_ADM, '+
            '               CONTRATO.ID_TITULAR, '+
            '               TITULAR.NOMBRE, '+
            '               CONTRATO.ID_CONTRATO, '+
            '               CR_REL_DISP_SIEB.PCT_ESTIMADO, '+
            '               CR_PRODUCTO.ID_EMPRESA '+ //SASB
            '          FROM CR_REL_DISP_SIEB, CR_CREDITO,CF_FACTURA@CONT FACT, '+
            '              (SELECT SUM(NVL(DECODE(CR_DET_DISP_SIEB.CVE_TIPO_COMPART,''IN'',NVL(CR_DET_DISP_SIEB.PCT_COMPARTIR,0)),0))PCT_INI, '+
            '                      SUM(NVL(DECODE(CR_DET_DISP_SIEB.CVE_TIPO_COMPART,''FI'',NVL(CR_DET_DISP_SIEB.PCT_COMPARTIR,0)),0))PCT_FIN, '+
            '                      SUM(NVL(DECODE(CR_DET_DISP_SIEB.CVE_TIPO_COMPART,''IN'',NVL(CR_DET_DISP_SIEB.IMP_COMPARTIR,0)),0))IMP_INI, '+
            '                      SUM(NVL(DECODE(CR_DET_DISP_SIEB.CVE_TIPO_COMPART,''FI'',NVL(CR_DET_DISP_SIEB.IMP_COMPARTIR,0)),0))IMP_FIN, '+
            '                      CR_DET_DISP_SIEB.ID_SOLICITUD '+
            '                 FROM CR_DET_DISP_SIEB '+
            '                WHERE CR_DET_DISP_SIEB.SIT_DET_DISP_SIE = ''DV'' '+
            '                GROUP BY CR_DET_DISP_SIEB.ID_SOLICITUD)DEVUELTO, '+
            '               CR_CONTRATO, MONEDA, PERSONA , CONTRATO,PERSONA TITULAR, '+
            '               CR_PRODUCTO '+ //SASB
            '         WHERE CR_REL_DISP_SIEB.ID_CREDITO = CR_CREDITO.ID_CREDITO '+
            '           AND CR_REL_DISP_SIEB.ID_FACTURA = FACT.ID_FACTURA(+) '+
            '           AND FACT.ID_EMPRESA(+) = '+ IntToStr(pAPli.IdEmpresa) +
            '           AND CR_REL_DISP_SIEB.ID_SOLICITUD = DEVUELTO.ID_SOLICITUD(+) '+
            '           AND CR_CREDITO.ID_CONTRATO = CR_CONTRATO.ID_CONTRATO '+
            '           AND CR_CREDITO.FOL_CONTRATO = CR_CONTRATO.FOL_CONTRATO '+
            '           AND CR_CONTRATO.CVE_MONEDA = MONEDA.CVE_MONEDA '+
            '           AND CR_CREDITO.ID_PROM_ADM = PERSONA.ID_PERSONA '+
            '           AND CR_CREDITO.ID_CONTRATO = CONTRATO.ID_CONTRATO '+
            '           AND CONTRATO.ID_TITULAR = TITULAR.ID_PERSONA '+
            '           AND CR_CONTRATO.CVE_PRODUCTO_CRE = CR_PRODUCTO.CVE_PRODUCTO_CRE '+
            '        )TABLA, '+
            '        ( SELECT ID_SOLICITUD, F_LIQ_CLIENTE '+
            '            FROM CR_DET_DISP_SIEB '+
            '           WHERE CVE_TIPO_COMPART=''IN'')FECHA_INI, '+
            '				( SELECT ID_SOLICITUD,F_LIQ_CLIENTE '+
            '            FROM CR_DET_DISP_SIEB '+
            '           WHERE CVE_TIPO_COMPART=''FI'')FECHA_FIN '+
            '   WHERE TABLA.ID_SOLICITUD = FECHA_INI.ID_SOLICITUD(+)'+
            '     AND TABLA.ID_SOLICITUD = FECHA_FIN.ID_SOLICITUD(+)';

    If (Trim(sMoneda)<>'') Then
        sSQL:= sSQL + ' AND   TABLA.CVE_MONEDA ='+ Trim(sMoneda);
    If (Trim(sPromotor)<>'') Then
        sSQL:= sSQL + ' AND   TABLA.ID_PROM_ADM ='+ Trim(sPromotor);
    If (Trim(sAcreditado)<>'') Then
        sSQL:= sSQL + ' AND   TABLA.ID_TITULAR ='+ Trim(sAcreditado);
    If (Trim(sEmpresa)<>'') Then   //SASB
        sSQL:= sSQL + ' AND   TABLA.ID_EMPRESA ='+ Trim(sEmpresa);

    sSQL:= sSQL + ' ORDER BY TABLA.DESC_MONEDA, TABLA.NOM_PROM_ADM, TABLA.NOMBRE, TABLA.ID_CREDITO';
    Result:= sSQL;
End;

End.
