// Modificaciones : 23 08 2005
unit IntMQrEdoCtaCert;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls, unSQL2,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, Dialogs, IntGenCre;
Const
   coCRLF       = #13#10;
   sCveGpoComis = 'FOMENT';
type
  TQrEdoCtaCret = class(TQuickRep)
    qyProgEdoCta: TQuery;
    QRGroup2: TQRGroup;
    QRGpoAccesoriio: TQRGroup;
    TitleBand1: TQRBand;
    QRLabel1: TQRLabel;
    qrDatosGral: TQRGroup;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    qrValorTasa: TQRLabel;
    qrEncabezado: TQRMemo;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    qrFecha: TQRLabel;
    QRDBText17: TQRDBText;
    qrTitulo: TQRGroup;
    qrConcepto: TQRGroup;
    QRShape2: TQRShape;
    qrBDetalle: TQRBand;
    qrTitulote: TQRDBText;
    QRDBText25: TQRDBText;
    qrGpoTitulos: TQRGroup;
    qrlPeriodo: TQRLabel;
    qrlFinicio: TQRLabel;
    qrlFvenc: TQRLabel;
    qrlTasa: TQRLabel;
    qrlImporte: TQRLabel;
    qrlIVA: TQRLabel;
    qrlFpago: TQRLabel;
    qrlImpPago: TQRLabel;
    qrdPeriodo: TQRDBText;
    qrFooter: TQRBand;
    QRShape10: TQRShape;
    QRLabel51: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    qrImporte: TQRLabel;
    qrIVA: TQRLabel;
    qrPagado: TQRLabel;
    qrTotImporte: TQRLabel;
    qrTotIVA: TQRLabel;
    qrTotPagado: TQRLabel;
    qrdTasa: TQRLabel;
    qrdFInicio: TQRLabel;
    qrdFVenc: TQRLabel;
    qrdFPago: TQRLabel;
    QRShape5: TQRShape;
    qrTotImpComis: TQRLabel;
    qrTotIvaComis: TQRLabel;
    QRShape6: TQRShape;
    qrTotIvaPagComis: TQRLabel;
    NOMBRE_1: TQRDBText;
    TIPO_1: TQRDBText;
    NOMBRE_2: TQRDBText;
    TIPO_2: TQRDBText;
    TIPO_3: TQRDBText;
    NOMBRE_3: TQRDBText;
    QRGroup5: TQRGroup;
    QRGroup1: TQRGroup;
    QRDBText19: TQRDBText;
    QRLabel29: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel36: TQRLabel;
    qrCapitalInicial_2: TQRLabel;
    qrIntOrd_2: TQRLabel;
    qrAplicaGarLiq_2: TQRLabel;
    qrIntMoratorios_2: TQRLabel;
    qrAdeudoTotal_2: TQRLabel;
    QRShape8: TQRShape;
    qrNumLetra: TQRLabel;
    QRGroup3: TQRGroup;
    QRMemo2: TQRMemo;
    QRGroup4: TQRGroup;
    qrlFecha: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    qrCapitalInicial: TQRLabel;
    qrIntOrdCap: TQRLabel;
    qrIntOrd: TQRLabel;
    qrAplicaGarLiq: TQRLabel;
    qrIntMoratorios: TQRLabel;
    qrPagosCapital: TQRLabel;
    qrAdeudoTotal: TQRLabel;
    QRShape7: TQRShape;
    qrLetra: TQRLabel;
    procedure qrDatosGralBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure TitleBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrGpoTitulosBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrBDetalleBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrTituloBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
   dAmortCPImp,dAmortCPImpPag, dAmortINImp, dGtiaLiq, dTotImpIntOrd, dTotImpPagIntOrd,
   dTotImpCom,dTotImpIVACom,dTotImpComPag,dTotImpIVAComPag,dTotImpIntMor,dTotImpPagIntMor,
   dCPAntImp,dCPAntImpPag,dImpIntOrdAnt,dImpIVAIntOrdAnt,dImpPagIntOrdAnt, dTotalAdeudo,
   dImporteDisp, dTotalIntOrdCap, dTotalIntOrd, dTotalIntMor, dTotalGarLiq, dTotalPagCap, dTotalComis: Double;
   Function ValorTasa(pTasa: String): String;
  public
    Function FormaQuery(sFolioSol, sIdCredito, sIdAcreditado, sIdCreditoFil:String):String;
    Function Num_letras(dNumero: double; sMoneda: string = 'Pesos'): String;
    Function preNumLet(sCantidad: String): String;
  end;

var
  QrEdoCtaCret: TQrEdoCtaCret;
  Apli : TInterApli;

Procedure RepEdoCtaCert(sFolioSol, sIdCredito, sIdAcreditado, sIdCreditoFil:String;
                        pAPli     : TInterApli; pPreview  : Boolean);
Implementation
{$R *.DFM}

function  NvlStr( pStr, pStrNvl : String ) : String;
begin
 if pStr <> '' then
   Result := pStr
  else
   Result := pStrNvl;
end;

Procedure RepEdoCtaCert(sFolioSol, sIdCredito, sIdAcreditado, sIdCreditoFil:String;
                        pAPli     : TInterApli; pPreview  : Boolean);
Var
   QrEdoCtaCret: TQrEdoCtaCret;
   Preview: TIntQRPreview;
Begin
   QrEdoCtaCret:=TQrEdoCtaCret.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QrEdoCtaCret);
   Try
      Apli:= pApli;
      QrEdoCtaCret.qyProgEdoCta.DatabaseName := pApli.DataBaseName;
      QrEdoCtaCret.qyProgEdoCta.SessionName := pApli.SessionName;
      QrEdoCtaCret.qyProgEdoCta.Active:=False;
      QrEdoCtaCret.qyProgEdoCta.SQL.Text:= QrEdoCtaCret.FormaQuery(sFolioSol, sIdCredito, sIdAcreditado, sIdCreditoFil);
      QrEdoCtaCret.qyProgEdoCta.Active:=True;

      If pPreview Then
         QrEdoCtaCret.Preview
      Else
         QrEdoCtaCret.Print;
   Finally
      QrEdoCtaCret.Free;
      If Assigned(Preview) Then Preview.Free;
   End;
End;

procedure TQrEdoCtaCret.QRGroup4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var bPintar:Boolean;
begin
   bPintar:=False;
   qrlFecha.Caption:= FormatDateTime(' "MÉXICO, D.F. A " DD " DE " MMMM " DE " YYYY', Apli.DameFechaEmpresaDia('D000'));
   If qyProgEdoCta.FieldByName('NUM_ORDEN_REP').AsInteger = 10 Then Begin
      bPintar:=True;
   End;
   PrintBand:= bPintar;
end;


