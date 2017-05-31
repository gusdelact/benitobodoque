unit IntMQrIngProm;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, IntGenCre,UnSQL2;

type
  TQrIngProm = class(TQuickRep)
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
    qyConsultaESTIMADO: TStringField;
    qyConsultaPCTSIEBAN: TFloatField;
    qyConsultaIMPSIEBAN: TFloatField;
    qyConsultaPCTSIEBINT: TFloatField;
    qyConsultaIMPSIEBINT: TFloatField;
    qyConsultaPCT_COMISION: TFloatField;
    qyConsultaIMPCOMISION: TFloatField;
    qyConsultaCVE_TASA_REFER: TStringField;
    qyConsultaMARGINTER: TFloatField;
    qyConsultaIMPSIEBANIVA: TFloatField;
    qyConsultaIMPSIEBINTERIVA: TFloatField;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    v: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    qyConsultaTOTINGRESOS: TFloatField;
    QRLabel26: TQRLabel;
    QRLabel28: TQRLabel;
    QRDBText24: TQRDBText;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr16: TQRExpr;
    QRLabel31: TQRLabel;
    QRExpr17: TQRExpr;
    QRExpr18: TQRExpr;
    QRExpr19: TQRExpr;
    QRExpr20: TQRExpr;
    QRExpr21: TQRExpr;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    procedure qyConsultaCalcFields(DataSet: TDataSet);
  private
  public
     Apli : TInterApli;
     Function FormaQuery(sFVigenciaIni,sFVigenciaFin, sFColocaIni,sFColocaFin,
                              sGpoProducto, sProducto, sPromAsoc,sPromAdmon,
                              sEmpresa, sSucursal :String) : String;
     Function ObtieneImpIva(dContrato, dCredito, dMonto : Double):Double;
  end;

var
  QrIngProm: TQrIngProm;

Procedure EjecutarRepoIngProm(sFVigenciaIni,sFVigenciaFin, sFColocaIni,sFColocaFin,
                              sGpoProducto, sProducto, sPromAsoc,sPromAdmon,
                              sEmpresa, sSucursal :String;
                              pAPli     : TInterApli; pPreview  : Boolean);
Implementation
{$R *.DFM}

Procedure EjecutarRepoIngProm(sFVigenciaIni,sFVigenciaFin, sFColocaIni,sFColocaFin,
                              sGpoProducto, sProducto, sPromAsoc,sPromAdmon,
                              sEmpresa, sSucursal :String;
                              pAPli     : TInterApli; pPreview  : Boolean);
Var
    QrIngProm   : TQrIngProm;
    Preview     : TIntQRPreview;
Begin
      QrIngProm   := TQrIngProm.Create(Nil);
      Preview := TIntQRPreview.CreatePreview(Application, QrIngProm);
      QrIngProm.Apli := pAPli;
      Try

        QrIngProm.QRInterEncabezado1.Apli:=pApli;
        QrIngProm.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
        QrIngProm.QRInterEncabezado1.NomReporte:='IntMQrIngProm';

        QrIngProm.QRInterEncabezado1.Titulo1:='Reporte de Ingresos por Promotor';

        If (sFVigenciaIni <> '')and (sFVigenciaFin<>'') Then
           QrIngProm.QRInterEncabezado1.Titulo2:='Periodo del '+  sFVigenciaIni + ' al ' + sFVigenciaFin
        Else If (sFColocaIni <> '')and (sFColocaFin<>'') Then
           QrIngProm.QRInterEncabezado1.Titulo2:='Periodo del '+  sFColocaIni + ' al ' + sFColocaFin;

        If Trim(sGpoProducto)<>'' Then
           QrIngProm.QRInterEncabezado1.Titulo2:= QrIngProm.QRInterEncabezado1.Titulo2 + ' Por GpoProducto';
        If Trim(sProducto)<>'' Then
           QrIngProm.QRInterEncabezado1.Titulo2:= QrIngProm.QRInterEncabezado1.Titulo2 + ' Por Producto';
        If Trim(sPromAsoc)<>'' Then
           QrIngProm.QRInterEncabezado1.Titulo2:= QrIngProm.QRInterEncabezado1.Titulo2 + ' Por Prom Asoc';
        If Trim(sPromAdmon)<>'' Then
           QrIngProm.QRInterEncabezado1.Titulo2:= QrIngProm.QRInterEncabezado1.Titulo2 + ' Por Prom Adm';

        QrIngProm.qyConsulta.DatabaseName := pApli.DataBaseName;
        QrIngProm.qyConsulta.SessionName := pApli.SessionName;
        QrIngProm.qyConsulta.Active:=False;
        QrIngProm.qyConsulta.SQL.Text:= QrIngProm.FormaQuery(
                              sFVigenciaIni,sFVigenciaFin, sFColocaIni,sFColocaFin,
                              sGpoProducto, sProducto, sPromAsoc,sPromAdmon,
                              sEmpresa, sSucursal);

        QrIngProm.qyConsulta.Active:=True;

        If pPreview Then
            QrIngProm.Preview
        Else
            QrIngProm.Print;
    Finally
        QrIngProm.free;
        If Assigned(Preview) Then Preview.Free;
    End;
