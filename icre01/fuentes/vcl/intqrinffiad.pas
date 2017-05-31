unit IntQrInfFiAd;

interface
               
uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  UnSQL2, IntQRPreview, IntGenCre;
const
   coCRLF      = #13#10;

type                 //TQrInfFiAd
  TQrInfFiAd = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    ColumnHeaderBand1: TQRBand;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape4: TQRShape;
    QRLabel17: TQRLabel;
    QRShape5: TQRShape;
    QRLabel18: TQRLabel;
    QRShape6: TQRShape;
    QRLabel20: TQRLabel;
    QRShape7: TQRShape;
    QRLabel22: TQRLabel;
    QRShape8: TQRShape;
    QRLabel24: TQRLabel;
    QRBand1: TQRBand;
    QRFooterMoneda: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBTSituacion: TQRDBText;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRFooterProducto: TQRBand;
    QRDBText6: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRExpr34: TQRExpr;
    QRExpr35: TQRExpr;
    QRExpr36: TQRExpr;
    QRExpr62: TQRExpr;
    QRExpr63: TQRExpr;
    QRExpr64: TQRExpr;
    QRLabel12: TQRLabel;
    QRLabel19: TQRLabel;
    QRShape22: TQRShape;
    QRLabel43: TQRLabel;
    QRShape24: TQRShape;
    QRDBText9: TQRDBText;
    QRLabel46: TQRLabel;
    QRDBText15: TQRDBText;
    QRShape28: TQRShape;
    QRLabel2: TQRLabel;
    dbProducto: TQRDBText;
    QRDBText16: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText30: TQRDBText;
    QRDBText10: TQRDBText;
    QRShape31: TQRShape;
    QRGroupMoneda: TQRGroup;
    QRGroupTipoProducto: TQRGroup;
    QRTitular: TQRGroup;
    QRLabel4: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape3: TQRShape;
    QRFootTitular: TQRBand;
    QRExpr94: TQRExpr;
    QRExpr95: TQRExpr;
    QRExpr96: TQRExpr;
    QRLabel26: TQRLabel;
    QRDBText22: TQRDBText;
    QRDBText1: TQRDBText;
    qyInfFinAdic: TQuery;
    qyInfFinAdicID_CONTRATO: TFloatField;
    qyInfFinAdicNOMBRE: TStringField;
    qyInfFinAdicID_TITULAR: TFloatField;
    qyInfFinAdicSALDO_ANTERIOR: TFloatField;
    qyInfFinAdicSALDO_NUEVO: TFloatField;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    qyInfFinAdicID_CRED_EXTERNO: TStringField;
    qyInfFinAdicIMP_FINAN_ADIC: TFloatField;
    qyInfFinAdicDESC_MONEDA: TStringField;
    qyInfFinAdicCVE_PRODUCTO_CRE: TStringField;
    qyInfFinAdicCVE_USU_ALTA: TStringField;
    qyInfFinAdicCVE_MONEDA: TFloatField;
    qyInfFinAdicID_CREDITO: TFloatField;
    qyInfFinAdicID_CONTROL_EXT: TStringField;
    qyInfFinAdicID_PERIODO: TFloatField;
    qyInfFinAdicID_TRANSACCION: TFloatField;
    qyInfFinAdicF_INI_INT: TDateTimeField;
    qyInfFinAdicF_INICIO: TDateTimeField;
    qyInfFinAdicF_VTO_CRED: TDateTimeField;
    qyInfFinAdicF_VTO_INT: TDateTimeField;
    qyInfFinAdicFH_ALTA: TDateTimeField;
    QRShape11: TQRShape;
    QRLabel6: TQRLabel;
    QRDBText8: TQRDBText;
    qyInfFinAdicFH_CANCELA: TDateTimeField;
    QRShape13: TQRShape;
    QRLabel10: TQRLabel;
    QRDBText12: TQRDBText;
    qyInfFinAdicSITUACION: TStringField;
    qyInfFinAdicF_VALOR: TDateTimeField;
    qyInfFinAdicDESC_L_PRODUCTO: TStringField;
    QRDBText11: TQRDBText;
    QRDBText31: TQRDBText;
    qyInfFinAdicCUENTA_K: TStringField;
    qyInfFinAdicCUENTA_I: TStringField;
    qyInfFinAdicCVE_FINAN_ADIC: TStringField;
    QRLabel9: TQRLabel;
    QRDBText13: TQRDBText;
    QRShape12: TQRShape;
    procedure qyInfFinAdicCalcFields(DataSet: TDataSet);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
  public

    Function FormaQuery(sF_Inicio,sF_Final,sAcreditado,
                            sDisposicion,sDetalle,sOrden,
                            sIdCredExt,sIdCtrlExt,
                            sEmpresa, sSucursal, sSitMov, sSitDisp:String):String;
  end;