Function TQrEdoCtaCret.FormaQuery(sFolioSol, sIdCredito, sIdAcreditado, sIdCreditoFil:String):String;
Var sSQL: String;   slSQL: TStringList;
Begin
   sSQL:='SELECT * FROM '+ coCRLF +
         '      (SELECT DATOS_GRAL.FOL_SOL, DATOS_GRAL.CRED_SOL,DATOS_GRAL.TX_ENCABEZADO,'+ coCRLF +
         '        	   DATOS_GRAL.IMP_CREDITO, DATOS_GRAL.CVE_TASA_REFER,DATOS_GRAL.OPERADOR_STASA,'+ coCRLF +
         '        	   DATOS_GRAL.SOBRETASA, DATOS_GRAL.TASA_CREDITO, DATOS_GRAL.UNIDAD_TIEMPO_RE,'+ coCRLF +
         '              DATOS_GRAL.UNIDAD_TASA,DATOS_GRAL.NUM_UNIDADES_RE, DATOS_GRAL.CVE_TIPO_TASA,'+ coCRLF +
         '              DATOS_GRAL.TIPO_TASA,DATOS_GRAL.CVE_CALCULO, DATOS_GRAL.DESC_CALCULO,'+ coCRLF +
         '              DATOS_GRAL.FACT_MORAS , DATOS_GRAL.F_FIRMA_CONV,DATOS_GRAL.F_INI_CR,'+ coCRLF +
         '              DATOS_GRAL.F_VENC_CR, DATOS_GRAL.IMP_DISPUESTO,DATOS_GRAL.UNIDAD_TIEMPO_CP,'+ coCRLF +
         '              DATOS_GRAL.UNIDAD_CP,DATOS_GRAL.UNIDAD_TIEMPO_IN, DATOS_GRAL.UNIDAD_IN,'+ coCRLF +
         '        	   DET.TITULO, DET.GRUPO, DET.FOLIO_SOLICITUD, DET.ID_CREDITO, DET.NUM_ORDEN_REP,'+ coCRLF +
         '              DET.CONCEPTO,DET.NUM_PERIODO, DET.F_INICIO, DET.F_VENCIMIENTO,DET.IMP_CONCEPTO,'+ coCRLF +
         '        	   DET.F_PROG_PAGO, DET.IMP_PAGADO, DET.TASA_APLICADA, DET.IMP_IVA,'+ coCRLF +
         '              DET.IMP_IVA_PAGADO, DET.CVE_COMISION, DET.TX_DET_CONCEPTO, DET.VALOR,'+ coCRLF +
         '        	   0 AS ORD_TIPO, 0 AS INDICE, NULL AS TIPO, NULL AS ROL,'+ coCRLF +
         '        	   NULL AS NOMBRE_1, NULL AS TX_ADICIONAL_1, NULL AS NOMBRE_2,'+ coCRLF +
         '              NULL AS TX_ADICIONAL_2, 0 AS COMERCIAL '+ coCRLF +
         '          FROM (SELECT SOL.FOLIO_SOLICITUD AS FOL_SOL, SOL.ID_CREDITO AS CRED_SOL,'+ coCRLF +
         '                       SOL.TX_ENCABEZADO, CC.IMP_CREDITO, CC.CVE_TASA_REFER,'+ coCRLF +
         '                       CC.OPERADOR_STASA, CC.SOBRETASA, CC.TASA_CREDITO,'+ coCRLF +
         '                       CC.UNIDAD_TIEMPO_RE, UNIT.DESCRIPCION AS UNIDAD_TASA,'+ coCRLF +
         '                       NVL(CC.NUM_UNIDADES_RE,0) AS NUM_UNIDADES_RE, CC.CVE_TIPO_TASA,'+ coCRLF +
         '                       DECODE( CC.CVE_TIPO_TASA, ''FI'', ''FIJA'',''VA'',''VARIABLE'','' '')AS TIPO_TASA,'+ coCRLF +
         '                       CC.CVE_CALCULO, CALC.DESC_CALCULO, CC.FACT_MORAS , SOL.F_FIRMA_CONV,'+ coCRLF +
         '                       CC.F_INICIO AS F_INI_CR, CC.F_VENCIMIENTO AS F_VENC_CR, CC.IMP_DISPUESTO,'+ coCRLF +
         '                       CC.UNIDAD_TIEMPO_CP, UNCP.DESCRIPCION UNIDAD_CP,'+ coCRLF +
         '                       CC.UNIDAD_TIEMPO_IN, UNIN.DESCRIPCION UNIDAD_IN'+ coCRLF +
         '                  FROM CR_ECC_COM_SOLI SOL, CR_CREDITO CC, CR_UNIDAD_TIEMPO UNIT,'+ coCRLF +
         '                       CR_CALCULO_INT CALC, CR_UNIDAD_TIEMPO UNCP, CR_UNIDAD_TIEMPO UNIN'+ coCRLF +
         '                 WHERE CC.ID_CREDITO = SOL.ID_CREDITO'+ coCRLF;
   If  Trim(sIdCreditoFil) <> '' Then
      sSQL:= sSQL +
         '                   AND SOL.ID_CREDITO ='+ Trim(sIdCreditoFil)+ coCRLF;
   If  Trim(sFolioSol) <> '' Then
      sSQL:= sSQL +
         '                   AND SOL.FOLIO_SOLICITUD ='+ Trim(sFolioSol)+ coCRLF;

   sSQL:= sSQL +
         '                   AND UNIT.CVE_UNIDAD_TIEMP (+)= CC.UNIDAD_TIEMPO_RE'+ coCRLF +
         '                   AND CALC.CVE_CALCULO_INT (+)= CC.CVE_CALCULO'+ coCRLF +
         '                   AND UNCP.CVE_UNIDAD_TIEMP (+)= CC.UNIDAD_TIEMPO_CP'+ coCRLF +
         '                   AND UNIN.CVE_UNIDAD_TIEMP (+)= CC.UNIDAD_TIEMPO_IN'+ coCRLF +
         '               )DATOS_GRAL,'+ coCRLF +
         '               (SELECT DECODE(GRUPO,1,''AMORTIZACIONES PROGRAMADAS'',2,''AMORTIZACIONES ANTICIPADAS'','+ coCRLF +
         '                              3, ''Lo anterior se desprende tomando como base lo siguiente:'')AS TITULO,'+ coCRLF +
         '                       DETALLE.*, CLAVE.VALOR'+ coCRLF +
         '                  FROM (SELECT 1 AS GRUPO, DET.* FROM CR_ECC_COM_DET DET '+
         '                         WHERE NUM_ORDEN_REP IN(1,2,3,4,5,6)'+ coCRLF;

   If  Trim(sFolioSol) <> '' Then
      sSQL:= sSQL + '                   AND FOLIO_SOLICITUD ='+ Trim(sFolioSol)+ coCRLF;
   If  Trim(sIdCreditoFil) <> '' Then
      sSQL:= sSQL + '                   AND ID_CREDITO ='+ Trim(sIdCreditoFil)+ coCRLF;

   sSQL:= sSQL +
         '                         UNION ALL'+ coCRLF +
         '                        SELECT 2 AS GRUPO, DET.* FROM CR_ECC_COM_DET DET '+
         '                         WHERE NUM_ORDEN_REP IN(7,8)'+ coCRLF;

   If  Trim(sFolioSol) <> '' Then
      sSQL:= sSQL + '                   AND FOLIO_SOLICITUD ='+ Trim(sFolioSol)+ coCRLF;
   If  Trim(sIdCreditoFil) <> '' Then
      sSQL:= sSQL + '                   AND ID_CREDITO ='+ Trim(sIdCreditoFil)+ coCRLF;


   sSQL:= sSQL +
         '                         UNION ALL'+ coCRLF +
         '                        SELECT 3 AS GRUPO, DET.* FROM CR_ECC_COM_DET DET '+
         '                         WHERE NUM_ORDEN_REP IN(9)'+ coCRLF;
   If  Trim(sFolioSol) <> '' Then
      sSQL:= sSQL + '                   AND FOLIO_SOLICITUD ='+ Trim(sFolioSol)+ coCRLF;
   If  Trim(sIdCreditoFil) <> '' Then
      sSQL:= sSQL + '                   AND ID_CREDITO ='+ Trim(sIdCreditoFil)+ coCRLF;

   sSQL:= sSQL +
         '                       )DETALLE,(SELECT * FROM  CR_GRUPO_CLAVE WHERE CVE_GRUPO_CLAVE =''CONCEP'')CLAVE'+ coCRLF +
         '                 WHERE CLAVE.CVE_REFERENCIA (+)= DETALLE.CONCEPTO'+ coCRLF +
         '                 ORDER BY GRUPO, NUM_ORDEN_REP,NUM_PERIODO'+ coCRLF +
         '               )DET'+ coCRLF +
         '         WHERE DET.FOLIO_SOLICITUD (+)= DATOS_GRAL.FOL_SOL'+ coCRLF +
         '           AND DET.ID_CREDITO (+)= DATOS_GRAL.CRED_SOL'+ coCRLF +
         '        UNION ALL'+ coCRLF +
         '        SELECT 0 AS FOL_SOL, 0 AS CRED_SOL, NULL AS TX_ENCABEZADO, 0 AS IMP_CREDITO,'+ coCRLF +
         '               NULL AS CVE_TASA_REFER, NULL AS OPERADOR_STASA, 0 AS SOBRETASA, 0 AS TASA_CREDITO,'+ coCRLF +
         '               NULL AS UNIDAD_TIEMPO_RE, NULL AS UNIDAD_TASA,0 AS NUM_UNIDADES_RE, NULL AS CVE_TIPO_TASA,'+ coCRLF +
         '               NULL AS TIPO_TASA, NULL AS CVE_CALCULO, NULL AS DESC_CALCULO, 0 AS FACT_MORAS,'+ coCRLF +
         '               SYSDATE AS F_FIRMA_CONV, SYSDATE AS F_INI_CR, SYSDATE AS F_VENC_CR,'+ coCRLF +
         '               0 AS IMP_DISPUESTO, NULL AS UNIDAD_TIEMPO_CP, NULL AS UNIDAD_CP,'+ coCRLF +
         '               NULL AS UNIDAD_TIEMPO_IN, NULL AS UNIDAD_IN, NULL AS TITULO,'+ coCRLF +
         '               2 AS GRUPO, 0 AS FOLIO_SOLICITUD, 0 AS ID_CREDITO, 10 AS NUM_ORDEN_REP,'+ coCRLF +
         '               NULL AS CONCEPTO, 0 AS NUM_PERIODO, SYSDATE AS F_INICIO, SYSDATE AS F_VENCIMIENTO,'+ coCRLF +
         '               0 AS IMP_CONCEPTO, SYSDATE AS F_PROG_PAGO, 0 AS IMP_PAGADO,0 AS TASA_APLICADA,'+ coCRLF +
         '               0 AS IMP_IVA, 0 AS IMP_IVA_PAGADO, NULL AS CVE_COMISION,NULL AS TX_DET_CONCEPTO,'+ coCRLF +
         '               ''RESUMEN DEL ADEUDO'' AS VALOR,'+ coCRLF +
         '        	   ORD_TIPO, TRUNC((NUM_TIPO+1)/2) INDICE, TIPO,ROL,'+ coCRLF +
         '        	   MAX(DECODE( MOD(Num_Tipo,2) ,0, NULL, NOMBRE)) NOMBRE_1,'+ coCRLF +
         '        	   MAX(DECODE( MOD(Num_Tipo,2) ,0, NULL, TX_ADICIONAL)) TX_ADICIONAL_1,'+ coCRLF +
         '        	   MAX(DECODE( MOD(Num_Tipo,2) ,0, NOMBRE, NULL)) NOMBRE_2,'+ coCRLF +
         '        	   MAX(DECODE( MOD(Num_Tipo,2) ,0, TX_ADICIONAL, NULL)) TX_ADICIONAL_2, '+ coCRLF +
         '              0 AS COMERCIAL '+ coCRLF +
         '          FROM (SELECT 1 ord_tipo, Rownum Num_Tipo, ''APODERADO'' TIPO,'+ coCRLF +
         '                       FIR.CVE_TIPO_ROL AS ROL, P.NOMBRE, FIR.TX_ADICIONAL'+ coCRLF +
         '                  FROM CR_ECC_COM_SOLI SOL, CR_CT_USU_FIRMA FIR, USUARIO USU, PERSONA P'+ coCRLF +
         '                 WHERE SOL.FOLIO_SOLICITUD = '+ sFolioSol +coCRLF +
         '                   AND SOL.CVE_FIRMA  = FIR.CVE_FIRMA'+ coCRLF +
         '                   AND FIR.CVE_USUARIO = USU.CVE_USUARIO'+ coCRLF +
         '                   AND USU.ID_PERSONA = P.ID_PERSONA'+ coCRLF +
         '                   AND FIR.CVE_TIPO_ROL = ''AP'''+ coCRLF +
         '                 UNION ALL'+ coCRLF +
         '                SELECT 3 ord_tipo, Rownum Num_Tipo, ''TESTIGO'' TIPO,'+ coCRLF +
         '                       FIR.CVE_TIPO_ROL AS ROL, P.NOMBRE, FIR.TX_ADICIONAL'+ coCRLF +
         '                  FROM CR_ECC_COM_SOLI SOL, CR_CT_USU_FIRMA FIR, USUARIO USU, PERSONA P'+ coCRLF +
         '                WHERE SOL.FOLIO_SOLICITUD = '+ sFolioSol + coCRLF +
         '                  AND SOL.CVE_FIRMA  = FIR.CVE_FIRMA'+ coCRLF +
         '                  AND FIR.CVE_USUARIO = USU.CVE_USUARIO'+ coCRLF +
         '                  AND USU.ID_PERSONA = P.ID_PERSONA'+ coCRLF +
         '                  AND FIR.CVE_TIPO_ROL = ''TE'''+ coCRLF +
         '               )'+ coCRLF +
         '         GROUP BY ORD_TIPO, TRUNC((NUM_TIPO+1)/2), TIPO,ROL'+ coCRLF +
         '        )'+ coCRLF +
         '         ORDER BY FOL_SOL DESC, CRED_SOL, GRUPO, NUM_ORDEN_REP, NUM_PERIODO,'+ coCRLF +
         '        	   F_INICIO, F_VENCIMIENTO';

   slSQL:= TStringList.Create;
   slSQL.Clear;
   slSQL.Add(sSQL);
   slSQL.SaveToFile('C:\SQL.txt');
   slSQL.Free;
   Result:= sSQL;