End;

Function TQrIngProm.FormaQuery(sFVigenciaIni,sFVigenciaFin, sFColocaIni,sFColocaFin,
                              sGpoProducto, sProducto, sPromAsoc,sPromAdmon,
                              sEmpresa, sSucursal :String) : String;
Var
    sSQL:String; slSQL:TStringList;
Begin
    sSQL:= ' SELECT DISTINCT CRD.ID_CREDITO,CRD.ID_CONTRATO, CONT.ID_TITULAR, PER.NOMBRE AS CLIENTE, CONT.ID_PERS_ASOCIAD, PRAS.NOMBRE AS PROMASOC, ' +
           '        CRD.ID_PROM_ADM, PRAD.NOMBRE AS PROMADM, ' +
           '        CRD.F_AUTORIZA, CRD.F_INICIO, CRD.IMP_CREDITO, CRD.F_VENCIMIENTO, ' +
           '        CRCONT.CVE_PRODUCTO_CRE, PROD.DESC_L_PRODUCTO, ' +
           '        CRD.ID_CRED_EXTERNO, CRD.ID_CONTROL_EXT, ' +
           '        DECODE(CRREL.PCT_REAL,NULL,''  --  '',''REAL'') AS ESTIMADO, ' +
           '        DECODE(CRREL.PCT_REAL,NULL,0,CRREL.PCT_REAL) AS PCTSIEBAN, ' +
           '        DECODE(CRREL.PCT_REAL,NULL,0,CRREL.IMP_SIEBAN) AS IMPSIEBAN, ' +
           '        DECODE(CRREL.PCT_COMPARTIR,NULL,0,(100-CRREL.PCT_COMPARTIR)) AS PCTSIEBINT, ' +
           '        (DECODE(CRREL.PCT_REAL,0,DECODE(CRREL.PCT_ESTIMADO,NULL,(CRELCTO.PCT_ESTIMADO*CRD.IMP_CREDITO/100),CRREL.IMP_SIEBAN),CRREL.IMP_SIEBAN) * ' +
           '         DECODE(CRREL.PCT_COMPARTIR,NULL,(100-(CRELCTO.PCT_COMPARTIR_IN+CRELCTO.PCT_COMPARTIR_FI)),(100-CRREL.PCT_COMPARTIR))/ 100 ) AS IMPSIEBINT, ' +
           '         0 AS  PCT_COMISION, ' +
           '         NVL(CRCOM.IMP_COMISION,0) AS IMPCOMISION, ' +
           '        CRD.CVE_TASA_REFER, ' +
           //'        PKGCRCOMUN.STPCALCULAINT(CRD.ID_CREDITO,CRD.IMP_CREDITO,CRD.TASA_BASE,CRD.DIAS_PLAZO) AS MARGINTER ';
           '        DECODE(CRF.ID_CREDITO,NULL,0,PKGCOINCRE.OBTMARGEN(CRD.ID_CREDITO,NULL,NULL)) AS MARGINTER';
   If (sFVigenciaIni <>'')and( sFVigenciaFin<>'') Then
      sSQL:= sSQL + ' FROM (SELECT  CC.* ' +
                    '         FROM  CR_CREDITO CC ' +
                    '         WHERE CC.F_INICIO <=  TO_DATE('''+ sFVigenciaFin +''',''DD/MM/YYYY'')'+
                    '          AND (CC.F_LIQUIDACION >=  TO_DATE('''+ sFVigenciaIni +''',''DD/MM/YYYY'')'+
                    '           OR  CC.F_LIQUIDACION IS NULL)'+
                    '          AND  CC.SIT_CREDITO NOT IN (''CA'''+','+'''RE'')'+
                    '       )CRD'
   Else
      sSQL:= sSQL + ' FROM ( CC.* '+
                    '         FROM CR_CREDITO CC  WHERE SIT_CREDITO NOT IN (''CA'''+','+'''RE'')'+
                    '       )CRD';


   sSQL:= sSQL +
           '    ,(SELECT * FROM CONTRATO WHERE ID_EMPRESA = 2) CONT, PERSONA PER, PERSONA PRAS, PERSONA PRAD, CR_CONTRATO CRCONT,CR_PRODUCTO PROD, ' +
           '     (SELECT SUM(IMP_COMISION) AS IMP_COMISION, ID_CREDITO FROM   CR_COMISION WHERE  CVE_COMISION <> ''CUFEGA'' AND F_VENCIMIENTO BETWEEN TO_DATE('''+ sFVigenciaIni +''',''DD/MM/YYYY'') AND TO_DATE('''+ sFVigenciaFin +''',''DD/MM/YYYY'') GROUP BY ID_CREDITO) CRCOM, '+
           '     (SELECT * FROM CR_FND_CREDITO) CRF, ' +
           '     (SELECT * FROM CR_REL_DISP_SIEB WHERE SIT_REL_DISP_SIE <> ''CA'' AND F_RECEPCION BETWEEN TO_DATE('''+ sFVigenciaIni +''',''DD/MM/YYYY'') AND TO_DATE('''+ sFVigenciaFin +''',''DD/MM/YYYY'')) CRREL, '+
           '      CR_REL_CTO_SIEB CRELCTO ' +
           ' WHERE CRD.ID_CONTRATO = CONT.ID_CONTRATO ' +
           ' AND CONT.ID_TITULAR = PER.ID_PERSONA ' +
           ' AND CONT.ID_PERS_ASOCIAD = PRAS.ID_PERSONA ' +
           ' AND CRD.ID_PROM_ADM = PRAD.ID_PERSONA ' +
           ' AND CRCOM.ID_CREDITO (+)= CRD.ID_CREDITO ' +
           ' AND CONT.ID_CONTRATO = CRCONT.ID_CONTRATO ' +
           ' AND CRCONT.CVE_PRODUCTO_CRE = PROD.CVE_PRODUCTO_CRE ' +
           ' AND CRREL.ID_CREDITO(+) = CRD.ID_CREDITO  ' +
           ' AND CONT.ID_CONTRATO = CRELCTO.ID_CONTRATO(+) ' +
           ' AND CRF.ID_CREDITO (+)= CRD.ID_CREDITO ';

        If (Trim(sFColocaIni)<>'') Then Begin
            sSQL:= sSQL + ' AND CRD.F_INICIO >= TO_DATE('''+
                   FormatDateTime('DD/MM/YYYY',StrToDate(sFColocaIni))+''',''DD/MM/YYYY'')';
        End;
        If (Trim(sFColocaFin)<>'') Then Begin
            sSQL:= sSQL + ' AND CRD.F_INICIO <= TO_DATE('''+
                   FormatDateTime('DD/MM/YYYY',StrToDate(sFColocaFin))+''',''DD/MM/YYYY'')';
        End;

        If (Trim( sGpoProducto)<>'') Then
           sSQL:= sSQL + ' AND  PROD.CVE_PRODUCTO_GPO = '+ SQLStr(sGpoProducto);
        If (Trim(sProducto)<>'') Then
            sSQL:= sSQL + ' AND  PROD.CVE_PRODUCTO_CRE ='+ SQLStr(sProducto);
        If (Trim(sPromAsoc)<>'') Then
            sSQL:= sSQL + ' AND  CONT.ID_PERS_ASOCIAD ='+ sPromAsoc;
        If (Trim(sPromAdmon)<>'') Then
            sSQL:= sSQL + ' AND  CRD.ID_PROM_ADM ='+ sPromAdmon;
        If (Trim(sEmpresa)<>'') Then      //SASB
            sSQL:= sSQL + ' AND  PROD.ID_EMPRESA ='+ Trim(sEmpresa);

       sSQL:= sSQL + ' ORDER BY PROMASOC, PROMADM';

    slSQL:= TStringList.Create;
    slSQL.Clear;
    slSQL.Add(sSQL);
    slSQL.SaveToFile('c:\SQL.txt');
    slSQL.Free;
    Result:= sSQL;
End;


procedure TQrIngProm.qyConsultaCalcFields(DataSet: TDataSet);
begin
///PROCEDIMEINTO DE CALCULO DE IMPORTE SIEBAN

       if qyConsultaESTIMADO.AsString = 'REAL' then
       begin
            qyConsultaIMPSIEBANIVA.AsFloat := qyConsultaIMPSIEBAN.AsFloat / ObtieneImpIva(qyConsultaID_CONTRATO.AsFloat,qyConsultaID_CREDITO.AsFloat , qyConsultaIMPSIEBAN.AsFloat);
            qyConsultaIMPSIEBINTERIVA.AsFloat := qyConsultaIMPSIEBINT.AsFloat / ObtieneImpIva(qyConsultaID_CONTRATO.AsFloat,qyConsultaID_CREDITO.AsFloat , qyConsultaIMPSIEBINT.AsFloat);
            qyConsultaTOTINGRESOS.AsFloat := qyConsultaIMPSIEBINTERIVA.AsFloat + qyConsultaIMPCOMISION.AsFloat + qyConsultaMARGINTER.AsFloat;
       end
       else
       begin
            qyConsultaTOTINGRESOS.AsFloat := qyConsultaIMPCOMISION.AsFloat + qyConsultaMARGINTER.AsFloat;
       end;

//       Else If qyConsultaESTIMADO.AsString = 'ESTIMADO' Then Begin
//              qyConsultaIMPSIEBANIVA.AsFloat := qyConsultaIMPSIEBAN.AsFloat;
//              qyConsultaIMPSIEBINTERIVA.AsFloat := qyConsultaIMPSIEBINT.AsFloat;
//       End;
//       qyConsultaTOTINGRESOS.AsFloat := qyConsultaIMPSIEBANIVA.AsFloat + qyConsultaIMPSIEBINTERIVA.AsFloat + qyConsultaIMPCOMISION.AsFloat + qyConsultaMARGINTER.AsFloat;   ROIM19102004
//       qyConsultaTOTINGRESOS.AsFloat := qyConsultaIMPSIEBINTERIVA.AsFloat + qyConsultaIMPCOMISION.AsFloat + qyConsultaMARGINTER.AsFloat;

End;

Function TQrIngProm.ObtieneImpIva(dContrato, dCredito, dMonto : Double):Double;
Var
   STP_IVA : TStoredProc;
   vlError : String;
Begin
   STP_IVA := TStoredProc.Create(Self);
   Try
      With STP_IVA Do Begin
         STP_IVA.DatabaseName:= Apli.DatabaseName;
         STP_IVA.SessionName:= Apli.SessionName;
         STP_IVA.StoredProcName:='PKGCRCOMUN.STPOBTENPCTIVA';
         Params.Clear;
         Params.CreateParam(ftFloat,'PEIDCONTRATO',ptInput);
         Params.CreateParam(ftFloat,'PEIDCREDITO',ptInput);
         Params.CreateParam(ftFloat,'PEMONTO',ptInput);
         Params.CreateParam(ftFloat,'PSPCTIVA',ptOutput);
         Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
         Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);

         ParamByName('PEIDCONTRATO').AsFloat := dContrato;
         ParamByName('PEIDCREDITO').AsFloat := dCredito;
         ParamByName('PEMONTO').AsFloat := dMonto;
         ExecProc;

         If (STP_IVA.ParamByName('PSRESULTADO').AsInteger <>0) Then Begin
            Result := 0;
            vlError := 'PROBLEMAS AL OBTENER EL PORCENTAJE DE IVA: '+ STP_IVA.ParamByName('PSTXRESULTADO').AsString +
                       ' : '+  IntToStr(STP_IVA.ParamByName('PSRESULTADO').AsInteger);
            //AddLine(MErrores,vlError);
         End Else Begin
            Result := 1 + (STP_IVA.ParamByName('PSPCTIVA').AsFloat/100);
         End;
      End;
   Finally
      STP_IVA.Free;
   End;
End;


End.

