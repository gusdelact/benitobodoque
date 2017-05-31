Unit IntQrEdoMovto;

Interface

Uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, IntGenCre,UnSQL2, QRExport, U_InterCustomStar,
  U_InterDigDoc, IntBlqCtos;
Type
  TQrEdoMovto = Class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    qyEdoMovto: TQuery;
    QRSHPTCredito: TQRShape;
    QRLabel9: TQRLabel;
    QRBand1: TQRBand;
    QRSHPTChequera: TQRShape;
    QRLabel13: TQRLabel;
    QRDBText12: TQRDBText;
    QRBand2: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    QRGroupContador: TQRGroup;
    qrACREDITADO: TQRGroup;
    QRSHPOrigen: TQRShape;
    QRShape2: TQRShape;
    QRLabel44: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText32: TQRDBText;
    QRShape4: TQRShape;
    QRShape8: TQRShape;
    QRLabel8: TQRLabel;
    QRShape9: TQRShape;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRLabel1: TQRLabel;
    QRShape10: TQRShape;
    QRLabel11: TQRLabel;
    QRShape11: TQRShape;
    QRLabel12: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText4: TQRDBText;
    qyEdoMovtoID_CREDITO: TFloatField;
    qyEdoMovtoTX_NOTA: TStringField;
    QRShape15: TQRShape;
    QRLabel18: TQRLabel;
    qyEdoMovtoID_PERSONA: TFloatField;
    qyEdoMovtoNOMBRE: TStringField;
    QRLabel10: TQRLabel;
    QRShape16: TQRShape;
    QRLabel20: TQRLabel;
    QRShape17: TQRShape;
    QRLabel21: TQRLabel;
    QRLabel4: TQRLabel;
    QRShape18: TQRShape;
    QRLabel22: TQRLabel;
    QRShape19: TQRShape;
    QRLabel24: TQRLabel;
    QRShape20: TQRShape;
    QRLabel25: TQRLabel;
    QRShape21: TQRShape;
    QRLabel26: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape7: TQRShape;
    QRLabel15: TQRLabel;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    qyEdoMovtoF_OPERACION: TDateTimeField;
    qyEdoMovtoID_PERIODO: TFloatField;
    qyEdoMovtoF_INICIO: TDateTimeField;
    qyEdoMovtoF_VENCIMIENTO: TDateTimeField;
    qyEdoMovtoF_PROG_PAGO: TDateTimeField;
    QRDBText6: TQRDBText;
    qyEdoMovtoF_PAGO: TDateTimeField;
    qyEdoMovtoDIAS_VDOS: TFloatField;
    qyEdoMovtoIMP_CAPITAL: TFloatField;
    qyEdoMovtoTASA_APLICADA: TFloatField;
    qyEdoMovtoIMP_INTERES: TFloatField;
    qyEdoMovtoIVAINT: TFloatField;
    QRDBText7: TQRDBText;
    qyEdoMovtoIMP_MOR: TFloatField;
    qyEdoMovtoMOR_IVA: TFloatField;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText1: TQRDBText;
    qyEdoMovtoPAGOCP: TFloatField;
    qyEdoMovtoPAGOMOR: TFloatField;
    qyEdoMovtoPAGIVAMOR: TFloatField;
    qyEdoMovtoPAGOCN: TFloatField;
    qyEdoMovtoPAGIVAIN: TFloatField;
    qyEdoMovtoPAGOIN: TFloatField;
    qrfCREDITO: TQRBand;
    qrlESDO_INSOLUTO: TQRLabel;
    qrlSDO_INSOLUTO: TQRLabel;
    qyEdoMovtoDESC_MONEDA: TStringField;
    qyEdoMovtoCVE_MONEDA: TFloatField;
    QRGroup2: TQRGroup;
    QRShape24: TQRShape;
    QRLabel29: TQRLabel;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRGroup1: TQRGroup;
    qyEdoMovtoDIAS_DEV: TFloatField;
    QRShape25: TQRShape;
    QRLabel17: TQRLabel;
    QRShape26: TQRShape;
    QRLabel19: TQRLabel;
    qyEdoMovtoFINADIC: TFloatField;
    qyEdoMovtoPAGOFN: TFloatField;
    QRDBText3: TQRDBText;
    QRDBText20: TQRDBText;
    qrlESDO_VDO: TQRLabel;
    qrlSDO_VENCIDO: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrfCREDITOBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);

  Private
  Public
    Function FormaQuery(peApli : TInterApli; sFIni, sFFin, sAcreditado, sDisp, sPromAsoc, sPromAdm, sGpoEconomico,
                        sProducto, sGpoProd, sNbrArch, sEmpresa, sSucursal: String; sDiasImp : Boolean ): String;
  end;
Var
  QrEdoMovto: TQrEdoMovto;
  Apli : TInterApli;
  sArchivo:String;
  bGenArch: Boolean;
  F: TextFile;
  sF_INI, sF_FIN : String;

Procedure RepEdoMovto(  sFIni, sFFin, sAcreditado, sDisp, sPromAsoc, sPromAdm, sGpoEconomico,
                        sProducto, sGpoProd, sEmpresa, sSucursal, sNbrArch : String; sDiasImp : Boolean;
                        pAPli : TInterApli; pPreview : Boolean
                      );
Implementation
{$R *.DFM}

Procedure RepEdoMovto( sFIni, sFFin, sAcreditado, sDisp, sPromAsoc, sPromAdm, sGpoEconomico,
                        sProducto, sGpoProd, sEmpresa, sSucursal, sNbrArch : String; sDiasImp : Boolean;
                        pAPli : TInterApli; pPreview : Boolean
                      );
Var
   QrEdoMovto: TQrEdoMovto;
   Preview     : TIntQRPreview;
   sFileName   : String;