End;

procedure TQrEdoCtaCret.qrDatosGralBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var bPintar:Boolean;
begin
   bPintar:=True;
   qrValorTasa.Caption:= '0'; //ValorTasa(qyProgEdoCta.FieldByName('CVE_TASA_REFER').AsString);
   qrFecha.Caption:= FormatDateTime('dd/mm/yyyy',Apli.DameFechaEmpresaDia('D000'));

   If qyProgEdoCta.FieldByName('CRED_SOL').AsInteger = 0 Then
      bPintar:= False
   Else dImporteDisp:=  qyProgEdoCta.FieldByName('IMP_DISPUESTO').AsFloat;
   PrintBand:= bPintar;
end;

function TQrEdoCtaCret.ValorTasa(pTasa: String): String;
var   vlsql : String;
    vlValor : String;
    StpValorTasa: TStoredProc;
begin
   vlValor:='0';
   StpValorTasa := TStoredProc.Create(Nil);
   If Assigned(StpValorTasa) Then
   With StpValorTasa Do
      Try
         StoredProcName := 'PKGCRCREDITOO1.STPCALCTASAREFER';
         DatabaseName := Apli.DataBaseName;
         SessionName := Apli.SessionName;
         Params.Clear;
         Params.CreateParam(ftString,'peCVE_TASA_INDICAD', ptInput);
         Params.CreateParam(ftDate,'peF_CALCULO', ptInput);
         Params.CreateParam(ftFloat,'psVAL_TASA', ptOutput);
         Params.CreateParam(ftFloat,'PSRESULTADO', ptOutput);
         Params.CreateParam(ftString,'PSTX_RESULTADO', ptOutput);

         ParamByName('peCVE_TASA_INDICAD').AsString := pTasa;
         ParamByName('peF_CALCULO').AsDateTime := Apli.DameFechaEmpresaDia('D000');
         ExecProc;

         If (ParamByName('PSRESULTADO').AsFloat = 0) Then
            vlValor:= FormatFloat('###,##0.00%',ParamByName('psVAL_TASA').AsFloat)
         Else showMessage(ParamByName('PSTX_RESULTADO').AsString);
      Finally
         Free;
      End;
   ValorTasa := vlValor;