const
  coSELECT_TRANSACCION =  '( SELECT  ' +  
                          '         @@AFECTACION@@ AS SIT_AFECTACION, CT.ID_TRANSACCION, '  +
                          '  CT.ID_CREDITO,      CT.ID_PERIODO,  CT.IMP_NETO, '  +
                          '  CT.CVE_USU_ALTA,    CT.F_OPERACION, CT.F_VALOR, '  +
                          '  CT.SIT_TRANSACCION, CT.CVE_OPERACION, CT.FH_CANCELA, '  +
                          '  CT.CVE_TIPO_MOVTO, CT.TIPO_CAMBIO, CT.ID_TRANS_CANCELA, '  +
                          '  DECODE(CT.CVE_TIPO_MOVTO,''AN'',''ANTICIPADO'',''AV'',''ANTICIPADO'', '  +
                                                      '''MD'',''PROGRAMADO'',''MV'',''PROGRAMADO'', '  +
                                                      '''IM'',''IMPAGADO'',''IMPAGADO'') SITUACION  '  +
                          '  FROM   CR_TRANSACCION CT ' ;

  coCveOperAC = ' ( SELECT CVE_PAG_IN_FN FROM CR_PARAMETRO WHERE CVE_PARAMETRO = ''CRE'') ' + coCRLF;

  coCveOperCA = ' ( SELECT CO.CVE_OPER_CANCELA FROM CR_PARAMETRO CP, CR_OPERACION CO  ' +
                '   WHERE CP.CVE_PARAMETRO = ''CRE'' AND CP.CVE_PAG_IN_FN = CO.CVE_OPERACION )' ;
var
  QrInfFiAd: TQrInfFiAd;

Procedure RepInfFinAdic(   sF_Inicio,sF_Final,sAcreditado,
                            sDisposicion,sDetalle,sOrden,
                            sIdCredExt,sIdCtrlExt,
                            sEmpresa, sSucursal, sSitMov, sSitDisp:String;
                            pAPli     : TInterApli;
                            pPreview  : Boolean);
Implementation
{$R *.DFM}

Procedure RepInfFinAdic(   sF_Inicio,sF_Final,sAcreditado,
                            sDisposicion,sDetalle,sOrden,
                            sIdCredExt,sIdCtrlExt,
                            sEmpresa, sSucursal, sSitMov,sSitDisp:String;
                            pAPli     : TInterApli;
                            pPreview  : Boolean);
Var
    QrInfFiAd : TQrInfFiAd;
    Preview     : TIntQRPreview;
    sTitulo  : String;