Begin
   QrEdoMovto:=TQrEdoMovto.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QrEdoMovto);
   Try
      bGenArch:= False;
      Apli := pApli;
      sArchivo:= sNbrArch;
      QrEdoMovto.QRInterEncabezado1.Apli:=pApli;
      QrEdoMovto.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
      QrEdoMovto.QRInterEncabezado1.NomReporte:='IntMQrEdoMovto';
      QrEdoMovto.QRInterEncabezado1.Titulo1:='Reporte Estado de Movimientos';
      QrEdoMovto.QRInterEncabezado1.Titulo2:=' Del ' + sFIni +' al ' + sFFin;

      QrEdoMovto.qyEdoMovto.DatabaseName := pApli.DataBaseName;
      QrEdoMovto.qyEdoMovto.SessionName := pApli.SessionName;

      QrEdoMovto.qyEdoMovto.Active:=False;
      QrEdoMovto.qyEdoMovto.SQL.Text:= QrEdoMovto.FormaQuery(pApli, sFIni, sFFin, sAcreditado, sDisp, sPromAsoc, sPromAdm, sGpoEconomico,
                        sProducto, sGpoProd, sNbrArch, sEmpresa, sSucursal, sDiasImp);
      QrEdoMovto.qyEdoMovto.SQL.SaveToFile('c:\EdoMovto.txt');
      QrEdoMovto.qyEdoMovto.Active:=True;

      sF_INI := sFIni;
      sF_FIN := sFFin;

      If Trim(sArchivo)<>'' Then Begin
         AssignFile(F, sArchivo);
         Rewrite(F);
         Writeln(F, QrEdoMovto.QRInterEncabezado1.Titulo1 + #09 );
         Writeln(F, QrEdoMovto.QRInterEncabezado1.Titulo2+ #09 );
         Writeln(F,  #09 );
         Writeln(F, #09#09#09#09#09#09#09#09#09#09#09 + 'CAPITAL'+ #09# +'INTERESES ORDINARIOS'+ #09#09 +
                  'Moratorios' + #09#09 + 'Pagos');
         Writeln(F,
             'Cve. Moneda'+ #09 +
             'Desc. Moneda'+ #09 +
             'Num. Acreditado'+ #09 +
             'Acreditado'+ #09 +
             'F. Operación' +#09 +
             'Concepto'+ #09 +
             'Crédito'+ #09 +
             'Periodo'+#09 +
             'Fecha de Inicio' +#09 +
             'Fecha de Vencimiento' +#09 +
             'Fecha Programada de Pago' +  #09 +
             'Fecha de Pago' +  #09 +
             'Días en Impagado'+ #09 +
             'Importe'+ #09 +
             'Tasa Ordinaria'+ #09 +
             'Días Reales Devengados'+ #09 +
             'Int. REfinanciados'+ #09 +
             'Importe Int. Ordinarios'+ #09 +
             'IVA de Int. Ordinarios'+ #09 +
             'Importe'+ #09 +
             'IVA de Moratorios'+ #09 +
             'Capital'+ #09 +
             'Int. Refinanciados'+ #09 +
             'Intereses Ordinarios'+ #09 +
             'IVA de Intereses'+ #09 +
             'Moratorios' +  #09+
             'IVA de Moratorios'+ #09 +
             'Conceptos');
      End;

      If pPreview Then
         QrEdoMovto.Preview
      Else
         QrEdoMovto.Print;
   Finally
      If Trim(sArchivo)<>'' Then Begin
         bGenArch:= True;
         CloseFile(F);
      End;
      QrEdoMovto.free;
      If Assigned(Preview) Then Preview.Free;
   End;
End;

Function TQrEdoMovto.FormaQuery(peApli : TInterApli; sFIni, sFFin, sAcreditado, sDisp, sPromAsoc, sPromAdm, sGpoEconomico,
                               sProducto, sGpoProd, sNbrArch, sEmpresa, sSucursal: String; sDiasImp : Boolean): String;
Var
    sSQL, sSQLICRE, sSQLINTER :String;
Begin
    //INTERCREDITOS
    sSQLINTER:='  --INTERCREDITOS ' +coCRLF +
               '        SELECT /*+ CHOOSE */P.ID_PERSONA, P.NOMBRE, CTO.CVE_MONEDA, M.DESC_MONEDA, ' +coCRLF +
               '               CT.* ' +coCRLF +
               '        FROM ( ' +coCRLF +
               '                SELECT  /*+ CHOOSE */0 ORD, CI.F_VENCIMIENTO F_OPERACION, ' +coCRLF +
               '                        ''CARGO INTS. PROGRAMADOS'' TX_NOTA, CR.ID_CREDITO, CI.NUM_PERIODO, ' +coCRLF +
               '                	NVL(CI.F_VENCIMIENTO - CI.PLAZO, CR.F_INICIO) F_INICIO, CI.F_VENCIMIENTO, CI.F_PROG_PAGO, CI.F_PAGO, ' +coCRLF +
               '                        NVL(CI1.NUM_DIAS_VENCIDO,0) DIAS_VDOS , CPD.DIAS_DEV,  0 IMP_CAPITAL, ' +coCRLF +
               '                        CI.TASA_APLICADA TASA_APLICADA, 0 FINADIC, CI.IMP_INTERES_PROY IMP_INTERES, CI.IMP_IVA_PROYEC IVAINT, ' +coCRLF +
               '                	0 IMP_MOR,      0 MOR_IVA,      0 PAGOIN,       0 PAGIVAIN, ' +coCRLF +
               '                	0 PAGOCP,       0 PGOFN, 0 PAGOMOR,      0 PAGIVAMOR,    0 PAGOCN ' +coCRLF +
               '                FROM  CRE_INTERES CI, ' +coCRLF +
               '                      ( SELECT /*+ CHOOSE */ID_CREDITO, F_VALOR_CRED F_INICIO FROM CRE_CREDITO WHERE SIT_CREDITO NOT IN(''CA'', ''TA'') ';
                 If (Trim(sDisp)<> '')Then sSQLINTER := sSQLINTER + ' AND ID_CREDITO = '+ sDisp ;
    sSQLINTER:= sSQLINTER +
               '                      ) CR, ' +coCRLF +
               '                      ( SELECT /*+ CHOOSE */ID_CREDITO, NUM_PERIODO, F_PAGO - F_PROG_PAGO  NUM_DIAS_VENCIDO ' +coCRLF +
               '                        FROM CRE_INTERES ' +coCRLF +
               '                        WHERE F_PAGO > F_PROG_PAGO ';
                 If (Trim(sDisp)<> '')Then sSQLINTER := sSQLINTER + ' AND ID_CREDITO = '+ sDisp ;
    sSQLINTER:= sSQLINTER +
               '                      )CI1, ' +coCRLF +
               '                      ( SELECT /*+ CHOOSE */* FROM CR_OPERACION WHERE CVE_ACCESORIO = ''CN'' AND CVE_AFEC_SALDO <> ''N'')CO, ' +coCRLF +
               '                      ( SELECT /*+ CHOOSE */ID_CREDITO, NUM_PERIODO, COUNT(*) DIAS_DEV FROM CRE_PROV_DIARIA' + coCRLF +
               '                        WHERE 1 = 1  ';
                 If (Trim(sDisp)<> '')Then sSQLINTER := sSQLINTER + ' AND ID_CREDITO = '+ sDisp ;
    sSQLINTER:= sSQLINTER +
               ' GROUP BY ID_CREDITO, NUM_PERIODO ' +coCRLF +
               '                      ) CPD'+
               '                WHERE CI.F_PROG_PAGO >= ' + SQLFecha(StrToDateTime(sFIni))+coCRLF +
               '                  AND CI.F_PROG_PAGO <= ' + SQLFecha(StrToDateTime(sFFin))+coCRLF +
               '                  AND CR.ID_CREDITO  = CI.ID_CREDITO AND CI.ID_CREDITO  = CI1.ID_CREDITO(+) AND CI.NUM_PERIODO = CI1.NUM_PERIODO(+) ' +coCRLF +
               '                  AND CI.IMP_INTERES_PROY <> 0 ' +coCRLF +
               '                  AND CI.ID_CREDITO  = CPD.ID_CREDITO(+) AND CI.NUM_PERIODO   = CPD.NUM_PERIODO ' +coCRLF;
                 If (Trim(sDisp)<> '')Then sSQLINTER := sSQLINTER +
               '                  AND CI.ID_CREDITO = '+ sDisp ;
    sSQLINTER:= sSQLINTER +

               '                UNION ' +coCRLF +
               '               --CAPITAL ' +coCRLF +
               '                SELECT  /*+ CHOOSE */1 ORD, CT.F_PROCESO F_OPERACION,          CO.DESC_L_ID_PRIM TX_NOTA, CR.ID_CREDITO, ' +coCRLF +
               '                        NVL(CT.NUM_PERIODO,0) NUM_PERIODO, CP.F_INICIO, CP.F_VENCIMIENTO, CP.F_PROG_PAGO, CP.F_PAGO, CP.DIAS_VDOS, ' +coCRLF +
               '                	0 DIAS_DEV,  DECODE( CT.CVE_OPERACION, ''CAUTDI'', CT.IMP_OPERACION, 0) IMP_CAPITAL, ' +coCRLF +
               '                        CT.TASA_APLICACION TASA_APLICADA, 0 FINADIC, ' +coCRLF +
               '                        0 IMP_INTERES,   0 IVAINT, CP.IMP_MORA IMP_MOR, ' +coCRLF +
               '                	DECODE( CT.CVE_OPERACION, ''CIVMOD'',CT.IMP_OPERACION, 0) MOR_IVA, ' +coCRLF +
               '                	0 PAGOIN,       0 PAGIVAIN, ' +coCRLF +
               '                	DECODE( CT.CVE_OPERACION, ''CAMCAP'', CT.IMP_OPERACION, ''CAMDES'', CT.IMP_OPERACION, ' +coCRLF +
               '        				          ''CAMCAF'', CT.IMP_OPERACION, ''AMIM'',   CT.IMP_OPERACION, ' +coCRLF +
               '         					  ''ANTI'',   CT.IMP_OPERACION, ''CEBENC'', CT.IMP_OPERACION, ' +coCRLF +
               '        					  ''CEBERT'', CT.IMP_OPERACION, ''CECCAP'', CT.IMP_OPERACION, ' +coCRLF +
               '        					  ''CPAMIM'', CT.IMP_OPERACION, ''CPCAPP'', CT.IMP_OPERACION, ' +coCRLF +
               '                                                  ''CAUTRE'', CT.IMP_OPERACION, ''CPCAPV'', CT.IMP_OPERACION, 0 ) PAGOCP, 0 PGOFN, ' +coCRLF +
               '                	DECODE( CT.CVE_OPERACION, ''CMORAC'', CT.IMP_OPERACION, 0) PAGOMOR, ' +coCRLF +
               '                	DECODE( CT.CVE_OPERACION, ''CIVMOC'', CT.IMP_OPERACION, 0) PAGIVAMOR, ' +coCRLF +
               '                	0 PAGOCN ' +coCRLF +
               '                FROM CRE_TRANSACCION  CT, CRE_OPERACION CO, CRE_CREDITO CR, CRE_CONTRATO CC, CONTRATO CTO,' +coCRLF +
               '                     ( SELECT /*+ CHOOSE */K.* ' +coCRLF +
               '                       FROM ( SELECT /*+ CHOOSE */CP.ID_CREDITO,  CP.F_VENCIMIENTO - CP.PLAZO F_INICIO, CP.NUM_PERIODO, ' +coCRLF +
               '                                     CP.F_VENCIMIENTO, CP.F_PROG_PAGO,  CP.F_PAGO, NVL( CP1.NUM_DIAS_VENCIDO,0) DIAS_VDOS, CP.IMP_CAPITAL IMPORTE, CP.IMP_MORA ' +coCRLF +
               '                              FROM CRE_CAPITAL CP, ' +coCRLF +
               '                                   ( SELECT /*+ CHOOSE */ID_CREDITO, NUM_PERIODO, F_PAGO - F_PROG_PAGO  NUM_DIAS_VENCIDO ' +coCRLF +
               '                                     FROM CRE_CAPITAL WHERE F_PAGO > F_PROG_PAGO ';
                 If (Trim(sDisp)<> '')Then sSQLINTER := sSQLINTER + ' AND ID_CREDITO = '+ sDisp ;
    sSQLINTER:= sSQLINTER +
               '                                   )CP1 ' +coCRLF +
               '                              WHERE CP.F_PROG_PAGO >= ' + SQLFecha(StrToDateTime(sFIni))+coCRLF +
               '                                AND CP.F_PROG_PAGO <= ' + SQLFecha(StrToDateTime(sFFin))+coCRLF +
               '                                AND CP.ID_CREDITO   = CP1.ID_CREDITO(+) AND CP.NUM_PERIODO  = CP1.NUM_PERIODO(+) ' +coCRLF;
                 If (Trim(sDisp)<> '')Then sSQLINTER := sSQLINTER +
               '                                AND CP.ID_CREDITO = '+ sDisp ;
    sSQLINTER:= sSQLINTER +

               '                            )K ' +coCRLF +
               '                       ORDER BY K.ID_CREDITO ' +coCRLF +
               '                     )CP ' +coCRLF +
               '                WHERE CT.F_PROCESO  >= ' + SQLFecha(StrToDateTime(sFIni))+coCRLF +
               '                  AND CT.F_PROCESO  <= ' + SQLFecha(StrToDateTime(sFFin))+coCRLF +
               '                  AND CR.ID_CREDITO      = CT.ID_CREDITO  AND CT.CVE_OPERACION   = CO.CVE_OPERACION ' +coCRLF +
               '                  AND CC.ID_CONTRATO     = CR.ID_CONTRATO AND CT.SIT_TRANSACCION = ''AC'' ' +coCRLF +
               '                  AND CT.CVE_OPERACION  IN (''CAMCAP'',''CAMDES'',''CAMCAF'',''AMIM'',''ANTI'',''CEBENC'',''CEBERT'', ' +coCRLF +
               '        				    ''CECCAP'',''CPAMIM'',''CPCAPP'',''CAUTRE'',''CPCAPV'', ''CAUTDI'',''CIVMOD'',''CMORAC'',''CIVMOC'') ' +coCRLF +
               '                  AND CT.ID_CREDITO      = CP.ID_CREDITO AND CT.NUM_PERIODO     = CP.NUM_PERIODO ' +
               '                  AND CT.ID_CONTRATO   = CTO.ID_CONTRATO '+coCRLF +
//CNBV 13112008               ObtenSQLAplicaFiltroCto( peApli, 'CLASE_TMEDOMOVTO', '                  AND CTO.ID_CONTRATO ', False ) { < SATV4766 04/09/2006> }
               ObtenSQLAplicaFiltroCred( peApli, 'CLASE_TMEDOMOVTO', '                  AND CR.ID_CREDITO ', False ) { < SATV4766 04/09/2006> }
               ; 
               If (Trim(sDisp)<> '')Then sSQLINTER := sSQLINTER + ' AND CT.ID_CREDITO = '+ sDisp ;
               If (Trim(sAcreditado)<>  '')Then sSQLINTER := sSQLINTER + ' AND CTO.ID_TITULAR = '+ sAcreditado ;
    sSQLINTER:= sSQLINTER +
               '                UNION ' +coCRLF +
               '                --INTERESES ' +coCRLF +
               '                SELECT  /*+ CHOOSE */1 ORD, CT.F_PROCESO F_OPERACION, CO.DESC_L_ID_PRIM TX_NOTA, CR.ID_CREDITO, ' +coCRLF +
               '                        NVL(CT.NUM_PERIODO,0) NUM_PERIODO, NVL(CI.F_VENCIMIENTO - CI.PLAZO, CR.F_VALOR_CRED ) F_INICIO, ' +coCRLF +
               '                        CI.F_VENCIMIENTO, CI.F_PROG_PAGO, CI.F_PAGO, CI1.NUM_DIAS_VENCIDO DIAS_VDOS, CPD.DIAS_DEV,  0 IMP_CAPITAL, ' +coCRLF +
               '                        CT.TASA_APLICACION TASA_APLICADA, ' +coCRLF +
               '                        DECODE( CT.CVE_OPERACION, ''REFI'',CT.IMP_OPERACION, 0 ) FINADIC, 0 IMP_INTERES, ' +coCRLF +
               '                        DECODE( CT.CVE_OPERACION, ''CPIVPR'',CT.IMP_OPERACION,0) IVAINT, ' +coCRLF +
               '                	0 IMP_MOR,      0 MOR_IVA, ' +coCRLF +
               '                	DECODE( CT.CVE_OPERACION, ''CPINTP'', CT.IMP_OPERACION, ' +coCRLF +
               '                				  ''CERONE'', CT.IMP_OPERACION,''CBENFI'', CT.IMP_OPERACION,''CEDBCO'', CT.IMP_OPERACION, ' +coCRLF +
               '                				  ''CEBENE'', CT.IMP_OPERACION,''CAMINT'', CT.IMP_OPERACION,''CPINTV'',CT.IMP_OPERACION,0 ) PAGOIN, ' +coCRLF +
               '                	DECODE( CT.CVE_OPERACION, ''CPIVAP'',CT.IMP_OPERACION,''CAMIVA'',CT.IMP_OPERACION,''CPIVAV'', CT.IMP_OPERACION, 0 ) PAGIVAIN, ' +coCRLF +
               '                	0 PAGOCP,       0 PGOFN,  0 PAGOMOR,      0 PAGIVAMOR,    0 PAGOCN ' +coCRLF +
               '                FROM    CRE_TRANSACCION CT,     CRE_OPERACION CO,       CRE_CREDITO CR, CONTRATO CTO, ' +coCRLF +
               '                        CRE_CONTRATO    CC,     CRE_INTERES   CI, ' +coCRLF +
               '                        ( SELECT /*+ CHOOSE */ID_CREDITO, NUM_PERIODO, F_PAGO - F_PROG_PAGO  NUM_DIAS_VENCIDO ' +coCRLF +
               '                          FROM CRE_INTERES  WHERE F_PAGO > F_PROG_PAGO ' +coCRLF;
                 If (Trim(sDisp)<> '')Then sSQLINTER := sSQLINTER + ' AND ID_CREDITO = '+ sDisp ;
    sSQLINTER:= sSQLINTER +
               '                        )CI1, ' +coCRLF +
               '                        ( SELECT /*+ CHOOSE */ID_CREDITO, NUM_PERIODO, COUNT(*) DIAS_DEV FROM CRE_PROV_DIARIA' + coCRLF +
               '                          WHERE 1 = 1  ';
                 If (Trim(sDisp)<> '')Then sSQLINTER := sSQLINTER + ' AND ID_CREDITO = '+ sDisp ;
    sSQLINTER:= sSQLINTER +
               '                          GROUP BY ID_CREDITO, NUM_PERIODO ' +coCRLF +
               '                        ) CPD'+
               '                WHERE CT.F_PROCESO >= ' + SQLFecha(StrToDateTime(sFIni))+coCRLF +
               '                  AND CT.F_PROCESO >= ' + SQLFecha(StrToDateTime(sFFin))+coCRLF +
               '                  AND CR.ID_CREDITO      = CT.ID_CREDITO  AND CT.CVE_OPERACION   = CO.CVE_OPERACION ' +coCRLF +
               '                  AND CC.ID_CONTRATO     = CR.ID_CONTRATO AND CT.SIT_TRANSACCION = ''AC'' ' +coCRLF +
//CNBV 13112008               ObtenSQLAplicaFiltroCto( peApli, 'CLASE_TMEDOMOVTO', '                  AND CC.ID_CONTRATO ', False ) + { < SATV4766 04/09/2006> }
               ObtenSQLAplicaFiltroCred( peApli, 'CLASE_TMEDOMOVTO', '                  AND CR.ID_CREDITO ', False ) + { < SATV4766 04/09/2006> }
               '                  AND CT.CVE_OPERACION  IN(''CPINTV'',''CPIVAV'',''CAMINT'',''CAMIVA'',''CEBENE'',''CEDBCO'',''CBENFI'',' +coCRLF +
               '                			   ''CERONE'',''CPIVPR'',''CPINTP'',''CPIVAP'',''REFI'',''CASVEP'') ' +coCRLF +
               '                  AND CT.ID_CREDITO  = CI.ID_CREDITO        AND CT.NUM_PERIODO     = CI.NUM_PERIODO ' +coCRLF +
               '                  AND CI.ID_CREDITO  = CI1.ID_CREDITO(+)    AND CI.NUM_PERIODO = CI1.NUM_PERIODO(+) ' +coCRLF +
               '                  AND CI.ID_CREDITO   = CPD.ID_CREDITO(+) AND CI.NUM_PERIODO   = CPD.NUM_PERIODO ' +
               '                  AND CT.ID_CONTRATO   = CTO.ID_CONTRATO ';
               If (Trim(sDisp)<> '')Then sSQLINTER := sSQLINTER + ' AND CT.ID_CREDITO = '+ sDisp ;
               If (Trim(sAcreditado)<>  '')Then sSQLINTER := sSQLINTER + ' AND CTO.ID_TITULAR = '+ sAcreditado ;
    sSQLINTER:= sSQLINTER +
               '                UNION ' +coCRLF +
               '                --CONCEPTOS ' +coCRLF +
               '                SELECT  /*+ CHOOSE */1 ORD, CT.F_PROCESO F_OPERACION, CO.DESC_L_ID_PRIM||'' ''||CN.CVE_COMISION TX_NOTA, CR.ID_CREDITO, ' +coCRLF +
               '                        NVL(CT.NUM_PERIODO,0) NUM_PERIODO, CN.F_INICIO, CN.F_VENCIMIENTO, CN.F_PROG_PAGO, CN.F_PAGO, CN.NUM_DIAS_VENCIDO DIAS_VDOS, ' +coCRLF +
               '                        0 DIAS_DEV,  0 IMP_CAPITAL,  CT.TASA_APLICACION TASA_APLICADA, 0 FINADIC, ' +coCRLF +
               '                        0 IMP_INTERES,  0 IVAINT,       0 IMP_MOR, ' +coCRLF +
               '                	DECODE( CT.CVE_OPERACION, ''CIVMOD'',CT.IMP_OPERACION, 0) MOR_IVA, ' +coCRLF +
               '                	0 PAGOIN,       0 PAGIVAIN,     0 PAGOCP,       0 PGOFN, 0 PAGOMOR,      0 PAGIVAMOR, ' +coCRLF +
               '                	DECODE( CT.CVE_OPERACION, ''CMORAD'', CT.IMP_OPERACION, ''CAMCON'', CT.IMP_OPERACION, ' +coCRLF +
               '                                                  ''CAMICO'', CT.IMP_OPERACION, ''CAPACO'', CT.IMP_OPERACION, ' +coCRLF +
               '                                                  ''CAPICO'', CT.IMP_OPERACION, ''CPIVDV'', CT.IMP_OPERACION, ' +coCRLF +
               '                                                  ''CPIVDP'', CT.IMP_OPERACION, 0) PAGOCN ' +coCRLF +
               '                FROM  CRE_TRANSACCION  CT,      CRE_OPERACION CO, ' +coCRLF +
               '                      CRE_CREDITO CR,           CRE_CONTRATO  CC, CONTRATO CTO,' +coCRLF +
               '                      ( SELECT /*+ CHOOSE */CN.* ' +coCRLF +
               '                        FROM ( SELECT /*+ CHOOSE */CN.ID_CREDITO, ( SELECT /*+ CHOOSE */NVL(C.F_VENCIMIENTO, CR.F_VALOR_CRED) FROM CRE_DET_COMISION C, CRE_CREDITO CR ' +coCRLF +
               '        	      				       WHERE C.ID_CREDITO   = CN.ID_CREDITO     AND C.NUM_PERIODO  = CN.NUM_PERIODO-1 ' +coCRLF +
               '                                                         AND C.CVE_COMISION = CN.CVE_COMISION   AND C.ID_CREDITO   = CR.ID_CREDITO ) F_INICIO, ' +coCRLF +
               '                                      CN.NUM_PERIODO, CN.CVE_COMISION, ' +coCRLF +
               '                                      CN.F_VENCIMIENTO, CN.F_PROG_PAGO,  CN.F_PAGO, NVL( CN1.NUM_DIAS_VENCIDO,0) NUM_DIAS_VENCIDO, CN.IMP_COMISION IMPORTE ' +coCRLF +
               '                               FROM CRE_DET_COMISION CN, ' +coCRLF +
               '                                    ( SELECT /*+ CHOOSE */ID_CREDITO, NUM_PERIODO, F_PAGO - F_PROG_PAGO  NUM_DIAS_VENCIDO ' +coCRLF +
               '                                      FROM CRE_DET_COMISION WHERE F_PAGO > F_PROG_PAGO ' +coCRLF;
                 If (Trim(sDisp)<> '')Then sSQLINTER := sSQLINTER +
               '                                        AND ID_CREDITO = '+ sDisp ;
    sSQLINTER:= sSQLINTER +
               '                                    )CN1  ' +coCRLF +
               '                               WHERE CN.F_PROG_PAGO >=' + SQLFecha(StrToDateTime(sFIni))+coCRLF +
               '                                 AND CN.F_PROG_PAGO <=' + SQLFecha(StrToDateTime(sFFin))+coCRLF +
               '                                 AND CN.ID_CREDITO   = CN1.ID_CREDITO(+) AND CN.NUM_PERIODO  = CN1.NUM_PERIODO(+) ' +coCRLF;
                 If (Trim(sDisp)<> '')Then sSQLINTER := sSQLINTER + ' AND CN.ID_CREDITO = '+ sDisp ;
    sSQLINTER:= sSQLINTER +
               '                             )CN ' +coCRLF +
               '                        ORDER BY CN.ID_CREDITO ' +coCRLF +
               '                      )CN ' +coCRLF +
               '                WHERE CT.F_PROCESO >=' + SQLFecha(StrToDateTime(sFIni))+coCRLF +
               '                  AND CT.F_PROCESO <=' + SQLFecha(StrToDateTime(sFFin))+coCRLF +
               '                  AND CR.ID_CREDITO      = CT.ID_CREDITO        AND CT.CVE_OPERACION   = CO.CVE_OPERACION ' +coCRLF +
               '                  AND CC.ID_CONTRATO     = CR.ID_CONTRATO       AND CT.SIT_TRANSACCION = ''AC'' ' +coCRLF +
//CNBV 13112008               ObtenSQLAplicaFiltroCto( peApli, 'CLASE_TMEDOMOVTO', '                  AND CC.ID_CONTRATO ', False ) + { < SATV4766 04/09/2006> }
               ObtenSQLAplicaFiltroCred( peApli, 'CLASE_TMEDOMOVTO', '                  AND CR.ID_CREDITO ', False ) + { < SATV4766 04/09/2006> }
               '                  AND CT.CVE_OPERACION  IN (''CIVMOD'',''CMORAD'',''CAMCON'',''CAMICO'',''CAPACO'',''CAPICO'',''CPIVDV'',''CPIVDP'') ' +coCRLF +
               '                  AND CT.ID_CREDITO      = CN.ID_CREDITO        AND CT.NUM_PERIODO     = CN.NUM_PERIODO ' +
               '                  AND CT.ID_CONTRATO   = CTO.ID_CONTRATO ';
               If (Trim(sDisp)<> '')Then sSQLINTER := sSQLINTER + ' AND CT.ID_CREDITO = '+ sDisp ;
               If (Trim(sAcreditado)<>  '')Then sSQLINTER := sSQLINTER + ' AND CTO.ID_TITULAR = '+ sAcreditado ;
    sSQLINTER:= sSQLINTER +
               '             )CT, CRE_CREDITO CR, CONTRATO CTO, PERSONA P, MONEDA M, CRE_CLIENTE C ' +coCRLF +
               '        WHERE CT.ID_CREDITO   = CR.ID_CREDITO    AND CTO.ID_CONTRATO = CR.ID_CONTRATO ' +coCRLF +
//CNBV 13112008               ObtenSQLAplicaFiltroCto( peApli, 'CLASE_TMEDOMOVTO', '          AND CTO.ID_CONTRATO ', False ) + { < SATV4766 04/09/2006> }
               ObtenSQLAplicaFiltroCred( peApli, 'CLASE_TMEDOMOVTO', '                  AND CR.ID_CREDITO ', False ) + { < SATV4766 04/09/2006> }                              
               '          AND P.ID_PERSONA    = CTO.ID_TITULAR   ' +coCRLF +
               '          AND P.ID_PERSONA    = C.ID_PERSONA     AND CTO.CVE_MONEDA  = M.CVE_MONEDA' +coCRLF;

                 If (Trim(sEmpresa)<>     '')Then sSQLINTER := sSQLINTER + ' AND CTO.ID_EMPRESA      = '+ sEmpresa ;
                 If (Trim(sAcreditado)<>  '')Then sSQLINTER := sSQLINTER + ' AND CTO.ID_TITULAR      = '+ sAcreditado ;
                 If (Trim(sDisp)<>        '')Then sSQLINTER := sSQLINTER + ' AND CR.ID_CREDITO       = '+ sDisp ;
                 If (Trim(sPromAsoc)<>    '')Then sSQLINTER := sSQLINTER + ' AND CTO.ID_PERS_ASOCIAD = '+ sPromAsoc;
                 If (Trim(sPromAdm)<>     '')Then sSQLINTER := sSQLINTER + ' AND CR.ID_PROM_ADM      = '+ sPromAdm ;
                 If (Trim(sGpoEconomico)<>'')Then sSQLINTER := sSQLINTER + ' AND C.CVE_GRUPO         = '+ SQLStr( sGpoEconomico );


    //ICRE
   sSQLICRE :=
               '        --ICRE ' +coCRLF +
               '        SELECT /*+ CHOOSE */P.ID_PERSONA, P.NOMBRE, CTO.CVE_MONEDA, M.DESC_MONEDA, ' +coCRLF +
               '               CT.* ' +coCRLF +
               '        FROM ( ' +coCRLF +
               '              SELECT  /*+ CHOOSE */0 ORD, CI.F_VENCIMIENTO F_OPERACION, ' +coCRLF +
               '                      ''CARGO INTS. PROGRAMADOS'' TX_NOTA, CR.ID_CREDITO, CI.NUM_PERIODO ID_PERIODO, ' +coCRLF +
               '                          NVL(CI.F_VENCIMIENTO - CI.PLAZO, CR.F_INICIO) F_INICIO, ' +coCRLF +
               '                      CI.F_VENCIMIENTO, CI.F_PROG_PAGO, CI.F_PAGO, ' +coCRLF +
               '                      NVL(CI.NUM_DIAS_VENCIDO,0) DIAS_VDOS , CPD.DIAS_DEV,  0 IMP_CAPITAL, ' +coCRLF +
               '                      CI.TASA_APLICADA, 0 FINADIC, CI.IMP_INTERES IMP_INTERES, CI.IMP_IVA IVAINT, ' +coCRLF +
               '                          0 IMP_MOR,      0 MOR_IVA,      0 PAGOIN,       0 PAGIVAIN, ' +coCRLF +
               '                          0 PAGOCP,       0 PAGOFN,        0 PAGOMOR,      0 PAGIVAMOR,    0 PAGOCN ' +coCRLF +
               '              FROM  CR_INTERES CI, CR_CREDITO CR, ' +coCRLF +
               '                    ( SELECT /*+ CHOOSE */ID_CREDITO, NUM_PERIODO, COUNT(*) DIAS_DEV FROM CRE_PROV_DIARIA ' +coCRLF +
               '                      WHERE 1 = 1 ' ;
               If (Trim(sDisp)<> '')Then sSQLICRE := sSQLICRE + ' AND ID_CREDITO = '+ sDisp + coCRLF ;
   sSQLICRE := sSQLICRE +
               '                      GROUP BY ID_CREDITO, NUM_PERIODO ' +coCRLF +
               '                    ) CPD ' +coCRLF +
               '              WHERE CI.F_PROG_PAGO >= ' + SQLFecha(StrToDateTime(sFIni))+coCRLF +
               '                AND CI.F_PROG_PAGO <= ' + SQLFecha(StrToDateTime(sFFin))+coCRLF +
               '                AND CR.ID_CREDITO  = CI.ID_CREDITO ' +coCRLF +
               '                AND CI.IMP_INTERES_PROY <> 0 ' +coCRLF +
               '                AND CI.ID_CREDITO  = CPD.ID_CREDITO(+) AND CI.NUM_PERIODO   = CPD.NUM_PERIODO ' +coCRLF ;
               If (Trim(sDisp)<> '')Then sSQLICRE := sSQLICRE + ' AND CI.ID_CREDITO = '+ sDisp + coCRLF ;
   sSQLICRE := sSQLICRE +
               '         UNION ' +coCRLF +
               '                SELECT /*+ CHOOSE */1 ORD, F_OPERACION, TX_NOTA, ID_CREDITO, NVL(ID_PERIODO,0) ID_PERIODO, ' +coCRLF +
               '        	       F_INICIO, F_VENCIMIENTO, F_PROG_PAGO, F_PAGO, NVL(NUM_DIAS_VENCIDO,0) DIAS_VDOS, DIAS_DEV, ' +coCRLF +
               '                       DECODE(CVE_ACCESORIO, ''CP'', IMPORTE, 0) IMP_CAPITAL, ' +coCRLF +
               '                       DECODE(CVE_ACCESORIO, ''IN'', TASA_APLICADA, 0)  TASA_APLICADA, ' +coCRLF +
               '                       DECODE(CVE_OPERACION, ''PAINFA'', IMPORTE, DECODE(CVE_ACCESORIO, ''FN'', IMPORTE, 0)) FINADIC, ' +coCRLF +
               '                       DECODE(CVE_OPERACION, ''PAINFA'', 0, DECODE(CVE_ACCESORIO, ''IN'', IMPORTE, 0)) IMP_INTERES, ' +coCRLF +
               '                       DECODE(CVE_ACCESORIO, ''IN'', IMP_IVA, 0) IVAINT, ' +coCRLF +
               '                       IMP_MOR, ' +coCRLF +
               '                       MOR_IVA, ' +coCRLF +
               '                       DECODE(CVE_OPERACION, ''PAINFA'', 0, DECODE(CVE_ACCESORIO, ''IN'', IMPBRU, 0)) PAGOIN, ' +coCRLF +
               '                       DECODE(CVE_ACCESORIO, ''IN'', IMPIVA, 0) PAGIVAIN, ' +coCRLF +
               '                       DECODE(CVE_ACCESORIO, ''CP'', IMPBRU, 0) PAGOCP, ' +coCRLF +
               '                       DECODE(CVE_ACCESORIO, ''FN'', IMPBRU, 0) PAGOFN, ' +coCRLF +
               '                       DECODE(CVE_ACCESORIO, ''CP'', DECODE(CVE_AFEC_SALDO, ''I'', IMPMOR, 0), 0) PAGOMOR, ' +coCRLF +
               '                       DECODE(CVE_ACCESORIO, ''CP'', DECODE(CVE_AFEC_SALDO, ''I'', IVAMOR, 0), 0) PAGIVAMOR, ' +coCRLF +
               '                       DECODE(CVE_ACCESORIO, ''CN'', IMPBRU, 0) + DECODE(CVE_ACCESORIO, ''CN'', IMPIVA, 0) PAGOCN ' +coCRLF +
               '                FROM ( ' +coCRLF +
               '                        SELECT /*+ CHOOSE */CT.CVE_ACCESORIO, CT.F_OPERACION, CT.TX_NOTA, CT.ID_CREDITO, CT.ID_PERIODO, ' +coCRLF +
               '                               CT.F_INICIO, CT.F_VENCIMIENTO, CT.F_PROG_PAGO, CT.F_PAGO, CT.NUM_DIAS_VENCIDO, CT.IMPORTE, ' +coCRLF +
               '                               CT.IMP_IVA, CT.TASA_APLICADA,CT.CVE_OPERACION, CT.CVE_AFEC_SALDO, CT.DIAS_DEV, ' +coCRLF +
               '                               CT.IMP_MORATORIO IMP_MOR, IMP_IVA_MORA MOR_IVA, ' +coCRLF +
               '                               sum(DECODE(CDT.CVE_CONCEPTO,''IMPBRU'',CDT.IMP_CONCEPTO,0)) IMPBRU, ' +coCRLF +
               '                               sum(DECODE(CDT.CVE_CONCEPTO,''IMPIVA'',CDT.IMP_CONCEPTO,0)) IMPIVA, ' +coCRLF +
               '                               sum(DECODE(CDT.CVE_CONCEPTO,''IMPMOR'',CDT.IMP_CONCEPTO,0)) IMPMOR, ' +coCRLF +
               '                               sum(DECODE(CDT.CVE_CONCEPTO,''IVAMOR'',CDT.IMP_CONCEPTO,0)) IVAMOR ' +coCRLF +
               '                        FROM ( ' +coCRLF +
               '                                /*CAPITAL*/' +coCRLF +
               '                                SELECT /*+ CHOOSE */''CP'' CVE_ACCESORIO, CP.* ' +coCRLF +
               '                                FROM ( ' +coCRLF +
               '                                        SELECT /*+ CHOOSE */CT.*, CP.F_INICIO, CP.NUM_PERIODO, CO.CVE_AFEC_SALDO, ' +coCRLF +
               '                                               CP.F_VENCIMIENTO, CP.F_PAGO, CP.NUM_DIAS_VENCIDO, CP.IMPORTE, 0 IMP_IVA, 0 DIAS_DEV, ' +coCRLF +
               '                                               CP.IMP_MORATORIO, CP.IMP_IVA_MORA ' +coCRLF +
               '                                        FROM CR_TRANSACCION CT, CONTRATO CTO,  ' +coCRLF +
               '                                             ( SELECT /*+ CHOOSE */C.ID_CREDITO, F_INICIO, 0 NUM_PERIODO, ' +coCRLF +
               '                                                      C.F_VENCIMIENTO, CP.F_PAGO, CP.NUM_DIAS_VENCIDO, C.IMP_CREDITO IMPORTE, ' +coCRLF +
               '                                                      CP.IMP_MORATORIO, CP.IMP_IVA_MORA ' +coCRLF +
               '                                               FROM CR_CREDITO C, ' +coCRLF +
               '                				    ( SELECT /*+ CHOOSE */ID_CREDITO, MAX(F_PAGO) F_PAGO, MAX(F_PROG_PAGO) F_PROG_PAGO, ' +coCRLF +
               '                                                             MAX(NUM_DIAS_VENCIDO) NUM_DIAS_VENCIDO, ' +coCRLF +
               '                                                             MAX(IMP_MORATORIO) IMP_MORATORIO, MAX(IMP_IVA_MORA ) IMP_IVA_MORA ' +coCRLF +
               '                                                      FROM CR_CAPITAL WHERE 1 = 1 ';
               If (Trim(sDisp)<> '')Then sSQLICRE := sSQLICRE + ' AND ID_CREDITO = '+ sDisp + coCRLF ;
   sSQLICRE := sSQLICRE +
               '                				      GROUP BY ID_CREDITO ' +coCRLF +
               '                                                    ) CP ' +coCRLF +
               '                			       WHERE C.ID_CREDITO = CP.ID_CREDITO ';
               If (Trim(sDisp)<> '')Then sSQLICRE := sSQLICRE + ' AND C.ID_CREDITO = '+ sDisp + coCRLF ;
   sSQLICRE := sSQLICRE +
               '                                             )CP, ' +coCRLF +
               '                                             ( SELECT /*+ CHOOSE */* FROM CR_OPERACION WHERE CVE_ACCESORIO IN ( ''CR'' ) AND CVE_AFEC_SALDO <> ''N'' ' +coCRLF +
               '                                             )CO ' +coCRLF +
               '                                        WHERE CT.F_OPERACION  >= ' + SQLFecha(StrToDateTime(sFIni))+coCRLF +
               '                                          AND CT.F_OPERACION  <= ' + SQLFecha(StrToDateTime(sFFin))+coCRLF +
               '                                          AND CT.ID_CREDITO    = CP.ID_CREDITO AND CO.CVE_OPERACION = CT.CVE_OPERACION ' +coCRLF +
               '                                          AND CT.ID_CONTRATO   = CTO.ID_CONTRATO '+coCRLF+
//CNBV 13112008               ObtenSQLAplicaFiltroCto( peApli, 'CLASE_TMEDOMOVTO', '                                          AND CTO.ID_CONTRATO  ', False ) { < SATV4766 04/09/2006> }
               ObtenSQLAplicaFiltroCred( peApli, 'CLASE_TMEDOMOVTO', '                  AND CT.ID_CREDITO ', False ) { < SATV4766 04/09/2006> }
               ;
               If (Trim(sDisp)<> '')Then sSQLICRE := sSQLICRE + ' AND CT.ID_CREDITO = '+ sDisp ;
               If (Trim(sAcreditado)<>  '')Then sSQLICRE := sSQLICRE + ' AND CTO.ID_TITULAR = '+ sAcreditado ;
   sSQLICRE := sSQLICRE +
               '                                      UNION ' +coCRLF +
               '                                        SELECT /*+ CHOOSE */CT.*, CP.F_INICIO, CP.NUM_PERIODO, CO.CVE_AFEC_SALDO, ' +coCRLF +
               '                                               CP.F_VENCIMIENTO, CP.F_PAGO, CP.NUM_DIAS_VENCIDO, CP.IMPORTE, 0 IMP_IVA, 0 DIAS_DEV, ' +coCRLF +
               '                                               CP.IMP_MORATORIO, CP.IMP_IVA_MORA ' +coCRLF +
               '                                        FROM CR_TRANSACCION CT,CONTRATO CTO, ' +coCRLF +
               '                                             ( SELECT /*+ CHOOSE */CP.ID_CREDITO, NVL(CP.F_VENCIMIENTO - CP.PLAZO, CR.F_INICIO) F_INICIO, CP.NUM_PERIODO, ' +coCRLF +
               '                                                      CP.F_VENCIMIENTO, CP.F_PAGO, CP.NUM_DIAS_VENCIDO, CP.IMP_CAPITAL IMPORTE, ' +coCRLF +
               '                                                      CP.IMP_MORATORIO, CP.IMP_IVA_MORA ' +coCRLF +
               '                                               FROM CR_CAPITAL CP, CR_CREDITO CR WHERE CR.ID_CREDITO = CP.ID_CREDITO ' +coCRLF;
               If (Trim(sDisp)<> '')Then sSQLICRE := sSQLICRE +
               '                                                 AND CP.ID_CREDITO = '+ sDisp + coCRLF ;
   sSQLICRE := sSQLICRE +
               '                                             )CP, ' +coCRLF +
               '                                             ( SELECT /*+ CHOOSE */* FROM CR_OPERACION WHERE CVE_ACCESORIO IN ( ''CP'', ''CR'' ) AND CVE_AFEC_SALDO <> ''N'' ' +coCRLF +
               '                                             )CO ' +coCRLF +
               '                                        WHERE CT.F_OPERACION  >= ' + SQLFecha(StrToDateTime(sFIni))+coCRLF +
               '                                          AND CT.F_OPERACION  <= ' + SQLFecha(StrToDateTime(sFFin))+coCRLF +
               '                                          AND CT.ID_CREDITO    = CP.ID_CREDITO AND CT.ID_PERIODO    = CP.NUM_PERIODO ' +coCRLF +
               '                                          AND CO.CVE_OPERACION = CT.CVE_OPERACION ' + coCRLF +
               '                                          AND CT.ID_CONTRATO   = CTO.ID_CONTRATO '+ coCRLF + 
//CNBV 13112008               ObtenSQLAplicaFiltroCto( peApli, 'CLASE_TMEDOMOVTO', '                                          AND CTO.ID_CONTRATO ', False ) { < SATV4766 04/09/2006> }
               ObtenSQLAplicaFiltroCred( peApli, 'CLASE_TMEDOMOVTO', '                  AND CT.ID_CREDITO ', False ) { < SATV4766 04/09/2006> }
               ;
               If (Trim(sDisp)<> '')Then sSQLICRE := sSQLICRE + ' AND CT.ID_CREDITO = '+ sDisp ;
               If (Trim(sAcreditado)<>  '')Then sSQLICRE := sSQLICRE + ' AND CTO.ID_TITULAR = '+ sAcreditado ;
   sSQLICRE := sSQLICRE +
               '                                 )CP ' +coCRLF +
               '                              UNION /*FINANCIAMIENTO ADICIONAL*/' +coCRLF +
               '                                SELECT /*+ CHOOSE */CO.CVE_ACCESORIO, CT.*, CF.F_INICIO, CF.NUM_PERIODO,CO.CVE_AFEC_SALDO, ' +coCRLF +
               '                                       CF.F_VENCIMIENTO, CF.F_PAGO, CF.NUM_DIAS_VENCIDO, CF.IMPORTE, 0 IMP_IVA, 0 DIAS_DEV, ' +coCRLF +
               '                                       CF.IMP_MORATORIO, CF.IMP_IVA_MORA ' +coCRLF +
               '                                FROM CR_TRANSACCION CT, CONTRATO CTO,' +coCRLF +
               '                                     ( SELECT /*+ CHOOSE */CF.ID_CREDITO, NVL(CF.F_VENCIMIENTO - CF.PLAZO, CR.F_INICIO) F_INICIO, CF.NUM_PERIODO, ' +coCRLF +
               '                                              CF.F_VENCIMIENTO, CF.F_PAGO, CF.NUM_DIAS_VENCIDO, CF.IMP_FINAN_ADIC IMPORTE, ' +coCRLF +
               '                                              CF.IMP_MORATORIO, CF.IMP_IVA_MORA ' +coCRLF +
               '                                       FROM CR_FINAN_ADIC CF, CR_CREDITO CR WHERE CR.ID_CREDITO = CF.ID_CREDITO ' +coCRLF;
               If (Trim(sDisp)<> '')Then sSQLICRE := sSQLICRE +
               '                                         AND CF.ID_CREDITO = '+ sDisp + coCRLF ;
   sSQLICRE := sSQLICRE +
               '                                     )CF, ' +coCRLF +
               '                                     ( SELECT /*+ CHOOSE */* FROM CR_OPERACION WHERE CVE_ACCESORIO = ''FN'' AND CVE_AFEC_SALDO <> ''N'' ' +coCRLF +
               '                                     )CO ' +coCRLF +
               '                                WHERE CT.F_OPERACION  >= ' + SQLFecha(StrToDateTime(sFIni))+coCRLF +
               '                                  AND CT.F_OPERACION  <= ' + SQLFecha(StrToDateTime(sFFin))+coCRLF +
               '                                  AND CT.ID_CREDITO    = CF.ID_CREDITO AND CT.ID_PERIODO    = CF.NUM_PERIODO ' +coCRLF +
               '                                  AND CO.CVE_OPERACION = CT.CVE_OPERACION '  + coCRLF +
               '                                          AND CT.ID_CONTRATO   = CTO.ID_CONTRATO ' + coCRLF +
//CNBV 13112008               ObtenSQLAplicaFiltroCto( peApli, 'CLASE_TMEDOMOVTO', '                                          AND CTO.ID_CONTRATO ', False ) { < SATV4766 04/09/2006> }
               ObtenSQLAplicaFiltroCred( peApli, 'CLASE_TMEDOMOVTO', '                  AND CT.ID_CREDITO ', False ) { < SATV4766 04/09/2006> }
               ;
               If (Trim(sDisp)<> '')Then sSQLICRE := sSQLICRE + ' AND CT.ID_CREDITO = '+ sDisp ;
               If (Trim(sAcreditado)<>  '')Then sSQLICRE := sSQLICRE + ' AND CTO.ID_TITULAR = '+ sAcreditado ;
   sSQLICRE := sSQLICRE +
               '                              UNION /*INTERES*/' +coCRLF +
               '                                SELECT /*+ CHOOSE */CO.CVE_ACCESORIO, CT.*, CI.F_INICIO, CI.NUM_PERIODO,CO.CVE_AFEC_SALDO, ' +coCRLF +
               '                                       CI.F_VENCIMIENTO, CI.F_PAGO, CI.NUM_DIAS_VENCIDO, CI.IMPORTE, CI.IMP_IVA, 0 DIAS_DEV, ' +coCRLF +
               '                                       CI.IMP_MORATORIO, CI.IMP_IVA_MORA ' +coCRLF +
               '                                FROM CR_TRANSACCION CT,CONTRATO CTO, ' +coCRLF +
               '                                     ( SELECT /*+ CHOOSE */CI.ID_CREDITO, NVL(CI.F_VENCIMIENTO - CI.PLAZO, CR.F_INICIO) F_INICIO, CI.NUM_PERIODO, ' +coCRLF +
               '                                              CI.F_VENCIMIENTO, CI.F_PAGO, CI.NUM_DIAS_VENCIDO, CI.IMP_INTERES IMPORTE, CI.IMP_IVA, ' +coCRLF +
               '                                              CI.IMP_MORATORIO, CI.IMP_IVA_MORA ' +coCRLF +
               '                                       FROM CR_INTERES CI, CR_CREDITO CR WHERE CR.ID_CREDITO = CI.ID_CREDITO ' +coCRLF +
               '                                     )CI, ' +coCRLF +
               '                                     ( SELECT /*+ CHOOSE */* FROM CR_OPERACION WHERE CVE_ACCESORIO = ''IN'' AND CVE_AFEC_SALDO <> ''N'' ' +coCRLF +
               '                                      UNION SELECT /*+ CHOOSE */* FROM CR_OPERACION WHERE CVE_OPERACION = ''PAINFA'' ' +coCRLF +
               '                                     )CO ' +coCRLF +
               '                                WHERE CT.F_OPERACION  >= ' + SQLFecha(StrToDateTime(sFIni))+coCRLF +
               '                                  AND CT.F_OPERACION  <= ' + SQLFecha(StrToDateTime(sFFin))+coCRLF +
               '                                  AND CT.ID_CREDITO    = CI.ID_CREDITO AND CT.ID_PERIODO    = CI.NUM_PERIODO ' +coCRLF +
               '                                  AND CO.CVE_OPERACION = CT.CVE_OPERACION ' +
               '                                          AND CT.ID_CONTRATO   = CTO.ID_CONTRATO '+coCRLF+
//CNBV 13112008               ObtenSQLAplicaFiltroCto( peApli, 'CLASE_TMEDOMOVTO', '                                          AND CTO.ID_CONTRATO ', False ) { < SATV4766 04/09/2006> }
               ObtenSQLAplicaFiltroCred( peApli, 'CLASE_TMEDOMOVTO', '                  AND CT.ID_CREDITO ', False ) { < SATV4766 04/09/2006> }
               ;
               If (Trim(sDisp)<> '')Then sSQLICRE := sSQLICRE + ' AND CT.ID_CREDITO = '+ sDisp ;
               If (Trim(sAcreditado)<>  '')Then sSQLICRE := sSQLICRE + ' AND CTO.ID_TITULAR = '+ sAcreditado ;
   sSQLICRE := sSQLICRE +
               '                              UNION /*CONCEPTOS*/' +coCRLF +
               '                                SELECT /*+ CHOOSE */CO.CVE_ACCESORIO, CT.*, CN.F_INICIO, CN.NUM_PERIODO,CO.CVE_AFEC_SALDO, ' +coCRLF +
               '                                       CN.F_VENCIMIENTO, CN.F_PAGO, CN.NUM_DIAS_VENCIDO, CN.IMPORTE, CN.IMP_IVA, 0 DIAS_DEV, ' +coCRLF +
               '                                       CN.IMP_MORATORIO, CN.IMP_IVA_MORA ' +coCRLF +
               '                                FROM CR_TRANSACCION CT, CONTRATO CTO, ' +coCRLF +
               '                                     ( SELECT /*+ CHOOSE */CN.ID_CREDITO, NVL(CN.F_VENCIMIENTO - CN.PLAZO, CR.F_INICIO) F_INICIO, CN.NUM_PERIODO, ' +coCRLF +
               '                                              CN.F_VENCIMIENTO, CN.F_PAGO, CN.NUM_DIAS_VENCIDO, CN.IMP_COMISION IMPORTE, CN.IMP_IVA, ' +coCRLF +
               '                                              CN.IMP_MORATORIO, CN.IMP_IVA_MORA ' +coCRLF +
               '                                       FROM CR_COMISION CN, CR_CREDITO CR WHERE CR.ID_CREDITO = CN.ID_CREDITO ';
               If (Trim(sDisp)<> '')Then sSQLICRE := sSQLICRE +
               '                                         AND CN.ID_CREDITO = '+ sDisp + coCRLF ;
   sSQLICRE := sSQLICRE +
               '                                     )CN, ' +coCRLF +
               '                                     ( SELECT /*+ CHOOSE */* FROM CR_OPERACION WHERE CVE_ACCESORIO = ''CN'' AND CVE_AFEC_SALDO <> ''N'')CO ' +coCRLF +
               '                                WHERE CT.F_OPERACION  >= ' + SQLFecha(StrToDateTime(sFIni))+coCRLF +
               '                                  AND CT.F_OPERACION  <= ' + SQLFecha(StrToDateTime(sFFin))+coCRLF +
               '                                  AND CT.ID_CREDITO    = CN.ID_CREDITO AND CT.ID_PERIODO    = CN.NUM_PERIODO ' +coCRLF +
               '                                  AND CO.CVE_OPERACION = CT.CVE_OPERACION ' + coCRLF +
               '                                  AND CT.ID_CONTRATO   = CTO.ID_CONTRATO ' + coCRLF +
//CNBV 13112008               ObtenSQLAplicaFiltroCto( peApli, 'CLASE_TMEDOMOVTO', '                                  AND CTO.ID_CONTRATO ', False ) { < SATV4766 04/09/2006> }
               ObtenSQLAplicaFiltroCred( peApli, 'CLASE_TMEDOMOVTO', '                  AND CT.ID_CREDITO ', False ) { < SATV4766 04/09/2006> }
               ;               
               If (Trim(sDisp)<> '')Then sSQLICRE := sSQLICRE + ' AND CT.ID_CREDITO = '+ sDisp ;
               If (Trim(sAcreditado)<>  '')Then sSQLICRE := sSQLICRE + ' AND CTO.ID_TITULAR = '+ sAcreditado ;
   sSQLICRE := sSQLICRE +
               '                             )CT, CR_DET_TRANSAC CDT ' +coCRLF +
               '                        WHERE CT.ID_TRANSACCION = CDT.ID_TRANSACCION ';
               If (Trim(sDisp)<> '')Then sSQLICRE := sSQLICRE + ' AND CT.ID_CREDITO = '+ sDisp + coCRLF ;
   sSQLICRE := sSQLICRE +
               '                        GROUP BY CT.CVE_ACCESORIO, CT.F_OPERACION, CT.TX_NOTA, CT.ID_CREDITO, CT.ID_PERIODO, ' +coCRLF +
               '                        	 CT.F_INICIO, CT.F_VENCIMIENTO, CT.F_PROG_PAGO, CT.F_PAGO, CT.NUM_DIAS_VENCIDO, CT.IMPORTE, ' +coCRLF +
               '                		 CT.IMP_IVA, CT.TASA_APLICADA, CT.CVE_OPERACION,CT.CVE_AFEC_SALDO, CT.DIAS_DEV, ' +coCRLF +
               '                                 CT.IMP_MORATORIO, CT.IMP_IVA_MORA ' +coCRLF +
               '                     ) ' +coCRLF +
               '             )CT, CR_CREDITO CR, CONTRATO CTO, PERSONA P, MONEDA M ' +coCRLF +
               '        WHERE CT.ID_CREDITO   = CR.ID_CREDITO   AND CTO.ID_CONTRATO = CR.ID_CONTRATO ' +coCRLF +
//CNBV 13112008               ObtenSQLAplicaFiltroCto( peApli, 'CLASE_TMEDOMOVTO', '          AND CTO.ID_CONTRATO ', False ) + { < SATV4766 04/09/2006> }
               ObtenSQLAplicaFiltroCred( peApli, 'CLASE_TMEDOMOVTO', '                  AND CR.ID_CREDITO ', False ) + { < SATV4766 04/09/2006> }
               '          AND P.ID_PERSONA    = CTO.ID_TITULAR  AND CTO.CVE_MONEDA  = M.CVE_MONEDA' +coCRLF;
                 If (Trim(sEmpresa)<>     '')Then sSQLICRE := sSQLICRE + ' AND CTO.ID_EMPRESA        = '+ sEmpresa ;
                 If (Trim(sAcreditado)<>  '')Then sSQLICRE := sSQLICRE + ' AND CTO.ID_TITULAR        = '+ sAcreditado ;
                 If (Trim(sDisp)<>        '')Then sSQLICRE := sSQLICRE + ' AND CR.ID_CREDITO         = '+ sDisp ;
                 If (Trim(sPromAsoc)<>    '')Then sSQLICRE := sSQLICRE + ' AND CTO.ID_PERS_ASOCIAD   = '+ sPromAsoc;
                 If (Trim(sPromAdm)<>     '')Then sSQLICRE := sSQLICRE + ' AND CR.ID_PROM_ADM        = '+ sPromAdm ;
                 If (Trim(sGpoEconomico)<>'')Then sSQLICRE := sSQLICRE + ' AND CA.CVE_GRUPO_ECO      = '+ SQLStr( sGpoEconomico );
                 If (Trim(sProducto)<>    '')Then sSQLICRE := sSQLICRE + ' AND CCTO.CVE_PRODUCTO_CRE = '+ SQLStr( sProducto );
                 If (Trim(sGpoProd)<>     '')Then sSQLICRE := sSQLICRE + ' AND CPP.CVE_PRODUCTO_GPO  = '+ SQLStr( sGpoProd );

    //CONCULTA GENERAL
    sSQL:= 
           'SELECT /*+ CHOOSE */* FROM  ( ' + coCRLF +
            sSQLICRE + coCRLF +
           ' UNION ' + coCRLF +
            sSQLINTER + coCRLF +
           '        ) WHERE 1 = 1 ';
           If sDiasImp Then
           sSQL:= sSQL + ' AND  DIAS_VDOS > 0  ' + coCRLF ;

    sSQL:= sSQL +
           ' ORDER BY CVE_MONEDA, NOMBRE, ID_CREDITO, F_OPERACION, ORD ' +coCRLF;

   Result:= sSQL;
End;

procedure TQrEdoMovto.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
      If Trim(sArchivo)<>'' Then Begin
         Writeln(F,
                  qyEdoMovto.FieldByName('CVE_MONEDA').AsString + #09 +
                  qyEdoMovto.FieldByName('DESC_MONEDA').AsString + #09 +
                  qyEdoMovto.FieldByName('ID_PERSONA').AsString + #09 +
                  qyEdoMovto.FieldByName('NOMBRE').AsString + #09 +
                  FormatDateTime('dd/mm/yyyy',qyEdoMovto.FieldByName('F_OPERACION').AsDateTime) + #09+
                  qyEdoMovto.FieldByName('TX_NOTA').AsString + #09 +
                  qyEdoMovto.FieldByName('ID_CREDITO').AsString + #09 +
                  qyEdoMovto.FieldByName('ID_PERIODO').AsString + #09 +
                  FormatDateTime('dd/mm/yyyy',qyEdoMovto.FieldByName('F_INICIO').AsDateTime) + #09+
                  FormatDateTime('dd/mm/yyyy',qyEdoMovto.FieldByName('F_VENCIMIENTO').AsDateTime) + #09+
                  FormatDateTime('dd/mm/yyyy',qyEdoMovto.FieldByName('F_PROG_PAGO').AsDateTime) + #09+
                  FormatDateTime('dd/mm/yyyy',qyEdoMovto.FieldByName('F_PAGO').AsDateTime) + #09+
                  qyEdoMovto.FieldByName('DIAS_VDOS').AsString + #09 +
                  FormatFloat('###,###,###,###,##0.00',qyEdoMovto.FieldByName('IMP_CAPITAL').AsFloat) + #09+
                  FormatFloat('###0.0000',qyEdoMovto.FieldByName('TASA_APLICADA').AsFloat) + #09+
                  qyEdoMovto.FieldByName('DIAS_DEV').AsString + #09 +
                  FormatFloat('###,###,###,###,##0.00',qyEdoMovto.FieldByName('FINADIC').AsFloat) + #09+
                  FormatFloat('###,###,###,###,##0.00',qyEdoMovto.FieldByName('IMP_INTERES').AsFloat) + #09+
                  FormatFloat('###,###,###,###,##0.00',qyEdoMovto.FieldByName('IVAINT').AsFloat) + #09+
                  FormatFloat('###,###,###,###,##0.00',qyEdoMovto.FieldByName('IMP_MOR').AsFloat) + #09+
                  FormatFloat('###,###,###,###,##0.00',qyEdoMovto.FieldByName('MOR_IVA').AsFloat) + #09+
                  FormatFloat('###,###,###,###,##0.00',qyEdoMovto.FieldByName('PAGOCP').AsFloat) + #09+
                  FormatFloat('###,###,###,###,##0.00',qyEdoMovto.FieldByName('PAGOFN').AsFloat) + #09+
                  FormatFloat('###,###,###,###,##0.00',qyEdoMovto.FieldByName('PAGOIN').AsFloat) + #09+
                  FormatFloat('###,###,###,###,##0.00',qyEdoMovto.FieldByName('PAGIVAIN').AsFloat) + #09+
                  FormatFloat('###,###,###,###,##0.00',qyEdoMovto.FieldByName('PAGOMOR').AsFloat) + #09+
                  FormatFloat('###,###,###,###,##0.00',qyEdoMovto.FieldByName('PAGIVAMOR').AsFloat) + #09+
                  FormatFloat('###,###,###,###,##0.00',qyEdoMovto.FieldByName('PAGOCN').AsFloat));
      End;

end;

procedure TQrEdoMovto.qrfCREDITOBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var vlSql, vlSdoInsol, vlSdoVdo : String;
    Qry : TQuery;
begin
      vlSdoInsol := '0';
      vlSdoVdo   := '0';
      vlSql := ' SELECT SDO_INSOLUTO, ( SDO_VDO_CAP + SDO_VDO_INT ) SDO_VDO FROM CRE_RESUMEN ' + coCRLF +
               ' WHERE ID_CREDITO =  ' + qyEdoMovtoID_CREDITO.AsString + coCRLF +
               '   AND F_RESUMEN IN ( SELECT MAX(F_RESUMEN) FROM CRE_RESUMEN WHERE ID_CREDITO = ' + qyEdoMovtoID_CREDITO.AsString + ' ) ' ;

      Qry := GetSQLQueryNoNil( vlSql, Apli.DataBaseName, Apli.SessionName, False );
      //
      if Assigned(Qry) and not( Qry.IsEmpty ) then
      begin
        while not Qry.Eof do
        begin
          vlSdoInsol := Qry.FieldByName('SDO_INSOLUTO').AsString;
          vlSdoVdo   := Qry.FieldByName('SDO_VDO').AsString;
          Qry.Next;
        end;//ends_if
      end;
      if Assigned(Qry) then
      begin
        Qry.Close;
        Qry.Free;
      end;


      IF vlSdoInsol = '' THEN
         vlSdoInsol := '0';

      qrlESDO_INSOLUTO.Caption:= 'Saldo Insoluto al ' + sF_FIN;
      qrlSDO_INSOLUTO.Caption:= FormatFloat('###,###,###,###,##0.00',StrToFloat(vlSdoInsol));

      qrlESDO_VDO.Caption:= 'Saldo Vencido al ' + sF_FIN;
      qrlSDO_VENCIDO.Caption:= FormatFloat('###,###,###,###,##0.00',StrToFloat(vlSdoVdo));

      If Trim(sArchivo)<>'' Then Begin
         Writeln(F, #09#09#09##09+
                  qrlESDO_INSOLUTO.Caption + #09+
                  qrlSDO_INSOLUTO.Caption + #09#09#09#09#09#09+
                  qrlESDO_VDO.Caption + #09+
                  qrlSDO_VENCIDO.Caption
                );
      end;

end;

End.