end;

procedure TQrEdoCtaCret.TitleBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   qrEncabezado.Lines.Text:= qyProgEdoCta.FieldByName('TX_ENCABEZADO').AsString;
   dTotalIntOrdCap:=0;   dTotalIntOrd:=0;   dTotalIntMor:=0;   dTotalGarLiq:=0;   dTotalPagCap:=0;
   dTotalComis:=0;
end;

procedure TQrEdoCtaCret.qrGpoTitulosBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var bPintar:Boolean; dTotAdeudo: Double;
begin
   bPintar:=True;
   qrGpoTitulos.Height:= qrlPeriodo.top + qrlPeriodo.Height;
   qrlPeriodo.Caption:='No.Periodo';
   qrlFinicio.Caption:='Fecha Inicio';
   qrlFvenc.Caption:='Fecha Vencimiento';
   qrlTasa.Caption:='Tasa de Interés';
   qrlImporte.Caption:='Importe';
   qrlIVA.Caption:='Importe IVA';
   qrlFpago.Caption:='Fecha Pago';
   qrlImpPago.Caption:='Importe Pagado';

   qrlPeriodo.Enabled:= True;
   qrlFinicio.Enabled:= True;
   qrlFvenc.Enabled:= True;
   qrlTasa.Enabled:= True;
   qrlImporte.Enabled:= True;
   qrlIVA.Enabled:= True;
   qrlFpago.Enabled:= True;
   qrlImpPago.Enabled:= True;
   qrlImporte.Left:= qrlTasa.Left + qrlTasa.Width + 1;

   If qyProgEdoCta.FieldByName('NUM_ORDEN_REP').AsInteger = 1 Then Begin
      dAmortCPImp:=0;
      dAmortCPImpPag:=0;
      qrlTasa.Enabled:= False;
      qrlIVA.Enabled:= False;
   End Else If qyProgEdoCta.FieldByName('NUM_ORDEN_REP').AsInteger = 2 Then Begin
      dAmortINImp:=0;
      qrlFinicio.Caption:='Periodo del ';
      qrlFvenc.Caption:=' al ';
      qrlTasa.Caption:='Tasa Ordinaria';
      qrlImpPago.Caption:='Importe';
      qrlImporte.Enabled:= False;
      qrlIVA.Enabled:= False;
      qrlFpago.Enabled:= False;
   End Else If qyProgEdoCta.FieldByName('NUM_ORDEN_REP').AsInteger = 3 Then Begin
      dGtiaLiq:=0;
      qrlPeriodo.Enabled:= False;
      qrlFinicio.Enabled:= False;
      qrlTasa.Enabled:= False;
      qrlImporte.Enabled:= False;
      qrlIVA.Enabled:= False;
      qrlFpago.Enabled:= False;
      qrlFvenc.Caption:='Fecha Aplicación';
      qrlImpPago.Caption:='Importe';
   End Else If qyProgEdoCta.FieldByName('NUM_ORDEN_REP').AsInteger = 4 Then Begin
      dTotImpIntOrd:=0; dTotImpPagIntOrd:=0;
   End Else If qyProgEdoCta.FieldByName('NUM_ORDEN_REP').AsInteger = 5 Then Begin
      dTotImpCom:=0;dTotImpIVACom:=0;dTotImpComPag:=0;dTotImpIVAComPag:=0;
      qrlFinicio.Caption:= 'F. Vto';
      qrlFvenc.Caption:='Importe';
      qrlTasa.Caption:='Importe IVA';
      qrlImporte.Caption:='Fecha Pago';
      qrlIVA.Caption:='Importe Pagado';
      qrlFpago.Caption:='Importe IVA Pagado';
      qrlImpPago.Caption:='Tipo de Comisión';
   End Else If qyProgEdoCta.FieldByName('NUM_ORDEN_REP').AsInteger = 6 Then Begin
      dTotImpIntMor:= 0; dTotImpPagIntMor:=0;
   End Else If qyProgEdoCta.FieldByName('NUM_ORDEN_REP').AsInteger = 7 Then Begin
      dCPAntImp:=0; dCPAntImpPag:=0;
      qrlTasa.Enabled:= False;
      qrlIVA.Enabled:= False;
   End Else If qyProgEdoCta.FieldByName('NUM_ORDEN_REP').AsInteger = 8 Then Begin
      dImpIntOrdAnt:=0; dImpIVAIntOrdAnt:=0; dImpPagIntOrdAnt:=0;
   End Else If qyProgEdoCta.FieldByName('NUM_ORDEN_REP').AsInteger = 9 Then Begin
      dTotalAdeudo:=0;
      qrlFinicio.Enabled:= False;
      qrlTasa.Enabled:= False;
      qrlIVA.Enabled:= False;
      qrlFpago.Enabled:= False;
      qrlImporte.Left:= qrlTasa.Left;
      qrlImporte.Width:= qrlTasa.Width + qrlImporte.Width + qrlIVA.Width + qrlFpago.Width;
      qrlImporte.Caption:= 'Detalle de Adeudo Vencido';
      qrlImporte.Alignment:= taCenter;

   End Else If qyProgEdoCta.FieldByName('NUM_ORDEN_REP').AsInteger = 10 Then Begin
      bPintar:=False;
   End;
   PrintBand:= bPintar;