Begin
    QrInfFiAd:=TQrInfFiAd.Create(Nil);
    sTitulo  := '';
    Preview := TIntQRPreview.CreatePreview(Application, QrInfFiAd);
    Try

        QrInfFiAd.QRInterEncabezado1.Apli:=pApli;
        QrInfFiAd.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
        QrInfFiAd.QRInterEncabezado1.NomReporte:='IntMQrInfFiAd';
        sTitulo  :='Informe de Financiamiento Adicional (Capitalizaciones)';

        IF sSitDisp = 'VI' THEN
            sTitulo  := sTitulo + ' Disposiciones Vigentes'
        ELSE IF sSitDisp = 'VE' THEN
            sTitulo  := sTitulo + ' Disposiciones Vencidas';

        IF sSitMov = 'CA' THEN
            sTitulo  := sTitulo + ' CANCELADAS';

        QrInfFiAd.QRInterEncabezado1.Titulo1:= sTitulo;




        If Trim(sF_Inicio)<>'' Then
            QrInfFiAd.QRInterEncabezado1.Titulo2:=QrInfFiAd.QRInterEncabezado1.Titulo2 + ' del día '+
                                        sF_Inicio + ' al día ' + sF_Final;


        QrInfFiAd.qyInfFinAdic.DatabaseName := pApli.DataBaseName;
        QrInfFiAd.qyInfFinAdic.SessionName := pApli.SessionName;

        If Trim(sDetalle)='D' Then
            QrInfFiAd.QRBand1.Enabled:=True
        Else
            QrInfFiAd.QRBand1.Enabled:=False;

        QrInfFiAd.qyInfFinAdic.Active:=False;
        QrInfFiAd.qyInfFinAdic.SQL.Text:= QrInfFiAd.FormaQuery(sF_Inicio,sF_Final,sAcreditado,
                            sDisposicion,sDetalle,sOrden, sIdCredExt,sIdCtrlExt,sEmpresa, sSucursal, sSitMov, sSitDisp);
        QrInfFiAd.qyInfFinAdic.Active:=True;

        If pPreview Then
            QrInfFiAd.Preview
        Else
            QrInfFiAd.Print;
    Finally
        QrInfFiAd.free;
    End;
End;

Function TQrInfFiAd.FormaQuery(  sF_Inicio,sF_Final,sAcreditado,
                            sDisposicion,sDetalle,sOrden,
                            sIdCredExt,sIdCtrlExt,
                            sEmpresa, sSucursal, sSitMov, sSitDisp:String):String;
Var
    sSQL:String;
    sCrTransaccionAC      : String;
    sCrTransaccionCA      : String;
    sCrTransaccion        : String;
    sFiltroFO             : String;