end;

procedure TQrEdoCtaCret.qrBDetalleBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   qrdPeriodo.Enabled:= True;
   qrdFInicio.Enabled:= True;
   qrdFVenc.Enabled:= True;
   qrdTasa.Enabled:= True;
   qrImporte.Enabled:= True;
   qrIVA.Enabled:= True;
   qrdFPago.Enabled:= True;
   qrPagado.Enabled:= True;
   qrdPeriodo.Alignment:= taRightJustify;
   qrdFInicio.Alignment:= taCenter;
   qrdFVenc.Alignment:= taCenter;
   qrdTasa.Alignment:= taRightJustify;
   qrImporte.Alignment:= taRightJustify;
   qrIVA.Alignment:= taRightJustify;
   qrdFPago.Alignment:= taCenter;
   qrPagado.Alignment:= taRightJustify;

   qrdPeriodo.DataField:= 'NUM_PERIODO';
   qrdFInicio.Caption:= FormatDatetime('dd/mm/yyyy',qyProgEdoCta.FieldByName('F_INICIO').AsDateTime);
   qrdFVenc.Caption:= FormatDatetime('dd/mm/yyyy',qyProgEdoCta.FieldByName('F_VENCIMIENTO').AsDateTime);
   qrdTasa.Caption:= FormatFloat('###,##0.00 %',qyProgEdoCta.FieldByName('TASA_APLICADA').AsFloat);
   qrdFPago.Caption:= FormatDatetime('dd/mm/yyyy',qyProgEdoCta.FieldByName('F_PROG_PAGO').AsDateTime);

   NOMBRE_1.Enabled:= False;
   TIPO_1.Enabled:= False;
   NOMBRE_3.Enabled:= False;
   TIPO_3.Enabled:= False;
   NOMBRE_2.Enabled:= False;
   TIPO_2.Enabled:= False;
   qrBDetalle.Height:= qrdFInicio.Height;

   If qyProgEdoCta.FieldByName('NUM_ORDEN_REP').AsInteger = 1 Then Begin
      dAmortCPImp:= dAmortCPImp + qyProgEdoCta.FieldByName('IMP_CONCEPTO').AsFloat;
      dAmortCPImpPag:= dAmortCPImpPag + qyProgEdoCta.FieldByName('IMP_PAGADO').AsFloat;
      qrImporte.Caption:= FormatFloat('###,###,###,###,##0.00',qyProgEdoCta.FieldByName('IMP_CONCEPTO').AsFloat);
      qrPagado.Caption:= FormatFloat('###,###,###,###,##0.00',qyProgEdoCta.FieldByName('IMP_PAGADO').AsFloat);
      qrdTasa.Enabled:= False;
      qrIVA.Enabled:= False;

   End Else If qyProgEdoCta.FieldByName('NUM_ORDEN_REP').AsInteger = 2 Then Begin
      dAmortINImp:= dAmortINImp + qyProgEdoCta.FieldByName('IMP_CONCEPTO').AsFloat;
      qrPagado.Caption:= FormatFloat('###,###,###,###,##0.00',qyProgEdoCta.FieldByName('IMP_CONCEPTO').AsFloat);
      qrImporte.Enabled:= False;
      qrIVA.Enabled:= False;
      qrdFPago.Enabled:= False;
   End Else If qyProgEdoCta.FieldByName('NUM_ORDEN_REP').AsInteger = 3 Then Begin
      qrdPeriodo.Enabled:= False;
      qrdFInicio.Enabled:= False;
      qrdTasa.Enabled:= False;
      qrImporte.Enabled:= False;
      qrIVA.Enabled:= False;
      qrdFPago.Enabled:= False;
      dGtiaLiq:= dGtiaLiq + qyProgEdoCta.FieldByName('IMP_CONCEPTO').AsFloat;
      qrPagado.Caption:= FormatFloat('###,###,###,###,##0.00',qyProgEdoCta.FieldByName('IMP_CONCEPTO').AsFloat);
   End Else If qyProgEdoCta.FieldByName('NUM_ORDEN_REP').AsInteger = 4 Then Begin

      dTotImpIntOrd:= dTotImpIntOrd + qyProgEdoCta.FieldByName('IMP_CONCEPTO').AsFloat;
      dTotImpPagIntOrd:= dTotImpPagIntOrd + qyProgEdoCta.FieldByName('IMP_PAGADO').AsFloat;
      qrImporte.Caption:= FormatFloat('###,###,###,###,##0.00',qyProgEdoCta.FieldByName('IMP_CONCEPTO').AsFloat);
      qrPagado.Caption:= FormatFloat('###,###,###,###,##0.00',qyProgEdoCta.FieldByName('IMP_PAGADO').AsFloat);
      qrIVA.Enabled:= False;
   End Else If qyProgEdoCta.FieldByName('NUM_ORDEN_REP').AsInteger = 5 Then Begin
      dTotImpCom:= dTotImpCom + qyProgEdoCta.FieldByName('IMP_CONCEPTO').AsFloat;
      dTotImpIVACom:= dTotImpIVACom + qyProgEdoCta.FieldByName('IMP_IVA').AsFloat;
      dTotImpComPag:= dTotImpComPag + qyProgEdoCta.FieldByName('IMP_PAGADO').AsFloat;
      dTotImpIVAComPag:= dTotImpIVAComPag + qyProgEdoCta.FieldByName('IMP_IVA_PAGADO').AsFloat;
      qrdFInicio.Caption:=FormatDatetime('dd/mm/yyyy',qyProgEdoCta.FieldByName('F_VENCIMIENTO').AsDateTime);
      qrdFVenc.Caption:=FormatFloat('###,###,###,###,##0.00',qyProgEdoCta.FieldByName('IMP_CONCEPTO').AsFloat);
      qrdTasa.Caption:=FormatFloat('###,###,###,###,##0.00',qyProgEdoCta.FieldByName('IMP_IVA').AsFloat);
      qrImporte.Caption:=FormatDatetime('dd/mm/yyyy',qyProgEdoCta.FieldByName('F_PROG_PAGO').AsDateTime);
      qrIVA.Caption:=FormatFloat('###,###,###,###,##0.00',qyProgEdoCta.FieldByName('IMP_PAGADO').AsFloat);
      qrdFPago.Caption:=FormatFloat('###,###,###,###,##0.00',qyProgEdoCta.FieldByName('IMP_IVA_PAGADO').AsFloat);
      qrPagado.Caption:=qyProgEdoCta.FieldByName('CVE_COMISION').AsString;
      qrdFVenc.Alignment:= taRightJustify;
      qrdTasa.Alignment:= taRightJustify;
      qrImporte.Alignment:= taCenter;
      qrIVA.Alignment:= taRightJustify;
      qrdFPago.Alignment:= taRightJustify;
      qrPagado.Alignment:= taLeftJustify;
   End Else If qyProgEdoCta.FieldByName('NUM_ORDEN_REP').AsInteger = 6 Then Begin
      dTotImpIntMor:= dTotImpIntMor + qyProgEdoCta.FieldByName('IMP_CONCEPTO').AsFloat;
      dTotImpPagIntMor:= dTotImpPagIntMor + qyProgEdoCta.FieldByName('IMP_PAGADO').AsFloat;
      qrImporte.Caption:=FormatFloat('###,###,###,###,##0.00',qyProgEdoCta.FieldByName('IMP_CONCEPTO').AsFloat);
      qrPagado.Caption:=FormatFloat('###,###,###,###,##0.00',qyProgEdoCta.FieldByName('IMP_PAGADO').AsFloat);
   End Else If qyProgEdoCta.FieldByName('NUM_ORDEN_REP').AsInteger = 7 Then Begin
      dCPAntImp:= dCPAntImp + qyProgEdoCta.FieldByName('IMP_CONCEPTO').AsFloat;
      dCPAntImpPag:= dCPAntImpPag + qyProgEdoCta.FieldByName('IMP_PAGADO').AsFloat;
      qrImporte.Caption:=FormatFloat('###,###,###,###,##0.00',qyProgEdoCta.FieldByName('IMP_CONCEPTO').AsFloat);
      qrPagado.Caption:=FormatFloat('###,###,###,###,##0.00',qyProgEdoCta.FieldByName('IMP_PAGADO').AsFloat);
      qrdTasa.Enabled:= False;
      qrIVA.Enabled:= False;
   End Else If qyProgEdoCta.FieldByName('NUM_ORDEN_REP').AsInteger = 8 Then Begin
      dImpIntOrdAnt:= dImpIntOrdAnt + qyProgEdoCta.FieldByName('IMP_CONCEPTO').AsFloat;
      dImpIVAIntOrdAnt:= dImpIVAIntOrdAnt + qyProgEdoCta.FieldByName('IMP_IVA').AsFloat;
      dImpPagIntOrdAnt:= dImpPagIntOrdAnt + qyProgEdoCta.FieldByName('IMP_PAGADO').AsFloat;
      qrImporte.Caption:=FormatFloat('###,###,###,###,##0.00',qyProgEdoCta.FieldByName('IMP_CONCEPTO').AsFloat);
      qrIVA.Caption:=FormatFloat('###,###,###,###,##0.00',qyProgEdoCta.FieldByName('IMP_IVA').AsFloat);
      qrPagado.Caption:=FormatFloat('###,###,###,###,##0.00',qyProgEdoCta.FieldByName('IMP_PAGADO').AsFloat);
   End Else If qyProgEdoCta.FieldByName('NUM_ORDEN_REP').AsInteger = 9 Then Begin
      dTotalAdeudo:= dTotalAdeudo + qyProgEdoCta.FieldByName('IMP_CONCEPTO').AsFloat;
      qrPagado.Caption:= FormatFloat('###,###,###,###,##0.00',qyProgEdoCta.FieldByName('IMP_CONCEPTO').AsFloat);
      qrdFInicio.Enabled:= False;
      qrdTasa.Enabled:= False;
      qrIVA.Enabled:= False;
      qrdFPago.Enabled:= False;
      qrImporte.Left:= qrdTasa.Left;
      qrImporte.Width:= qrdTasa.Width + qrImporte.Width + qrIVA.Width + qrdFPago.Width;
      qrImporte.Alignment:= taLeftJustify;
      qrImporte.Caption:= qyProgEdoCta.FieldByName('TX_DET_CONCEPTO').AsString;
   End Else If qyProgEdoCta.FieldByName('NUM_ORDEN_REP').AsInteger = 10 Then Begin
      qrdPeriodo.Enabled:= False;
      qrdFInicio.Enabled:= False;
      qrdFVenc.Enabled:= False;
      qrdTasa.Enabled:= False;
      qrImporte.Enabled:= False;
      qrIVA.Enabled:= False;
      qrdFPago.Enabled:= False;
      qrPagado.Enabled:= False;
      qrBDetalle.Height:= TIPO_1.Top + TIPO_1.Height + 2;
      If Trim(qyProgEdoCta.FieldByName('NOMBRE_2').AsString) <>'' Then Begin
         NOMBRE_1.Enabled:=True;
         TIPO_1.Enabled:=True;
         NOMBRE_2.Enabled:=True;
         TIPO_2.Enabled:=True;
         TIPO_3.Enabled:=False;
         NOMBRE_3.Enabled:=False;
      End Else Begin
         NOMBRE_1.Enabled:=False;
         TIPO_1.Enabled:=False;
         NOMBRE_2.Enabled:=False;
         TIPO_2.Enabled:=False;
         TIPO_3.Enabled:=True;
         NOMBRE_3.Enabled:=True;
      End;
   End;
end;

procedure TQrEdoCtaCret.qrFooterBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var bPintar: Boolean;
begin
   bPintar:= True;
   qrTotImporte.Enabled:= True;
   qrTotIVA.Enabled:= True;
   qrTotPagado.Enabled:= True;
   QRShape4.Enabled:= True;
   QRShape3.Enabled:= True;
   QRShape10.Enabled:= True;
   qrTotImpComis.Enabled:= False;
   qrTotIvaComis.Enabled:= False;
   QRShape5.Enabled:= False;
   QRShape6.Enabled:= False;
   qrTotIvaPagComis.Enabled:= False;

   If qyProgEdoCta.FieldByName('NUM_ORDEN_REP').AsInteger = 1 Then Begin
      dTotalPagCap:= dAmortCPImpPag;
      qrTotImporte.Caption:= FormatFloat('###,###,###,###,##0.00',dAmortCPImp);
      qrTotPagado.Caption:= FormatFloat('###,###,###,###,##0.00',dAmortCPImpPag);
      QRShape3.Enabled:= False;
      qrTotIVA.Enabled:= False;
   End Else If qyProgEdoCta.FieldByName('NUM_ORDEN_REP').AsInteger = 2 Then Begin
      dTotalIntOrdCap:= dAmortINImp;
      qrTotPagado.Caption:= FormatFloat('###,###,###,###,##0.00',dAmortINImp);
      qrTotImporte.Enabled:= False;
      qrTotIVA.Enabled:= False;
      QRShape4.Enabled:= False;
      QRShape3.Enabled:= False;
   End Else If qyProgEdoCta.FieldByName('NUM_ORDEN_REP').AsInteger = 3 Then Begin
      dTotalGarLiq:= dGtiaLiq;
      qrTotPagado.Caption:= FormatFloat('###,###,###,###,##0.00',dGtiaLiq);
      qrTotImporte.Enabled:= False;
      qrTotIVA.Enabled:= False;
      QRShape4.Enabled:= False;
      QRShape3.Enabled:= False;
   End Else If qyProgEdoCta.FieldByName('NUM_ORDEN_REP').AsInteger = 4 Then Begin
      dTotalIntOrd:= dTotImpIntOrd;
      qrTotImporte.Caption:= FormatFloat('###,###,###,###,##0.00',dTotImpIntOrd);
      qrTotPagado.Caption:= FormatFloat('###,###,###,###,##0.00',dTotImpPagIntOrd);
      qrTotIVA.Enabled:= False;
      QRShape3.Enabled:= False;
   End Else If qyProgEdoCta.FieldByName('NUM_ORDEN_REP').AsInteger = 5 Then Begin
      dTotalComis:= dTotImpCom;
      qrTotImpComis.Enabled:= True;
      qrTotIvaComis.Enabled:= True;
      QRShape5.Enabled:= True;
      QRShape6.Enabled:= True;
      qrTotIvaPagComis.Enabled:= True;
      QRShape4.Enabled:= False;
      qrTotImporte.Enabled:= False;
      QRShape10.Enabled:= False;
      qrTotPagado.Enabled:= False;
      qrTotImpComis.Caption:= FormatFloat('###,###,###,###,##0.00',dTotImpCom);
      qrTotIvaComis.Caption:= FormatFloat('###,###,###,###,##0.00',dTotImpIVACom);
      qrTotIVA.Caption:= FormatFloat('###,###,###,###,##0.00',dTotImpComPag);
      qrTotIvaPagComis.Caption:= FormatFloat('###,###,###,###,##0.00',dTotImpIVAComPag);
   End Else If qyProgEdoCta.FieldByName('NUM_ORDEN_REP').AsInteger = 6 Then Begin
      QRShape5.Enabled:= False;
      qrTotImpComis.Enabled:= False;
      qrTotIvaComis.Enabled:= False;
      QRShape3.Enabled:= False;
      qrTotIVA.Enabled:= False;
      QRShape6.Enabled:= False;
      qrTotIvaPagComis.Enabled:= False;
      dTotalIntMor:= dTotImpIntMor;
      qrTotImporte.Caption:=FormatFloat('###,###,###,###,##0.00',dTotImpIntMor);
      qrTotPagado.Caption:=FormatFloat('###,###,###,###,##0.00',dTotImpPagIntMor);
   End Else If qyProgEdoCta.FieldByName('NUM_ORDEN_REP').AsInteger = 7 Then Begin
      qrTotImporte.Caption:=FormatFloat('###,###,###,###,##0.00',dCPAntImp);
      qrTotPagado.Caption:=FormatFloat('###,###,###,###,##0.00',dCPAntImpPag);
      QRShape5.Enabled:= False;
      qrTotImpComis.Enabled:= False;
      qrTotIvaComis.Enabled:= False;
      qrTotIVA.Enabled:= False;
      QRShape3.Enabled:= False;
      QRShape6.Enabled:= False;
      qrTotIvaPagComis.Enabled:= False;
   End Else If qyProgEdoCta.FieldByName('NUM_ORDEN_REP').AsInteger = 8 Then Begin
      qrTotImporte.Caption:=FormatFloat('###,###,###,###,##0.00',dImpIntOrdAnt);
      qrTotIVA.Caption:=FormatFloat('###,###,###,###,##0.00',dImpIVAIntOrdAnt);
      qrTotPagado.Caption:=FormatFloat('###,###,###,###,##0.00',dImpPagIntOrdAnt);
      QRShape5.Enabled:= False;
      qrTotImpComis.Enabled:= False;
      qrTotIvaComis.Enabled:= False;
      QRShape6.Enabled:= False;
      qrTotIvaPagComis.Enabled:= False;
   End Else If qyProgEdoCta.FieldByName('NUM_ORDEN_REP').AsInteger = 9 Then Begin
      qrTotPagado.Caption:= FormatFloat('###,###,###,###,##0.00',dTotalAdeudo);
      QRShape5.Enabled:= False;
      qrTotImpComis.Enabled:= False;
      qrTotIvaComis.Enabled:= False;
      QRShape4.Enabled:= False;
      qrTotImporte.Enabled:= False;
      QRShape3.Enabled:= False;
      qrTotIVA.Enabled:= False;
      QRShape6.Enabled:= False;
      qrTotIvaPagComis.Enabled:= False;
      qrImporte.Left:= qrdTasa.Left;
      qrImporte.Width:= qrdTasa.Width + qrImporte.Width + qrIVA.Width + qrdFPago.Width;
      qrImporte.Alignment:= taLeftJustify;
      QRLabel51.Caption:='Total de Adeudo Vencido';
   End Else If qyProgEdoCta.FieldByName('NUM_ORDEN_REP').AsInteger = 10 Then Begin
      bPintar:=False;
   End;
   PrintBand:=bPintar;