Begin

    //BEGIN_ASIGNA FECHA DE ALTA Y CANCELACION PARA REPORTE DE MOVTOS CANCELADOS
    if ( Trim(sF_Inicio)<> '' ) and ( Trim(sF_Final)<> '' ) then
       sFiltroFO := ' AND CT.F_OPERACION BETWEEN ' + SQLFecha(StrToDate(sF_Inicio)) +
                    ' AND ' + SQLFecha(StrToDate(sF_Final ));
    //ends_if
      sCrTransaccionAC := coSELECT_TRANSACCION;

      sCrTransaccionAC := StringReplace( coSELECT_TRANSACCION, '@@AFECTACION@@',
                                        SQLStr('AC'), [ rfReplaceAll, rfIgnoreCase ] );
      sCrTransaccionAC := sCrTransaccionAC +
                        ' WHERE  CVE_OPERACION IN  ' + coCveOperAC + sFiltroFO +
                        ' AND    SIT_TRANSACCION = ''AC'' '+
                        ' AND ID_TRANS_CANCELA IS NULL )' ; //NO TOME TRANSACCIONES CANCELADAAS *HERJA*

      sCrTransaccionCA := StringReplace( coSELECT_TRANSACCION, '@@AFECTACION@@',
                                         SQLStr('CA'), [ rfReplaceAll, rfIgnoreCase ] );
      sCrTransaccionCA := sCrTransaccionCA +
                        '        WHERE (      CT.SIT_TRANSACCION = ''CA'' ' + 
                        '                 AND CT.CVE_OPERACION IN ' + coCveOperAC +  sFiltroFO + ' ) ' +
                        '         OR   (       CT.SIT_TRANSACCION = ''AC'' ' +
                        '         AND CT.CVE_OPERACION IN  ' + coCveOperCA + sFiltroFO + ' )) ';
      sCrTransaccion := '(' + sCrTransaccionAC + ' UNION ' +  sCrTransaccionCA + ')' + coCRLF;

    sSQL:=  ' SELECT ' +
            '   CC.ID_CREDITO, '+
            '   TRA.SIT_AFECTACION, ' +
            '   DECODE (SIT_AFECTACION,''AC'',NVL(CHCA.SDO_VIG_TOTAL,CC.SDO_VIG_TOTAL), ' +
            '                          ''CA'',NVL(CHCA.SDO_VIG_TOTAL,CC.SDO_VIG_TOTAL) + TRA.IMP_NETO) AS SALDO_ANTERIOR, ' + 
            '   TRA.IMP_NETO IMP_FINAN_ADIC                     , ' + 
            '   DECODE (SIT_AFECTACION,''AC'',NVL(CHCA.SDO_VIG_TOTAL,CC.SDO_VIG_TOTAL)+ TRA.IMP_NETO, ' + 
            '                          ''CA'',NVL(CHCA.SDO_VIG_TOTAL,CC.SDO_VIG_TOTAL)) AS SALDO_NUEVO, ' + 
            '   TRA.F_OPERACION FH_ALTA , ' +
            '   TRA.F_VALOR, ' +
            '   CC.ID_CONTRATO, ' +
            '   CC.F_INICIO, ' +
            '   CC.F_VENCIMIENTO F_VTO_CRED, ' +
            '   CC.ID_CRED_EXTERNO, ' +
            '   CC.ID_CONTROL_EXT, ' +
            '   CTO.CVE_MONEDA, ' +
            '   CTO.ID_TITULAR, ' +
            '   CRCTO.CVE_PRODUCTO_CRE, ' +
            '   M.DESC_MONEDA, ' +
            '   CP.DESC_L_PRODUCTO, ' +
            '   P.NOMBRE, ' +
            '   TRA.ID_TRANSACCION, ' +
            '   TRA.ID_PERIODO, ' +
            '   TRA.CVE_USU_ALTA, ' +
            '   TRA.SIT_TRANSACCION, ' +
            '   TRA.CVE_OPERACION, ' +
            '   TRA.FH_CANCELA, ' +
            '   CI.F_VENCIMIENTO F_VTO_INT, ' +
            '   (CI.F_VENCIMIENTO - CI.PLAZO + 1) F_INI_INT, ' +
            '   TRA.CVE_TIPO_MOVTO, ' +
            '   CO.DESC_C_OPERACION CONCEPTO, ' +
            '   TRA.TIPO_CAMBIO, ' +
            '   TRA.ID_TRANS_CANCELA, ' +
            '   TRA.SITUACION, ' +
            //easa4011        17072005
            '   DECODE(TRA.CVE_TIPO_MOVTO,''AN'',TABCTA.CUENTA_VIGENTE_K, '  +
            '                       ''AV'',TABCTA.CUENTA_VIGENTE_K, '  +
            '                       ''MD'',TABCTA.CUENTA_VIGENTE_K, '  +
            '                       ''MV'',TABCTA.CUENTA_VIGENTE_K, '  +
            '                       ''IM'',TABIMPCTA.CUENTA_IMPAGADO_KAP) CUENTA_K, '  +
            '   DECODE(TRA.CVE_TIPO_MOVTO,''AN'',TABCTA.CUENTA_VIGENTE_INT, '  +
            '                       ''AV'',TABCTA.CUENTA_VIGENTE_INT, '  +
            '                       ''MD'',TABCTA.CUENTA_VIGENTE_INT, '  +
            '                       ''MV'',TABCTA.CUENTA_VIGENTE_INT, '  +
            '                       ''IM'',TABIMPCTA.CUENTA_IMPAGADO_INT) CUENTA_I, '  +
            '       (CASE '+
            '         WHEN CI.CVE_FINAN_ADIC = ''DR'' Then ''Directo'' '+
            '         WHEN CI.CVE_FINAN_ADIC = ''PR'' Then ''Prorrateo'' '+
            '        END) CVE_FINAN_ADIC ' +
            ' FROM ' +
            '   (SELECT * FROM CR_CREDITO  WHERE SIT_CREDITO <> ''CA'') CC, ' +
                 sCrTransaccion + ' TRA, ' +
            '   CR_INTERES CI, ' +
            '   CR_HISTO_CRED CHCA, ' +
            '   CR_CONTRATO CRCTO, ' +
            '   CR_PRODUCTO CP, ' +
            '   CONTRATO CTO, ' +
            '   MONEDA M, ' +
            '   PERSONA P, ' +
            '   CR_OPERACION CO, ' +
            C_QUERY_CTAS_IMP +//easa4011        17072005
            C_QUERY_CTAS_VEN+ //easa4011        17072005
            C_QUERY_CTAS +
            ' WHERE TRA.ID_CREDITO = CC.ID_CREDITO ' +
            ' AND   CHCA.ID_CREDITO  (+)= TRA.ID_CREDITO ' +
            ' AND   CHCA.F_CIERRE    (+)= (TRA.F_VALOR - 1) ' +
            ' AND   CI.ID_CREDITO = CC.ID_CREDITO ' +
            ' AND   CI.NUM_PERIODO = TRA.ID_PERIODO ' +
            ' AND   CRCTO.ID_CONTRATO = CC.ID_CONTRATO ' +
            ' AND   CRCTO.FOL_CONTRATO = CC.FOL_CONTRATO ' +
            ' AND   CP.CVE_PRODUCTO_CRE = CRCTO.CVE_PRODUCTO_CRE ' +
            ' AND   CTO.ID_CONTRATO = CC.ID_CONTRATO ' +
            ' AND   M.CVE_MONEDA = CTO.CVE_MONEDA ' +
            ' AND   P.ID_PERSONA = CTO.ID_TITULAR ' +
            ' AND   CO.CVE_OPERACION = TRA.CVE_OPERACION' +
            ' AND   TABIMPCTA.CVE_PRODUCTO_CRE (+)= CP.CVE_PRODUCTO_CRE ' + //easa 17072005
            ' AND   TABVENCTA.CVE_PRODUCTO_CRE (+)= CP.CVE_PRODUCTO_CRE ' + //easa 17072005
            ' AND   TABCTA.CVE_PRODUCTO_CRE    (+)= CP.CVE_PRODUCTO_CRE ' ; //easa4011      29122004


    if ( Trim(sSitMov) <>'') Then
        sSQL:= sSQL + ' AND  TRA.SIT_AFECTACION  ='+ SQLStr(sSitMov);

    if ( Trim(sSitDisp) = 'VI') Then
        sSQL:= sSQL + ' AND  CC.F_TRASPASO_VENC IS NULL '
    else if ( Trim(sSitDisp) = 'VE') Then
        sSQL:= sSQL + ' AND  CC.F_TRASPASO_VENC IS NOT NULL';


    If (Trim(sAcreditado)<>'') Then
        sSQL:= sSQL + ' AND  CTO.ID_TITULAR  ='+ sAcreditado;
    If (Trim(sDisposicion)<>'') Then
        sSQL:= sSQL + ' AND  CC.ID_CREDITO ='+ sDisposicion;
    If (Trim(sIdCredExt)<>'') Then
        sSQL:= sSQL + ' AND  CC.ID_CRED_EXTERNO ='+ sIdCredExt;
    If (Trim(sIdCtrlExt)<>'') Then
        sSQL:= sSQL + ' AND  CC.ID_CONTROL_EXT ='+ sIdCtrlExt;
    If (Trim(sEmpresa)<>'') Then
        sSQL:= sSQL + ' AND  CTO.ID_EMPRESA ='+ Trim(sEmpresa);

    sSQL:= sSQL + ' ORDER BY CVE_MONEDA,DESC_C_PRODUCTO';


    If Trim(sOrden)='C' Then
        sSQL:= sSQL + ' ,ID_CREDITO,ID_TRANSACCION '
    Else
        sSQL:= sSQL + ' ,NOMBRE,ID_CREDITO,ID_TRANSACCION ';

    Result:= sSQL;
End;

procedure TQrInfFiAd.qyInfFinAdicCalcFields(DataSet: TDataSet);
Var
    sFecha:String;
begin
    sFecha:= FormatDateTime('dd/mm/yy hh:mm AM/PM',qyInfFinAdicFH_ALTA.AsDateTime);
end;

procedure TQrInfFiAd.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
     QRDBText8.Visible := qyInfFinAdicFH_CANCELA.AsString <> '';
     QRDBText8.Enabled := qyInfFinAdicFH_CANCELA.AsString <> '';
end;

End.