end;

procedure TQrEdoCtaCret.ChildBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var bPintar: Boolean;
begin
   bPintar:= False;
   If qyProgEdoCta.FieldByName('NUM_ORDEN_REP').AsInteger = 10 Then
      bPintar:= True;
   PrintBand:= bPintar;
end;

procedure TQrEdoCtaCret.qrTituloBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var bPintar:Boolean;
begin
   bPintar:=True;
   If qyProgEdoCta.FieldByName('GRUPO').AsInteger = 3 Then Begin
      qrTitulote.Left:=3;
      qrTitulote.Alignment:= taLeftJustify;
   End;
   PrintBand:= bPintar;
end;

procedure TQrEdoCtaCret.QRGroup3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var bPintar:Boolean;
begin
   bPintar:=False;
   If qyProgEdoCta.FieldByName('NUM_ORDEN_REP').AsInteger = 10 Then Begin
      QRMemo2.Lines.Text:= 'SE EXTIENDE EL PRESENTE ESTADO DE CUENTA CERTIFICADO EN TERMINOS DEL '+
                           'ARTICULO 68 DE LA LEY DE INSTITUCIONES DE CRÉDITO, EN '+
                           IntToStr(Self.QRPrinter.PageCount) + ' HOJAS ÚTILES';
      //lbPaginas.Caption := 'Hoja ' + IntToStr(Self.QRPrinter.PageNumber) + ' de ' + IntToStr(Self.QRPrinter.PageCount);
      bPintar:=True;
   End;
   PrintBand:= bPintar;
end;

procedure TQrEdoCtaCret.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var bPintar:Boolean; dAdeudoTot_2:Double;
begin
   bPintar:=False;
   If qyProgEdoCta.FieldByName('NUM_ORDEN_REP').AsInteger = 10 Then Begin
      qrCapitalInicial_2.Caption:=FormatFloat('###,###,###,###,##0.00',dImporteDisp);
      qrIntOrd_2.Caption:=FormatFloat('###,###,###,###,##0.00',dTotalIntOrd);
      qrIntMoratorios_2.Caption:=FormatFloat('###,###,###,###,##0.00',dTotalIntMor);
      qrAplicaGarLiq_2.Caption:=FormatFloat('###,###,###,###,##0.00',dTotalComis);
      dAdeudoTot_2:= dImporteDisp + dTotalIntOrdCap + dTotalIntMor + dTotalComis;
      qrAdeudoTotal_2.Caption:=FormatFloat('###,###,###,###,##0.00',dAdeudoTot_2);

      qrNumLetra.Caption:='('+ Self.Num_letras(dAdeudoTot_2) +')';

      If qyProgEdoCta.FieldByName('COMERCIAL').AsInteger = 1 Then
         bPintar:=True
      Else bPintar:=False;
   End;
   PrintBand:= bPintar;
end;

Function TQrEdoCtaCret.Num_letras(dNumero: double; sMoneda: string = 'Pesos'): String;
Var
   sNumAlfa: String;
   sEnteros, sCuPaso, scaPaso, scaPaso1, sDe: String;
   iDesplaza: integer;
   dCent, dCnPaso: double;
Begin
   If (dNumero > 999999999999.99) then begin
      ShowMessage('El número no debe ser mayor a 999,999,999,999.99');
      Exit;
   end;
   sNumAlfa := FormatFloat('000000000000.00', dNumero);
   dCent := StrToFloat(copy(sNumAlfa,14,2));
   sEnteros := '';
   sDe := '';
   for iDesplaza := 1 to 4 do
   begin
      sCuPaso := copy(sNumAlfa, (3*iDesplaza)-2,3);
      dCnPaso := StrToFloat(sCuPaso);
      if (dCnPaso>0) or (senteros<>'') then begin
         scaPaso := Trim(preNumLet(sCuPaso));
         scaPaso1 := '';
         case iDesplaza of
            1,3: begin
               if (dCnPaso>0) then begin
                  scaPaso1:= 'Mil ';
                  sDe:= '';
               end;
            end;
            2: begin
               if (dCnPaso=1) and (sEnteros='') then scaPaso1 := 'Millón '
               else scaPaso1 := 'Millones ';
               sDe := 'de ';
            end;
            4: if (dCnPaso>0) then sDe := '';
         end;
         scaPaso := scaPaso + ' ' + scaPaso1;
         sEnteros := sEnteros + scaPaso;
      end;
   end;
   sEnteros := sEnteros+sDe;

   Result := sEnteros + sMoneda +' ' + copy(sNumAlfa,14,2)+'/100 M.N.';
End;

Function TQrEdoCtaCret.preNumLet(sCantidad: String): String;
Var
   asUni, asDec, asCen: Array[1..9] of String;
   asEsp: Array[1..19] of String;
   iCant1, iCant2, iUnidades: Integer;
   sCuerda : String;
Begin
   asUni[1]  := 'Un';
   asUni[2]  := 'Dos';
   asUni[3]  := 'Tres';
   asUni[4]  := 'Cuatro';
   asUni[5]  := 'Cinco';
   asUni[6]  := 'Seis';
   asUni[7]  := 'Siete';
   asUni[8]  := 'Ocho';
   asUni[9]  := 'Nueve';
   asDec[1]  := 'Diez';
   asDec[2]  := 'Veinte';
   asDec[3]  := 'Treinta';
   asDec[4]  := 'Cuarenta';
   asDec[5]  := 'Cincuenta';
   asDec[6]  := 'Sesenta';
   asDec[7]  := 'Setenta';
   asDec[8]  := 'Ochenta';
   asDec[9]  := 'Noventa';
   asCen[1]  := 'Ciento';
   asCen[2]  := 'Doscientos';
   asCen[3]  := 'Trescientos';
   asCen[4]  := 'Cuatrocientos';
   asCen[5]  := 'Quinientos';
   asCen[6]  := 'Seiscientos';
   asCen[7]  := 'Setecientos';
   asCen[8]  := 'Ochocientos';
   asCen[9]  := 'Novecientos';
   asEsp[1]  := 'Once';
   asEsp[2]  := 'Doce';
   asEsp[3]  := 'Trece';
   asEsp[4]  := 'Catorce';
   asEsp[5]  := 'Quince';
   asEsp[6]  := 'Dieciseis';
   asEsp[7]  := 'Diecisiete';
   asEsp[8]  := 'Dieciocho';
   asEsp[9]  := 'Diecinueve';
   asEsp[10] := 'Veinte';
   asEsp[11] := 'Veintiun';
   asEsp[12] := 'Veintidos';
   asEsp[13] := 'Veintitres';
   asEsp[14] := 'Veinticuatro';
   asEsp[15] := 'Veinticinco';
   asEsp[16] := 'Veintiseis';
   asEsp[17] := 'Veintisiete';
   asEsp[18] := 'Veintiocho';
   asEsp[19] := 'Veintinueve';
   if sCantidad='' Then begin
      Result := '';
      Exit;
   end;
   sCuerda:= '';
   iCant1 := StrToInt(copy(sCantidad,1,1));
   iCant2 := StrToInt(copy(sCantidad,2,2));
   if (iCant2>10) and (iCant2<30) then begin
      sCuerda:= asEsp[iCant2-10];
   end
   else begin
      if iCant2<10 then sCuerda := ''
      else sCuerda:= asDec[Trunc(iCant2/10)];
      iUnidades := iCant2 mod 10;
      if iUnidades>0 then begin
         if sCuerda = '' then sCuerda:= asUni[iUnidades]
         else sCuerda:= sCuerda + ' y ' + asUni[iUnidades];
      end;
   end;
   if iCant1>0 then begin
       if (sCuerda='') and (iCant1 = 1) then sCuerda := 'cien'
       else sCuerda:= asCen[iCant1] + ' ' + sCuerda;
   end;
   Result := sCuerda;
End;

procedure TQrEdoCtaCret.QRGroup5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var bPintar:Boolean; dTotAdeudo: Double;
begin
   bPintar:=False;
   If qyProgEdoCta.FieldByName('NUM_ORDEN_REP').AsInteger = 10 Then Begin
      qrCapitalInicial.Caption:= FormatFloat('###,###,###,###,##0.00',dImporteDisp);
      qrIntOrdCap.Caption:= FormatFloat('###,###,###,###,##0.00',dTotalIntOrdCap);
      qrIntOrd.Caption:= FormatFloat('###,###,###,###,##0.00',dTotalIntOrd);
      qrIntMoratorios.Caption:= FormatFloat('###,###,###,###,##0.00',dTotalIntMor);
      qrAplicaGarLiq.Caption:= FormatFloat('###,###,###,###,##0.00',dTotalGarLiq);
      qrPagosCapital.Caption:= FormatFloat('###,###,###,###,##0.00',dTotalPagCap);
      dTotAdeudo:= dImporteDisp + dTotalIntOrdCap + dTotalIntOrd + dTotalIntMor - dTotalGarLiq - dTotalPagCap;
      qrAdeudoTotal.Caption:= FormatFloat('###,###,###,###,##0.00',dTotAdeudo);
      qrLetra.Caption:='('+ Self.Num_letras(dTotAdeudo) +' )';

      If qyProgEdoCta.FieldByName('COMERCIAL').AsInteger = 0 Then
         bPintar:=True
      Else bPintar:=False;
   End;
   PrintBand:= bPintar;
end;

End.
