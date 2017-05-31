unit IntMQREdoCC;
            
interface         

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
  IntHead, InterApl,
  IntQRPreview,QRPrntr, Printers, IntGenCre, UnSQL2,IntCrEditor;

type       
  TQREdoCC = class(TQuickRep)
    GrpContrato: TQRGroup;
    QRGroup2: TQRGroup;
    BandaDetalle: TQRBand;
    GrpDetalle: TQRGroup;
    lb_titulo1: TQRLabel;
    qrlPeriodo: TQRLabel;
    lbTitulo2: TQRLabel;
    lbTitulo3: TQRLabel;
    lbTitulo4: TQRLabel;
    lbTitulo5: TQRLabel;
    lbTitulo6: TQRLabel;
    lbTitulo7: TQRLabel;
    lbTitulo8: TQRLabel;
    lbTitulo9: TQRLabel;
    qrTituloSegmento: TQRLabel;
    qyQuery: TQuery;
    dt_dato1: TQRDBText;                                              
    dt_dato2: TQRDBText;
    dt_Dato3: TQRDBText;
    dt_dato4: TQRDBText;
    dt_dato5: TQRDBText;
    dt_dato8: TQRDBText;
    dt_dato9: TQRDBText;
    dt_dato11: TQRDBText;
    dt_dato12: TQRDBText;
    GrpPieDetalle: TQRBand;
    totMORAS: TQRExpr;
    dt_Dato10: TQRDBText;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    lbTitulo10: TQRLabel;
    lbtitulo11: TQRLabel;
    lbTitulo12: TQRLabel;
    Linea1: TQRShape;
    GrpPieContrato: TQRBand;
    qyQueryESTATUS: TFloatField;
    qyQueryCONCEPTO: TFloatField;
    qyQueryF_AUT_COMITE: TDateTimeField;
    qyQueryIMP_AUTORIZADO: TFloatField;
    qyQueryF_VEN_CONT: TDateTimeField;
    qyQueryCVE_TASA_REFER: TStringField;
    qyQueryOPERADOR_STASA: TStringField;
    qyQuerySOBRETASACONT: TFloatField;
    qyQueryFACT_MORAS: TFloatField;
    qyQueryNOMBRE: TStringField;
    qyQueryID_CONTRATO: TFloatField;
    qyQueryID_CREDITO: TFloatField;
    qyQueryIDENTIFICADOR: TStringField;
    qyQueryF_INICIO: TDateTimeField;
    qyQueryPLAZO: TFloatField;
    qyQueryF_VENCIMIENTO: TDateTimeField;
    qyQueryTASA_BASE: TFloatField;
    qyQuerySOBRETASA: TFloatField;
    qyQueryTASA_FINAL: TFloatField;
    qyQueryF_PAGO: TDateTimeField;
    qyQueryIMPORTE: TFloatField;
    qyQueryIVA: TFloatField;
    qyQueryIMP_MORA: TFloatField;
    qyQueryIMP_IVA_MORA: TFloatField;
    qyQueryNUM_PERIODO: TFloatField;
    qyQueryIMP_MORATORIO: TFloatField;
    qyQueryIMP_MORA_IMP: TFloatField;
    qyQueryIMP_PAG_MORAS: TFloatField;
    qyQueryIMP_IVA_MORA_IMP: TFloatField;
    ChildBand1: TQRChildBand;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape1: TQRShape;
    QRLabel9: TQRLabel;
    dt_dato6: TQRDBText;
    dt_dato7: TQRDBText;
    QRShape6: TQRShape;
    totIMPORTE: TQRExpr;
    ChildBand2: TQRChildBand;
    QRLabel10: TQRLabel;
    ChildBand3: TQRChildBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    ChildBand4: TQRChildBand;
    QRLabel11: TQRLabel;
    ChildBand5: TQRChildBand;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    qyQueryCAPITAL: TFloatField;
    qyQueryFINADIC: TFloatField;
    qyQueryINTERES: TFloatField;
    qyQueryCONCEPTOS: TFloatField;
    qyQueryMORATORIOS: TFloatField;
    qyQueryIVAS: TFloatField;
    qyQueryOTROS: TFloatField;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel12: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    ChildBand6: TQRChildBand;
    QRShape2: TQRShape;
    ChildBand7: TQRChildBand;
    qyQueryIMP_DEPOSITO: TFloatField;
    qyQueryF_OPERACION: TDateTimeField;
    qrlCapDispuesto: TQRLabel;
    qrlTotCapital: TQRLabel;
    QRShape3: TQRShape;
    qrlTotFinadic: TQRLabel;
    qrlTotIntereses: TQRLabel;
    qrlTotConceptos: TQRLabel;
    qrlTotMoratorios: TQRLabel;
    qrlTotIVAS: TQRLabel;
    ChildBand8: TQRChildBand;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    ChildBand9: TQRChildBand;
    qrlCONCEPTOS: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    ChildBand10: TQRChildBand;
    QRShape10: TQRShape;
    qrlTotConcepto: TQRLabel;
    qrlTotMoraCon: TQRLabel;
    qrlTotMorIvaCon: TQRLabel;
    ChildBand11: TQRChildBand;
    QRLabel1: TQRLabel;
    qrlFechaFirma: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    qrlIntOrdPact: TQRLabel;
    QRLabel4: TQRLabel;
    qrlFactorMoras: TQRLabel;
    QRLabel5: TQRLabel;
    qrlFechaVenc: TQRLabel;
    qrlTotIvaCo: TQRLabel;
    QRShape5: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape4: TQRShape;
    PageFooterBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRLabel44: TQRLabel;
    QRDBText18: TQRDBText;
    ChildBand12: TQRChildBand;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRShape13: TQRShape;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;

    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    qyQueryANIO: TStringField;
    qyQueryCAPITAL_AD: TFloatField;
    qyQueryFINADIC_AD: TFloatField;
    qyQueryINTERES_AD: TFloatField;
    qyQueryCONCEPTOS_AD: TFloatField;
    qyQueryMORATORIOS_AD: TFloatField;
    qyQueryIVAS_AD: TFloatField;
    QRExpr2: TQRExpr;
    qryConsulta1: TQuery;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel30: TQRLabel;
    qrlCAPvig: TQRLabel;
    qrlCapVdo: TQRLabel;
    qrlCapMor: TQRLabel;
    qrlFAVIG: TQRLabel;
    qrlFAVdo: TQRLabel;
    qrlFAMor: TQRLabel;
    qrlINTVig: TQRLabel;
    qrlINTVdo: TQRLabel;
    qrlCONVig: TQRLabel;
    qrlCONVdo: TQRLabel;
    qrlCONMor: TQRLabel;
    QRShape14: TQRShape;
    QRLabel13: TQRLabel;
    ChildBand13: TQRChildBand;
    qrlTotCapAd: TQRLabel;
    qrlTotFinadicAD: TQRLabel;
    qrlTotInteresAD: TQRLabel;
    qrlTotConceptosAd: TQRLabel;
    qrtTotADEUDO: TQRLabel;
    qrlTotMoratoriosAd: TQRLabel;
    QRShape15: TQRShape;
    QRDBText30: TQRDBText;
    qyQueryTASA_BASE_AD: TFloatField;
    qyQuerySOBRETASA_AD: TFloatField;
    qyQueryTASA_FINAL_AD: TFloatField;
    qyQueryTASA_MORA_AD: TFloatField;
    QRLabel57: TQRLabel;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    qyQueryF_INI_PER: TDateTimeField;
    qyQueryF_VEN_PER: TDateTimeField;
    QRLabel36: TQRLabel;
    ChildBand14: TQRChildBand;
    Realizo: TQRLabel;
    QRShape7: TQRShape;
    Cedula: TQRLabel;
    reEncabezado: TQRRichText;
    repieDocumento: TQRRichText;
    QRDBText34: TQRDBText;
    QRLabel40: TQRLabel;
    qrlTotIvaAd: TQRLabel;
    qrlTotConLetra: TQRLabel;
    qyQueryMONEDA_AD: TFloatField;
    QRLabel58: TQRLabel;
    QRLabel31: TQRLabel;
    qrTotalAdeudo: TQRLabel;
    QRShape16: TQRShape;
    QRLabel59: TQRLabel;
    qrlCONVdoIVA: TQRLabel;
    qrlCONVigIVA: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel60: TQRLabel;
    qrlINTVigIva: TQRLabel;
    QRLabel63: TQRLabel;
    qrlINTVdoIva: TQRLabel;
    qrlImportConcedido: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel64: TQRLabel;
    qrlFAMorIVA: TQRLabel;
    qrlCapMorIVA: TQRLabel;
    QRLabel65: TQRLabel;
    qrlCONMorIVA: TQRLabel;
    procedure GrpDetalleBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure BandaDetalleBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure GrpContratoAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure ChildBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure GrpPieDetalleBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure BandaDetalleAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure bandadetalle2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure GrpContratoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand6BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand7BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand3AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure ChildBand5AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure ChildBand8BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand9BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand10BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand12BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand13BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand12AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
     APli : TInterApli;
     VLMsg: String;

  public
//     Function FormaQuery(sFCorte,vlCondicion,sEncabezado,sFinDocto,vlorden:String):String;
  end;

var
  QREdoCC: TQREdoCC;
  TotCapVig,TotCapVdo,TotCapMor,TotCapMorIVA, TotFAVig,TotFAVdo,TotFAMor, TotFAMorIVA, TotIntVig,TotIntVdo,TotIntMor,TotIvaIntVdo, TotIvaIntVig,
  TotCoPag,TotIvaCoPag,TotCoMoraPag,TotCoIvaMoraPag,
  TotCoVig,TotIvaCoVig,TotCoMoraVig,TotCoIvaMOraVig,
  TotCoVdo,TotIvaCoVdo,TotCoMoraVdo,TotCoIvaMoraVdo,
  TotCoMor,TotCOIvaMor:Real;
  TotCapDisp,  TotCapital, TotFinadic, TotIntereses,TotConceptos,TotMoratorios,TotIvas:Real;
  TotConPAg1,TotConVen1,TotConVig1:Real;
  TotCapAD,TotFINADICAD,TotInteresad,TotConceptosAd,TotMoratoriosAd,TotIVaAD,TotAdeudo:Real;

  vgFFirmoContrato, vgImpCredConced ,
  vgIntOrdPact    , vgIntMoraPact ,
  vgFecVenCont : String;


  Function FormaQuery(sFCorte,vlCondicion,sEncabezado,sFinDocto,vlorden:String):String;
  Function  RepEdoCtaC( sFCorte,sTitular,sCredito,sContrato, sEncabezado,sFinDocto,sREalizo,sCedula,
                        peFFirmoContrato,peImpCredConced,peIntOrdPact,PeIntMoraPact,peFecVenCont:String;
                     pAPli : TInterApli; pPreview  : Boolean;iOrden:integer) : String;
  Function ArmaCadena(pAPli : TInterApli;sTitular,sContrato:String):String;


  implementation


{$R *.DFM}
Function ArmaCadena(pAPli : TInterApli;sTitular,sContrato:String):String;
    Var vlcondicion,cadena,sSql:String;
        i:integer;
    Begin
      with qrEdocc do
      Begin
                  APli:= pAPli;
                  qryConsulta1.DatabaseName := pApli.DataBaseName;
                  qryConsulta1.SessionName := pApli.SessionName;
                  qryConsulta1.Active:=False;

                 If sTitular <> ''
                 then vlCondicion := ' AND CC.ID_TITULAR='+sTitular;

                 If scontrato <> ''
                 then vlCondicion := ' AND CC.ID_CONTRATO='+sContrato;

                 sSql:=
                ' select DISTINCT id_credito ' +
                ' from cr_credito ccr, contrato cc' +
                ' where ccr.id_contrato=cc.id_contrato ' +
                ' AND sit_credito not in (''CA'') ' +
                ' AND SIT_CONTRATO NOT IN (''CA'') '  + vlCondicion;

                qryConsulta1.SQL.Text:=sSql;
                qryConsulta1.Active:=true;

                qryConsulta1.first;
                Cadena:='';
                i:=1;
                while not qryConsulta1.eof do
                Begin
                   if i>1 then Cadena:=Cadena+', ';
                    Cadena:=Cadena+qryConsulta1.fieldbyname('id_credito').asString;
                   qryConsulta1.next;
                   inc(i);
                end;
                if Cadena <> '' then  Cadena:=' AND CCRE.ID_CREDITO IN ('+Cadena+') ';
                qryConsulta1.close;
      end;
      Result:=Cadena;
    End;


  Function  RepEdoCtaC( sFCorte,sTitular,sCredito,sContrato, sEncabezado,sFinDocto,sRealizo,sCedula,
                        peFFirmoContrato,peImpCredConced,peIntOrdPact,PeIntMoraPact,peFecVenCont:String;
                     pAPli : TInterApli; pPreview : Boolean; iOrden:integer) : String;
  Var
    QrEdoCC : TQREdoCC;
    VLTitulo : String;
    Preview  : TIntQRPreview;
    Parte1,VLMsg, vlCondicion,vlOrden    : String;
    // datos del encabezado



  Begin
    VLMsg  := 'Edo Cta Crédito: '  + sCredito + ' NO SE PUEDE GENERAR';

    vgFFirmoContrato:=peFFirmoContrato;
    vgImpCredConced :=peImpCredConced;
    vgIntOrdPact    :=peIntOrdPact;
    vgIntMoraPact   :=peIntMoraPact;
    vgFecVenCont    :=peFecVenCont;


    If iOrden=0
    Then vlOrden:=' f_vencimiento,ID_CREDITO  '
    Else vlorden:=' ID_CREDITO, f_vencimiento ';
    QrEdoCC:=TQREdoCC.Create(Nil);
    Preview := TIntQRPreview.CreatePreview(Application, QREdoCC);
    Try
        QrEdoCC.VLMsg := 'OK';
        QrEdoCC.APli:= pAPli;
        QrEdoCC.qyQuery.DatabaseName := pApli.DataBaseName;
        QrEdoCC.qyQuery.SessionName := pApli.SessionName;
        QrEdoCC.qyQuery.Active:=False;



        if sCredito <> ''
        then vlCondicion:=' AND CCRE.ID_CREDITO='+sCredito+' '
        else vlCondicion:=ArmaCadena(pApli,sTitular,sContrato);

        If vlCondicion <> ''
        then
        Begin
        QrEdoCC.qyQuery.SQL.Text:= FormaQuery(sFCorte,vlCondicion,sEncabezado,sFinDocto,vlorden);

        QrEdoCC.qyQuery.SQL.SaveToFile('c:\EdoCtaCT.txt');
        QrEdoCC.qyQuery.Active:=True;

        // para las letras

        {
        qrEdoCC.reEncabezado.ParentRichEdit:=FrmEditor.Editor;
        qrEdoCC.repieDocumento.ParentRichEdit:=FrmEditor.Editor2;
           }
        qrEdoCC.reEncabezado.ParentRichEdit:=FrmEditor.Editor;
        qrEdoCC.repieDocumento.ParentRichEdit:=FrmEditor.Editor2;

        QrEdoCC.Realizo.Caption:=sRealizo;
        QrEdoCC.Cedula.Caption:='CEDULA PROFESIONAL No. ' +sCedula;

        VLMsg  := 'Edo Cta Certificado: '  + sCredito + ' OK ';

        QrEdoCC.Prepare;
        QrEdoCC.qrlabel36.caption:=' de '+IntToStr(QrEdoCC.QRPrinter.PageCount);



        If pPreview Then
            QrEdoCC.Preview
        Else
            QrEdoCC.Print;

        if QrEdoCC.VLMsg <> 'OK' then
           VLMsg := QrEdoCC.VLMsg
        //end if;
       end
       else VLMsg:='No hay datos';
    Finally
        QrEdoCC.free;
    End;
    RepEdoCtaC := VLMsg;
  End;

Function   FormaQuery(sFCorte,vlCondicion,sEncabezado,sFinDocto,vlorden:String):String;
Var sSQL, vlF_Corte:String;

Begin

vlF_Corte:=' TO_DATE('''+sFCorte+''' ,''DD/MM/YYYY'' ) ';


          sSql:=
'  SELECT XXX.*   '+ coCRLF +
'  FROM   '+ coCRLF +
'  (   '+ coCRLF +
'  SELECT Decode(Substr(IDENTIFICADOR,3,2),''PA'',1,Decode(Substr(Identificador,3,2) ,''VD'',2,3)) ESTATUS,   '+ coCRLF +
'  Decode(Substr(IDENTIFICADOR,1,2),''FA'',1, Decode(Substr(Identificador,1,2) ,''IN'',2,Decode(Substr(Identificador,1,2) ,''CA'',3,4))) CONCEPTO,   '+ coCRLF +
'  null F_AUT_COMITE,   '+ coCRLF +
'  0 IMP_AUTORIZADO,  '+ coCRLF +
'  NULL F_VEN_CONT,   '+ coCRLF +
'  NULL CVE_TASA_REFER,   '+ coCRLF +
'  NULL OPERADOR_STASA,   '+ coCRLF +
'  0 SOBRETASACONT,   '+ coCRLF +
'  0 FACT_MORAS,   '+ coCRLF +
'  NULL NOMBRE,   '+ coCRLF +
'  CTOD.* , '+ coCRLF +
'    0 IMP_DEPOSITO, '+ coCRLF +
'    NULL  F_OPERACION, '+ coCRLF +
'    0 CAPITAL,'+ coCRLF +
'    0 FINADIC,'+ coCRLF +
'    0 INTERES,'+ coCRLF +
'    0 CONCEPTOS,'+ coCRLF +
'    0 MORATORIOS,'+ coCRLF +
'    0 IVAS,'+ coCRLF +
'    0 OTROS, '+ coCRLF +
'  NULL ANIO, NULL F_INI_PER, NULL F_VEN_PER, 0 CAPITAL_AD, 0 FINADIC_AD ,0 INTERES_AD, 0 CONCEPTOS_AD, 0 MORATORIOS_AD, 0 IVAS_AD, '+ coCRLF +
'  0 tasa_base_ad, 0 sobretasa_ad, 0 tasa_final_ad, 0 Tasa_Mora_Ad, 0 MONEDA_AD '+ coCRLF +
'  FROM     '+ coCRLF +
'  (   '+ coCRLF +
'  SELECT ID_CONTRATO,ID_CREDITO,IDENTIFICADOR,   '+ coCRLF +
'  F_INICIO, PLAZO, F_VENCIMIENTO,TASA_BASE,SOBRETASA, TASA_FINAL,   '+ coCRLF +
'  F_PAGO, IMPORTE, IVA,   '+ coCRLF +
'  CASE WHEN IDENTIFICADOR =''CAPA''   '+ coCRLF +
'            THEN  CASE   '+ coCRLF +
'  		        WHEN F_VENCIMIENTO < ' +vlF_CORTE+ coCRLF +
'  		         THEN 0   '+ coCRLF +
'  				END    '+ coCRLF +
//'  		  ELSE IMP_MORA_IMP-IMP_PAG_MORAS     '+ coCRLF +
'  		  ELSE IMP_MORA_IMP                   '+ coCRLF +
'   END AS IMP_MORA,   '+ coCRLF +
'  CASE WHEN IDENTIFICADOR =''CAPA''   '+ coCRLF +
'            THEN  CASE   '+ coCRLF +
' 		        WHEN F_VENCIMIENTO < ' +vlF_CORTE+ coCRLF +
'  		         THEN 0   '+ coCRLF +
'  				END    '+ coCRLF +
//'  		  ELSE IMP_IVA_MORA-IVA_PAG_MORAS   '+ coCRLF + //HERJA
'                 ELSE IMP_IVA_MORA_IMP '+ coCRLF +  //HERJA
'   END AS IMP_IVA_MORA,     '+ coCRLF +
'  NUM_PERIODO,IMP_MORATORIO, IMP_MORA_IMP,IMP_PAG_MORAS, IMP_IVA_MORA_IMP   '+ coCRLF +
'  FROM (   '+ coCRLF +
'  select CCA.*,   '+ coCRLF +
//'  		CASE  WHEN IMP_PAGADO>0    '+ coCRLF +  //HERJA
'  		CASE  WHEN ((SIT_CAPITAL IN (''LQ''))AND(IMP_CAPITAL>0)) OR ((SIT_CAPITAL NOT IN (''LQ''))AND(IMP_PAGADO>0))  '+ coCRLF +  //HERJA
'  		 THEN ''CAPA''    '+ coCRLF +
'  		 ELSE ''X''    '+ coCRLF +
'  		END AS IDENTIFICADOR,   '+ coCRLF +
'  		IMP_PAGADO AS IMPORTE   '+ coCRLF +
'  		from (   '+ coCRLF +
//'  				SELECT CCRE.ID_CONTRATO,CCAP.ID_CREDITO,NUM_PERIODO,CCAP.F_VENCIMIENTO-PLAZO AS F_INICIO, CCAP.F_VENCIMIENTO, PLAZO,   '+ coCRLF +
'  				SELECT CCRE.ID_CONTRATO,CCAP.ID_CREDITO,NUM_PERIODO,CASE WHEN CCAP.NUM_PERIODO<>1 then  CCAP.F_VENCIMIENTO- CCAP.PLAZO +1 ELSE CCAP.F_VENCIMIENTO- CCAP.PLAZO END AS F_INICIO, CCAP.F_VENCIMIENTO, PLAZO,   '+ coCRLF +
'  				PKGCRCOMUN.FUNOBTENTASA(''CP'',CCAP.ID_CREDITO, NUM_PERIODO, CCAP.F_VENCIMIENTO-1 )  -SOBRETASA TASA_BASE,   '+ coCRLF +
'  				SOBRETASA AS SOBRETASA,   '+ coCRLF +
'  				PKGCRCOMUN.FUNOBTENTASA(''CP'',CCAP.ID_CREDITO, NUM_PERIODO, CCAP.F_VENCIMIENTO-1 )  TASA_FINAL,   '+ coCRLF +
'  				Imp_Capital,   '+ coCRLF +
'  				PKGCRCOMUN.STPOBTIMPPAGADO(''CP'',''IMPBRU'',CCAP.ID_CREDITO,NUM_PERIODO,NULL,   ' +vlF_CORTE+' ,''V'') AS Imp_Pagado,   '+ coCRLF +
'  				 F_PAGO,    '+ coCRLF +
'  				 0 AS IVA,    '+ coCRLF +
'  				 IMP_MORATORIO,    '+ coCRLF +
'  				 IMP_IVA_MORA,     '+ coCRLF +
'  				 PKGCRPERIODO.FUNOBTENMORA(1,''V'',CCAP.ID_CREDITO, NUM_PERIODO,null,null,   ' +vlF_CORTE+' ,NULL) IMP_MORA_IMP,   '+ coCRLF +
'  				 PKGCRPERIODO.FUNOBTENMORA(1,NULL,CCAP.ID_CREDITO, NUM_PERIODO,null,null,   ' +vlF_CORTE+' ,null) IMP_IVA_MORA_IMP,   '+ coCRLF +
'  				 PKGCRCOMUN.STPOBTIMPPAGADO(''CP'',''IMPMOR'',CCAP.ID_CREDITO,NUM_PERIODO,NULL,   ' +vlF_CORTE+'  ,''V'') AS Imp_Pag_Moras,   '+ coCRLF +
'  				 PKGCRCOMUN.STPOBTIMPPAGADO(''CP'',''IVAMOR'',CCAP.ID_CREDITO,NUM_PERIODO,NULL,   ' +vlF_CORTE+' ,''V'') AS IVA_Pag_Moras   '+ coCRLF +
'                                ,SIT_CAPITAL '+ coCRLF + //HERJA
'  				FROM CR_CAPITAL CCAP, CR_CREDITO CCRE, CONTRATO C, PERSONA P    '+ coCRLF +
' 	                	WHERE SIT_CAPITAL <> ''CA''    '+ coCRLF +
'  				AND CCAP.ID_CREDITO=CCRE.ID_CREDITO   '+ coCRLF +
'  				AND CCRE.ID_CONTRATO=C.ID_CONTRATO   '+ coCRLF +
'  				AND C.ID_TITULAR=P.ID_PERSONA   '+ coCRLF +
'  			        '+vlCondicion+'    '+ coCRLF +
'  				) CCA   '+ coCRLF +
'  UNION		   '+ coCRLF +
'  select CCAV.*,   '+ coCRLF +
//'  	    CASE WHEN (F_VENCIMIENTO<  ' +vlF_CORTE+'  ) and ( Imp_CAPITAL>Imp_pagado )    '+ coCRLF + //HERJA
'  	    CASE WHEN (F_VENCIMIENTO<  ' +vlF_CORTE+'  ) AND ( SIT_CAPITAL IN (''IM'') )  '+ coCRLF + //HEJA
'          THEN ''CAVD''    '+ coCRLF +
'  	    ELSE ''X''   '+ coCRLF +
'  		END AS IDENTIFICADOR,   '+ coCRLF +
//'  		Imp_CAPITAL-IMP_PAGADO AS IMPORTE   '+ coCRLF +
'  		Imp_CAPITAL-IMP_PAGADO + NVL(CA_HIST_PGDMCP.IMP_HIST_PGDMCP,0) AS IMPORTE   '+ coCRLF +  //HERJA ENERO 2013
'  		from (   '+ coCRLF +
'  				SELECT CCRE.ID_CONTRATO,CCAP.ID_CREDITO,NUM_PERIODO,CASE WHEN CCAP.NUM_PERIODO<>1 then  CCAP.F_VENCIMIENTO- CCAP.PLAZO +1 ELSE CCAP.F_VENCIMIENTO- CCAP.PLAZO END AS F_INICIO, CCAP.F_VENCIMIENTO, PLAZO,   '+ coCRLF +
'  				PKGCRCOMUN.FUNOBTENTASA(''CP'',CCAP.ID_CREDITO, NUM_PERIODO, CCAP.F_VENCIMIENTO-1 )  -SOBRETASA TASA_BASE,   '+ coCRLF +
'  				SOBRETASA AS SOBRETASA,   '+ coCRLF +
'  				PKGCRCOMUN.FUNOBTENTASA(''CP'',CCAP.ID_CREDITO, NUM_PERIODO, CCAP.F_VENCIMIENTO-1 )  AS TASA_FINAL,    '+ coCRLF +
'  				Imp_Capital,   '+ coCRLF +
'  				PKGCRCOMUN.STPOBTIMPPAGADO(''CP'',''IMPBRU'',CCAP.ID_CREDITO,NUM_PERIODO,NULL,   ' +vlF_CORTE+'  ,''V'') AS Imp_Pagado,   '+ coCRLF +
'  				 F_PAGO,    '+ coCRLF +
'  				 0 AS IVA,    '+ coCRLF +
'  				 IMP_MORATORIO,    '+ coCRLF +
'  				 IMP_IVA_MORA,     '+ coCRLF +
'  				 PKGCRPERIODO.FUNOBTENMORA(1,''V'',CCAP.ID_CREDITO, NUM_PERIODO,null,null,   ' +vlF_CORTE+'  ,NULL) IMP_MORA_IMP,   '+ coCRLF +
'  				 PKGCRPERIODO.FUNOBTENMORA(1,NULL,CCAP.ID_CREDITO, NUM_PERIODO,null,null,   ' +vlF_CORTE+'  ,null) IMP_IVA_MORA_IMP,   '+ coCRLF +
'  				 PKGCRCOMUN.STPOBTIMPPAGADO(''CP'',''IMPMOR'',CCAP.ID_CREDITO,NUM_PERIODO,NULL,   ' +vlF_CORTE+'  ,''V'') AS Imp_Pag_Moras,   '+ coCRLF +
'  				 PKGCRCOMUN.STPOBTIMPPAGADO(''CP'',''IVAMOR'',CCAP.ID_CREDITO,NUM_PERIODO,NULL,   ' +vlF_CORTE+'  ,''V'') AS IVA_Pag_Moras   '+ coCRLF +
'                                ,SIT_CAPITAL '+ coCRLF + //HERJA
'  				FROM CR_CAPITAL CCAP, CR_CREDITO CCRE, CONTRATO C, PERSONA P    '+ coCRLF +
' 	                	WHERE SIT_CAPITAL <> ''CA''    '+ coCRLF +
'  				AND CCAP.ID_CREDITO=CCRE.ID_CREDITO   '+ coCRLF +
'  				AND CCRE.ID_CONTRATO=C.ID_CONTRATO   '+ coCRLF +
'  				AND C.ID_TITULAR=P.ID_PERSONA   '+ coCRLF +
'  			        '+vlCondicion+'    '+ coCRLF +
'  				) CCAV	   '+ coCRLF +
//HERJA ENERO 2013
'				,( '+ coCRLF +
'				   SELECT CT.ID_CREDITO, CT.ID_PERIODO, '+ coCRLF +
'				          NVL(SUM(CDT.IMP_CONCEPTO),0) AS IMP_HIST_PGDMCP '+ coCRLF +
'				     FROM CR_TRANSACCION CT, CR_DET_TRANSAC CDT '+ coCRLF +
'				    WHERE 1=1 '+ coCRLF +
'				      AND CT.SIT_TRANSACCION = ''AC'' '+ coCRLF +
'				      AND CT.ID_TRANS_CANCELA IS NULL '+ coCRLF +
'				      AND CT.ID_TRANSACCION = CDT.ID_TRANSACCION '+ coCRLF +
'				      AND CT.CVE_OPERACION IN (''PGDMCP'') '+ coCRLF +
'				      AND CDT.CVE_CONCEPTO IN (''IMPBRU'') '+ coCRLF +
'				    GROUP BY CT.ID_CREDITO, CT.ID_PERIODO '+ coCRLF +
'				  ) CA_HIST_PGDMCP '+ coCRLF +
'			     WHERE 1=1 '+ coCRLF +
' 			       AND CA_HIST_PGDMCP.ID_CREDITO (+)= CCAV.ID_CREDITO '+ coCRLF +
'			       AND CA_HIST_PGDMCP.ID_PERIODO (+)= CCAV.NUM_PERIODO '+ coCRLF +
//FIN HERJA
'  UNION		   '+ coCRLF +
'  select CCAG.*,   '+ coCRLF +
//'  	    CASE WHEN (F_VENCIMIENTO>=  ' +vlF_CORTE+' ) and ( Imp_CAPITAL>Imp_pagado )    '+ coCRLF + //HERJA
'  	    CASE WHEN (F_VENCIMIENTO>=  ' +vlF_CORTE+' ) AND ( SIT_CAPITAL IN (''AC'',''PA'') )   '+ coCRLF + //HERJA
'          THEN ''CAVI''    '+ coCRLF +
'  	    ELSE ''X''   '+ coCRLF +
'  		END AS IDENTIFICADOR,   '+ coCRLF +
//'  		Imp_CAPITAL-IMP_PAGADO AS IMPORTE   '+ coCRLF +
'  		Imp_CAPITAL-IMP_PAGADO + NVL(CA_HIST_PGDMCP.IMP_HIST_PGDMCP,0) AS IMPORTE   '+ coCRLF + //HERJA ENERO 2013 
'  		from (   '+ coCRLF +
'  				SELECT CCRE.ID_CONTRATO,CCAP.ID_CREDITO,NUM_PERIODO,CASE WHEN CCAP.NUM_PERIODO<>1 then  CCAP.F_VENCIMIENTO- CCAP.PLAZO +1 ELSE CCAP.F_VENCIMIENTO- CCAP.PLAZO END AS F_INICIO, CCAP.F_VENCIMIENTO, PLAZO,   '+ coCRLF +
'   				PKGCRCOMUN.FUNOBTENTASA(''CP'',CCAP.ID_CREDITO, NUM_PERIODO, CCAP.F_VENCIMIENTO-1 )  -SOBRETASA TASA_BASE,   '+ coCRLF +
'  				SOBRETASA AS SOBRETASA,   '+ coCRLF +
'  				PKGCRCOMUN.FUNOBTENTASA(''CP'',CCAP.ID_CREDITO, NUM_PERIODO, CCAP.F_VENCIMIENTO-1 )  AS TASA_FINAL,    '+ coCRLF +
'  				Imp_Capital,   '+ coCRLF +
'  				PKGCRCOMUN.STPOBTIMPPAGADO(''CP'',''IMPBRU'',CCAP.ID_CREDITO,NUM_PERIODO,NULL,   ' +vlF_CORTE+'  ,''V'') AS Imp_Pagado,   '+ coCRLF +
'  				 F_PAGO,    '+ coCRLF +
'  				 0 AS IVA,    '+ coCRLF +
'  				 IMP_MORATORIO,    '+ coCRLF +
'  				 IMP_IVA_MORA,     '+ coCRLF +
'  				 PKGCRPERIODO.FUNOBTENMORA(1,''V'',CCAP.ID_CREDITO, NUM_PERIODO,null,null,   ' +vlF_CORTE+'  ,NULL) IMP_MORA_IMP,   '+ coCRLF +
'  				 PKGCRPERIODO.FUNOBTENMORA(1,NULL,CCAP.ID_CREDITO, NUM_PERIODO,null,null,   ' +vlF_CORTE+'  ,null) IMP_IVA_MORA_IMP,   '+ coCRLF +
'  				 PKGCRCOMUN.STPOBTIMPPAGADO(''CP'',''IMPMOR'',CCAP.ID_CREDITO,NUM_PERIODO,NULL,   ' +vlF_CORTE+' ,''V'') AS Imp_Pag_Moras,   '+ coCRLF +
'  				 PKGCRCOMUN.STPOBTIMPPAGADO(''CP'',''IVAMOR'',CCAP.ID_CREDITO,NUM_PERIODO,NULL,   ' +vlF_CORTE+' ,''V'') AS IVA_Pag_Moras   '+ coCRLF +
'                                ,SIT_CAPITAL '+ coCRLF + //HERJA
'  				FROM CR_CAPITAL CCAP, CR_CREDITO CCRE, CONTRATO C, PERSONA P    '+ coCRLF +
' 	                	WHERE SIT_CAPITAL <> ''CA''    '+ coCRLF +
'  				AND CCAP.ID_CREDITO=CCRE.ID_CREDITO   '+ coCRLF +
'  				AND CCRE.ID_CONTRATO=C.ID_CONTRATO   '+ coCRLF +
'  				AND C.ID_TITULAR=P.ID_PERSONA   '+ coCRLF +
'  			        '+vlCondicion+'    '+ coCRLF +
'  				)  CCAG   '+ coCRLF +
//HERJA ENERO 2013
'				,( '+ coCRLF +
'				   SELECT CT.ID_CREDITO, CT.ID_PERIODO, '+ coCRLF +
'				          NVL(SUM(CDT.IMP_CONCEPTO),0) AS IMP_HIST_PGDMCP '+ coCRLF +
'				     FROM CR_TRANSACCION CT, CR_DET_TRANSAC CDT '+ coCRLF +
'				    WHERE 1=1 '+ coCRLF +
'				      AND CT.SIT_TRANSACCION = ''AC'' '+ coCRLF +
'				      AND CT.ID_TRANS_CANCELA IS NULL '+ coCRLF +
'				      AND CT.ID_TRANSACCION = CDT.ID_TRANSACCION '+ coCRLF +
'				      AND CT.CVE_OPERACION IN (''PGDMCP'') '+ coCRLF +
'				      AND CDT.CVE_CONCEPTO IN (''IMPBRU'') '+ coCRLF +
'				    GROUP BY CT.ID_CREDITO, CT.ID_PERIODO '+ coCRLF +
'				  ) CA_HIST_PGDMCP '+ coCRLF +
'			     WHERE 1=1 '+ coCRLF +
' 			       AND CA_HIST_PGDMCP.ID_CREDITO (+)= CCAG.ID_CREDITO '+ coCRLF +
'			       AND CA_HIST_PGDMCP.ID_PERIODO (+)= CCAG.NUM_PERIODO '+ coCRLF +
//FIN HERJA
'  	) CCCA   '+ coCRLF +
'  WHERE IDENTIFICADOR <> ''X''   '+ coCRLF +
'  UNION   '+ coCRLF +
'  SELECT ID_CONTRATO,ID_CREDITO, IDENTIFICADOR,F_INICIO, PLAZO, F_VENCIMIENTO,TASA_BASE,SOBRETASA, TASA_FINAL,   '+ coCRLF +
'  F_PAGO, IMPORTE, IVA,   '+ coCRLF +
'  CASE WHEN IDENTIFICADOR =''FAPA''   '+ coCRLF +
'            THEN  CASE   '+ coCRLF +
'  		        WHEN F_VENCIMIENTO < ' +vlF_CORTE+ coCRLF +
'  		         THEN 0   '+ coCRLF +
'  				END    '+ coCRLF +
'  		  ELSE IMP_MORA_IMP '+ coCRLF +
'   END AS IMP_MORA,   '+ coCRLF +
'  CASE WHEN IDENTIFICADOR =''FAPA''   '+ coCRLF +
'            THEN  CASE   '+ coCRLF +
'  		        WHEN F_VENCIMIENTO < ' +vlF_CORTE+ coCRLF +
'  		         THEN 0   '+ coCRLF +
'  				END    '+ coCRLF +
//'  		  ELSE IMP_IVA_MORA-IVA_PAG_MORAS   '+ coCRLF + //HERJA
'  		  ELSE IMP_IVA_MORA_IMP   '+ coCRLF + //HERJA
'   END AS IMP_IVA_MORA,     '+ coCRLF +
'  NUM_PERIODO,IMP_MORATORIO, IMP_MORA_IMP,IMP_PAG_MORAS, IMP_IVA_MORA_IMP   '+ coCRLF +
'  FROM (   '+ coCRLF +
'  select CFA.*,   '+ coCRLF +
//'  		CASE  WHEN IMP_PAGADO>0    '+ coCRLF +  //HERJA
'  		CASE  WHEN ((SIT_FINAN_ADIC IN (''LQ''))AND(IMP_FINAN_ADIC>0)) OR ((SIT_FINAN_ADIC NOT IN (''LQ''))AND(IMP_PAGADO>0))  '+ coCRLF +  //HERJA
' 		 THEN ''FAPA''    '+ coCRLF +
'  		 ELSE ''X''    '+ coCRLF +
'  		END AS IDENTIFICADOR,   '+ coCRLF +
'  		IMP_PAGADO AS IMPORTE   '+ coCRLF +
'  		from (   '+ coCRLF +
'  		SELECT CCRE.ID_CONTRATO,CFAD.ID_CREDITO, NUM_PERIODO,CASE WHEN CFAD.NUM_PERIODO<>1 then  CFAD.F_VENCIMIENTO- CFAD.PLAZO +1 ELSE CFAD.F_VENCIMIENTO- CFAD.PLAZO END AS F_INICIO, CFAD.F_VENCIMIENTO, PLAZO,   '+ coCRLF +
'  		PKGCRCOMUN.FUNOBTENTASA(''FN'',CFAD.ID_CREDITO, NUM_PERIODO, CFAD.F_VENCIMIENTO-1 )  -SOBRETASA TASA_BASE,   '+ coCRLF +
'  		SOBRETASA AS SOBRETASA,   '+ coCRLF +
'  		PKGCRCOMUN.FUNOBTENTASA(''FN'',CFAD.ID_CREDITO, NUM_PERIODO, CFAD.F_VENCIMIENTO-1 )  AS TASA_FINAL,    '+ coCRLF +
'  		Imp_FINAN_aDIC,   '+ coCRLF +
'  		PKGCRCOMUN.STPOBTIMPPAGADO(''FN'',''IMPBRU'',CFAD.ID_CREDITO,NUM_PERIODO,NULL,   ' +vlF_CORTE+'  ,''V'') AS Imp_Pagado,   '+ coCRLF +
'  		 F_PAGO,    '+ coCRLF +
'  		 0 AS IVA,    '+ coCRLF +
'       	 IMP_MORATORIO,    '+ coCRLF +
'  		 IMP_IVA_MORA,      '+ coCRLF +
'  		 PKGCRPERIODO.FUNOBTENMORA(3,''V'',CFAD.ID_CREDITO, NUM_PERIODO,NULL,null,   ' +vlF_CORTE+'  ,null) IMP_MORA_IMP,   '+ coCRLF +
'  		 PKGCRPERIODO.FUNOBTENMORA(3,''F'',CFAD.ID_CREDITO, NUM_PERIODO,null,null,   ' +vlF_CORTE+'  ,null) IMP_IVA_MORA_IMP,   '+ coCRLF +
'  		 PKGCRCOMUN.STPOBTIMPPAGADO(''FN'',''IMPMOR'',CFAD.ID_CREDITO,NUM_PERIODO,NULL,   ' +vlF_CORTE+'  ,''V'') AS Imp_Pag_Moras,   '+ coCRLF +
'  		 PKGCRCOMUN.STPOBTIMPPAGADO(''FN'',''IVAMOR'',CFAD.ID_CREDITO,NUM_PERIODO,NULL,   ' +vlF_CORTE+'  ,''V'') AS IVA_Pag_Moras   '+ coCRLF +
'                ,SIT_FINAN_ADIC '+ coCRLF + //HERJA
'  		FROM CR_FINAN_ADIC CFAD, CR_CREDITO CCRE, CONTRATO C, PERSONA P    '+ coCRLF +
'  		WHERE SIT_FINAN_ADIC <> ''CA''   '+ coCRLF +
'  		AND CFAD.ID_CREDITO=CCRE.ID_CREDITO   '+ coCRLF +
'  		AND CCRE.ID_CONTRATO=C.ID_CONTRATO   '+ coCRLF +
'  		AND C.ID_TITULAR=P.ID_PERSONA   '+ coCRLF +
'  	        '+vlCondicion+'    '+ coCRLF +
'  		) CFA   '+ coCRLF +
'  UNION		   '+ coCRLF +
'  select CFAV.*,   '+ coCRLF +
//'  	    CASE WHEN (F_VENCIMIENTO<  ' +vlF_CORTE+'  ) and ( Imp_FINAN_aDIC>Imp_pagado )    '+ coCRLF +  //HERJA
'  	    CASE WHEN (F_VENCIMIENTO<  ' +vlF_CORTE+'  ) AND ( SIT_FINAN_ADIC IN (''IM'') )  '+ coCRLF +  //HERJA
'          THEN ''FAVD''    '+ coCRLF +
'  	    ELSE ''X''   '+ coCRLF +
'  		END AS IDENTIFICADOR,   '+ coCRLF +
'  		Imp_FINAN_aDIC-IMP_PAGADO AS IMPORTE   '+ coCRLF +
'  		from (   '+ coCRLF +
'  		SELECT CCRE.ID_CONTRATO,CFAD.ID_CREDITO, NUM_PERIODO,CASE WHEN CFAD.NUM_PERIODO<>1 then  CFAD.F_VENCIMIENTO- CFAD.PLAZO +1 ELSE CFAD.F_VENCIMIENTO- CFAD.PLAZO END AS F_INICIO, CFAD.F_VENCIMIENTO, PLAZO,   '+ coCRLF +
'  		PKGCRCOMUN.FUNOBTENTASA(''FN'',CFAD.ID_CREDITO, NUM_PERIODO, CFAD.F_VENCIMIENTO-1 )  -SOBRETASA TASA_BASE,   '+ coCRLF +
'  		SOBRETASA AS SOBRETASA,   '+ coCRLF +
'  		PKGCRCOMUN.FUNOBTENTASA(''FN'',CFAD.ID_CREDITO, NUM_PERIODO, CFAD.F_VENCIMIENTO-1 )  AS TASA_FINAL,    '+ coCRLF +
'  		Imp_FINAN_aDIC,   '+ coCRLF +
'  		PKGCRCOMUN.STPOBTIMPPAGADO(''FN'',''IMPBRU'',CFAD.ID_CREDITO,NUM_PERIODO,NULL,   ' +vlF_CORTE+'  ,''V'') AS Imp_Pagado,   '+ coCRLF +
'  		 F_PAGO,    '+ coCRLF +
'  		 0 AS IVA,    '+ coCRLF +
'       	 IMP_MORATORIO,    '+ coCRLF +
'  		 IMP_IVA_MORA,      '+ coCRLF +
'  		 PKGCRPERIODO.FUNOBTENMORA(3,''V'',CFAD.ID_CREDITO, NUM_PERIODO,NULL,null,   ' +vlF_CORTE+'  ,null) IMP_MORA_IMP,   '+ coCRLF +
'  		 PKGCRPERIODO.FUNOBTENMORA(3,''F'',CFAD.ID_CREDITO, NUM_PERIODO,null,null,   ' +vlF_CORTE+'  ,null) IMP_IVA_MORA_IMP,   '+ coCRLF +
'  		 PKGCRCOMUN.STPOBTIMPPAGADO(''FN'',''IMPMOR'',CFAD.ID_CREDITO,NUM_PERIODO,NULL,   ' +vlF_CORTE+'  ,''V'') AS Imp_Pag_Moras,   '+ coCRLF +
'  		 PKGCRCOMUN.STPOBTIMPPAGADO(''FN'',''IVAMOR'',CFAD.ID_CREDITO,NUM_PERIODO,NULL,   ' +vlF_CORTE+'  ,''V'') AS IVA_Pag_Moras   '+ coCRLF +
'                ,SIT_FINAN_ADIC '+ coCRLF + //HERJA
'  		FROM CR_FINAN_ADIC CFAD, CR_CREDITO CCRE, CONTRATO C, PERSONA P    '+ coCRLF +
'  		WHERE SIT_FINAN_ADIC <> ''CA''   '+ coCRLF +
'  		AND CFAD.ID_CREDITO=CCRE.ID_CREDITO   '+ coCRLF +
'  		AND CCRE.ID_CONTRATO=C.ID_CONTRATO   '+ coCRLF +
'  		AND C.ID_TITULAR=P.ID_PERSONA   '+ coCRLF +
'  	        '+vlCondicion+'    '+ coCRLF +
'  		) CFAV	   '+ coCRLF +
'  UNION		   '+ coCRLF +
'  select CFAG.*,   '+ coCRLF +
//'  	    CASE WHEN (F_VENCIMIENTO>=  ' +vlF_CORTE+'  ) and ( Imp_FINAN_aDIC>Imp_pagado )    '+ coCRLF + //HERJA
'  	    CASE WHEN (F_VENCIMIENTO>=  ' +vlF_CORTE+'  ) AND ( SIT_FINAN_ADIC IN (''AC'',''PA'') )   '+ coCRLF + //HERJA
'            THEN ''FAVI''    '+ coCRLF +
'   	    ELSE ''X''   '+ coCRLF +
'     		END AS IDENTIFICADOR,   '+ coCRLF +
'   		Imp_FINAN_aDIC-IMP_PAGADO AS IMPORTE   '+ coCRLF +
'  		from (   '+ coCRLF +
'  		SELECT CCRE.ID_CONTRATO,CFAD.ID_CREDITO, NUM_PERIODO,CASE WHEN CFAD.NUM_PERIODO<>1 then  CFAD.F_VENCIMIENTO- CFAD.PLAZO +1 ELSE CFAD.F_VENCIMIENTO- CFAD.PLAZO END AS F_INICIO, CFAD.F_VENCIMIENTO, PLAZO,   '+ coCRLF +
'  		PKGCRCOMUN.FUNOBTENTASA(''FN'',CFAD.ID_CREDITO, NUM_PERIODO, CFAD.F_VENCIMIENTO-1 )  -SOBRETASA TASA_BASE,   '+ coCRLF +
'  		SOBRETASA AS SOBRETASA,   '+ coCRLF +
'  		PKGCRCOMUN.FUNOBTENTASA(''FN'',CFAD.ID_CREDITO, NUM_PERIODO, CFAD.F_VENCIMIENTO-1 )  AS TASA_FINAL,    '+ coCRLF +
'  		Imp_FINAN_aDIC,   '+ coCRLF +
'  		PKGCRCOMUN.STPOBTIMPPAGADO(''FN'',''IMPBRU'',CFAD.ID_CREDITO,NUM_PERIODO,NULL,   ' +vlF_CORTE+'  ,''V'') AS Imp_Pagado,   '+ coCRLF +
'  		 F_PAGO,    '+ coCRLF +
'  		 0 AS IVA,    '+ coCRLF +
'       	 IMP_MORATORIO,    '+ coCRLF +
'  		 IMP_IVA_MORA,      '+ coCRLF +
'  		 PKGCRPERIODO.FUNOBTENMORA(3,''V'',CFAD.ID_CREDITO, NUM_PERIODO,NULL,null,   ' +vlF_CORTE+'  ,null) IMP_MORA_IMP,   '+ coCRLF +
'  		 PKGCRPERIODO.FUNOBTENMORA(3,''F'',CFAD.ID_CREDITO, NUM_PERIODO,null,null,   ' +vlF_CORTE+'  ,null) IMP_IVA_MORA_IMP,   '+ coCRLF +
'  		 PKGCRCOMUN.STPOBTIMPPAGADO(''FN'',''IMPMOR'',CFAD.ID_CREDITO,NUM_PERIODO,NULL,   ' +vlF_CORTE+'  ,''V'') AS Imp_Pag_Moras,   '+ coCRLF +
'  		 PKGCRCOMUN.STPOBTIMPPAGADO(''FN'',''IVAMOR'',CFAD.ID_CREDITO,NUM_PERIODO,NULL,   ' +vlF_CORTE+'  ,''V'') AS IVA_Pag_Moras   '+ coCRLF +
'                ,SIT_FINAN_ADIC '+ coCRLF + //HERJA
'  		FROM CR_FINAN_ADIC CFAD, CR_CREDITO CCRE, CONTRATO C, PERSONA P   '+ coCRLF +
'  		WHERE SIT_FINAN_ADIC <> ''CA''   '+ coCRLF +
'  		AND CFAD.ID_CREDITO=CCRE.ID_CREDITO   '+ coCRLF +
'  		AND CCRE.ID_CONTRATO=C.ID_CONTRATO   '+ coCRLF +
'  		AND C.ID_TITULAR=P.ID_PERSONA   '+ coCRLF +
'                '+vlCondicion+'    '+ coCRLF +
'  		) CFAG 	   '+ coCRLF +
'  		) CCFA   '+ coCRLF +
'  WHERE IDENTIFICADOR <> ''X''   '+ coCRLF +
'  UNION   '+ coCRLF +
'  SELECT ID_CONTRATO, ID_CREDITO,IDENTIFICADOR,F_INICIO, PLAZO, F_VENCIMIENTO,TASA_BASE,SOBRETASA, TASA_FINAL,   '+ coCRLF +
'  F_PAGO, IMPORTE, IVA,   '+ coCRLF +
'  CASE WHEN IDENTIFICADOR =''COPA''   '+ coCRLF +
'        THEN  CASE   '+ coCRLF +
'  		       WHEN F_VENCIMIENTO < ' +vlF_CORTE+ coCRLF +
'  		       THEN 0   '+ coCRLF +
'  		    END    '+ coCRLF +
'  	  ELSE IMP_MORA_IMP'+ coCRLF +
'  END AS IMP_MORA,   '+ coCRLF +
'  CASE WHEN IDENTIFICADOR =''COPA''   '+ coCRLF +
'            THEN  CASE   '+ coCRLF +
'  		        WHEN F_VENCIMIENTO < ' +vlF_CORTE+ coCRLF +
'  		         THEN 0   '+ coCRLF +
'  				END    '+ coCRLF +
//'  		  ELSE IMP_IVA_MORA-IVA_PAG_MORAS   '+ coCRLF + //HERJA
'  		  ELSE IMP_IVA_MORA_IMP   '+ coCRLF + //HERJA
'   END AS IMP_IVA_MORA,    '+ coCRLF +
'  NUM_PERIODO,IMP_MORATORIO, IMP_MORA_IMP,IMP_PAG_MORAS, IMP_IVA_MORA_IMP   '+ coCRLF +
'  FROM (   '+ coCRLF +
'  select CCNP.*,   '+ coCRLF +
//'  		CASE  WHEN IMP_PAGADO>0    '+ coCRLF + //HERJA
'  		CASE  WHEN ((SIT_COMISION IN (''LQ''))AND(IMP_COMISION>0)) OR ((SIT_COMISION NOT IN (''LQ''))AND(IMP_PAGADO>0))  '+ coCRLF +  //HERJA
'  		 THEN ''COPA''    '+ coCRLF +
'  		 ELSE ''X''    '+ coCRLF +
'  		END AS IDENTIFICADOR,   '+ coCRLF +
'  		IMP_PAGADO AS IMPORTE   '+ coCRLF +
'  		from (   '+ coCRLF +
'  			SELECT CCRE.ID_CONTRATO,CCOM.ID_CREDITO, NUM_PERIODO,CCOM.F_VENCIMIENTO- CCOM.PLAZO AS F_INICIO, CCOM.F_VENCIMIENTO, PLAZO,   '+ coCRLF +
'  			0 TASA_BASE,   '+ coCRLF +
'  			SOBRETASA AS SOBRETASA,   '+ coCRLF +
'  			0 AS TASA_FINAL,    '+ coCRLF +
'  			Imp_Comision,   '+ coCRLF +
'  			PKGCRCOMUN.STPOBTIMPPAGADO(''CN'',''IMPBRU'',CCOM.ID_CREDITO,CCOM.NUM_PERIODO,CCOM.CVE_COMISION,   ' +vlF_CORTE+'  ,''V'') AS Imp_Pagado,   '+ coCRLF +
'  			 F_PAGO,    '+ coCRLF +
//'  			 IMP_IVA AS IVA,   '+ coCRLF +
//'  			 IMP_IVA_PAGADO AS IVA,   '+ coCRLF +
'                        PKGCRCOMUN.STPOBTIMPPAGADO(''CN'',''IMPIVA'',CCOM.ID_CREDITO,CCOM.NUM_PERIODO,CCOM.CVE_COMISION,   ' +vlF_CORTE+'  ,''V'') AS IVA,   '+ coCRLF +
'  			 IMP_MORATORIO,   '+ coCRLF +
'  			 IMP_IVA_MORA,    '+ coCRLF +
'  			 PKGCRPERIODO.FUNOBTENMORA(2,''V'',CCOM.ID_CREDITO, CCOM.NUM_PERIODO,CCOM.CVE_COMISION,null,   ' +vlF_CORTE+'  ,null) IMP_MORA_IMP,   '+ coCRLF +
'  			 PKGCRPERIODO.FUNOBTENMORA(2,''F'',CCOM.ID_CREDITO, CCOM.NUM_PERIODO,CCOM.CVE_COMISION,null,   ' +vlF_CORTE+'  ,null) IMP_IVA_MORA_IMP,   '+ coCRLF +
'  			 PKGCRCOMUN.STPOBTIMPPAGADO(''CN'',''IMPMOR'',CCOM.ID_CREDITO,CCOM.NUM_PERIODO,CCOM.CVE_COMISION,   ' +vlF_CORTE+'  ,''V'') AS Imp_Pag_Moras,   '+ coCRLF +
'  			 PKGCRCOMUN.STPOBTIMPPAGADO(''CN'',''IVAMOR'',CCOM.ID_CREDITO,CCOM.NUM_PERIODO,CCOM.CVE_COMISION,   ' +vlF_CORTE+'  ,''V'') AS IVA_Pag_Moras   '+ coCRLF +
'                        ,SIT_COMISION '+ coCRLF + //HERJA
'  			FROM CR_COMISION CCOM, CR_CREDITO CCRE, CONTRATO C, PERSONA P   '+ coCRLF +
'  			WHERE SIT_COMISION <> ''CA''   '+ coCRLF +
'  			and CCOM.ID_CREDITO=CCRE.ID_CREDITO   '+ coCRLF +
'  			AND CCRE.ID_CONTRATO=C.ID_CONTRATO   '+ coCRLF +
'  			AND C.ID_TITULAR=P.ID_PERSONA   '+ coCRLF +
'  		        '+vlCondicion+'    '+ coCRLF +
'  			) CCNP   '+ coCRLF +
'  UNION		   '+ coCRLF +
'  select CCNV.*,   '+ coCRLF +
//'  	    CASE WHEN (F_VENCIMIENTO<  ' +vlF_CORTE+'  ) and ( Imp_COMISION>Imp_pagado )    '+ coCRLF + //HERJA
'  	    CASE WHEN (F_VENCIMIENTO<  ' +vlF_CORTE+'  ) AND ( SIT_COMISION IN (''IM'') )    '+ coCRLF + //HERJA
'          THEN ''COVD''    '+ coCRLF +
'  	    ELSE ''X''   '+ coCRLF +
'  		END AS IDENTIFICADOR,   '+ coCRLF +
'  		Imp_COMISION-IMP_PAGADO AS IMPORTE   '+ coCRLF +
'  		from (   '+ coCRLF +
'  			SELECT CCRE.ID_CONTRATO,CCOM.ID_CREDITO, NUM_PERIODO,CCOM.F_VENCIMIENTO-CCOM.PLAZO AS F_INICIO, CCOM.F_VENCIMIENTO, PLAZO,   '+ coCRLF +
'  			0 TASA_BASE,   '+ coCRLF +
'  			SOBRETASA AS SOBRETASA,   '+ coCRLF +
'  			0 AS TASA_FINAL,    '+ coCRLF +
'  			Imp_Comision,   '+ coCRLF +
'  			PKGCRCOMUN.STPOBTIMPPAGADO(''CN'',''IMPBRU'',CCOM.ID_CREDITO,CCOM.NUM_PERIODO,CCOM.CVE_COMISION,   ' +vlF_CORTE+'  ,''V'') AS Imp_Pagado,   '+ coCRLF +
'   			 F_PAGO,    '+ coCRLF +
//'  			 IMP_IVA AS IVA,   '+ coCRLF +
//'  			 IMP_IVA - IMP_IVA_PAGADO AS IVA,    '+ coCRLF +
'  			 IMP_IVA - PKGCRCOMUN.STPOBTIMPPAGADO(''CN'',''IMPIVA'',CCOM.ID_CREDITO,CCOM.NUM_PERIODO,CCOM.CVE_COMISION,   ' +vlF_CORTE+'  ,''V'') AS IVA,    '+ coCRLF +
'  			 IMP_MORATORIO,   '+ coCRLF +
'  			 IMP_IVA_MORA,    '+ coCRLF +
'  			 PKGCRPERIODO.FUNOBTENMORA(2,''V'',CCOM.ID_CREDITO, CCOM.NUM_PERIODO,CCOM.CVE_COMISION,null,   ' +vlF_CORTE+'  ,null) IMP_MORA_IMP,   '+ coCRLF +
'  			 PKGCRPERIODO.FUNOBTENMORA(2,''F'',CCOM.ID_CREDITO, CCOM.NUM_PERIODO,CCOM.CVE_COMISION,null,   ' +vlF_CORTE+'  ,null) IMP_IVA_MORA_IMP,   '+ coCRLF +
'  			 PKGCRCOMUN.STPOBTIMPPAGADO(''CN'',''IMPMOR'',CCOM.ID_CREDITO,CCOM.NUM_PERIODO,CCOM.CVE_COMISION,   ' +vlF_CORTE+'  ,''V'') AS Imp_Pag_Moras,   '+ coCRLF +
'  			 PKGCRCOMUN.STPOBTIMPPAGADO(''CN'',''IVAMOR'',CCOM.ID_CREDITO,CCOM.NUM_PERIODO,CCOM.CVE_COMISION,   ' +vlF_CORTE+'  ,''V'') AS IVA_Pag_Moras   '+ coCRLF +
'                        ,SIT_COMISION'+ coCRLF +   //HERJA
'   			FROM CR_COMISION CCOM, CR_CREDITO CCRE , CONTRATO C, PERSONA P   '+ coCRLF +
'  			WHERE SIT_COMISION <> ''CA''   '+ coCRLF +
'  			and CCOM.ID_CREDITO=CCRE.ID_CREDITO   '+ coCRLF +
'  			AND CCRE.ID_CONTRATO=C.ID_CONTRATO   '+ coCRLF +
'  			AND C.ID_TITULAR=P.ID_PERSONA   '+ coCRLF +
'  			 '+vlCondicion+'    '+ coCRLF +
'  			) CCNV   '+ coCRLF +
{'  UNION		   '+ coCRLF +
'  select CCNG.*,   '+ coCRLF +
//'  	    CASE WHEN (F_VENCIMIENTO>=  ' +vlF_CORTE+'  ) and ( Imp_COMISION>Imp_pagado )    '+ coCRLF + //HERJA
'  	    CASE WHEN (F_VENCIMIENTO>=  ' +vlF_CORTE+'  ) AND ( SIT_COMISION IN (''AC'') )    '+ coCRLF + //HERJA
'          THEN ''COVI''    '+ coCRLF +
'  	    ELSE ''X''   '+ coCRLF +
'  		END AS IDENTIFICADOR,   '+ coCRLF +
'  		Imp_COMISION-IMP_PAGADO AS IMPORTE   '+ coCRLF +
'  		from (   '+ coCRLF +
'  			SELECT CCRE.ID_CONTRATO,CCOM.ID_CREDITO, NUM_PERIODO,CCOM.F_VENCIMIENTO- CCOM.PLAZO AS F_INICIO, CCOM.F_VENCIMIENTO, PLAZO,   '+ coCRLF +
'  			0 TASA_BASE,   '+ coCRLF +
'  			SOBRETASA AS SOBRETASA,   '+ coCRLF +
'  			0 AS TASA_FINAL,    '+ coCRLF +
'  			Imp_Comision,   '+ coCRLF +
'  			PKGCRCOMUN.STPOBTIMPPAGADO(''CN'',''IMPBRU'',CCOM.ID_CREDITO,NUM_PERIODO,CVE_COMISION,   ' +vlF_CORTE+'  ,''V'') AS Imp_Pagado,   '+ coCRLF +
'  			 F_PAGO,    '+ coCRLF +
'  			 IMP_IVA AS IVA,   '+ coCRLF +
'  			 IMP_MORATORIO,   '+ coCRLF +
'  			 IMP_IVA_MORA,    '+ coCRLF +
'  			 PKGCRPERIODO.FUNOBTENMORA(2,''V'',CCOM.ID_CREDITO, NUM_PERIODO,CVE_COMISION,null,   ' +vlF_CORTE+'  ,null) IMP_MORA_IMP,   '+ coCRLF +
'  			 PKGCRPERIODO.FUNOBTENMORA(2,''F'',CCOM.ID_CREDITO, NUM_PERIODO,CVE_COMISION,null,   ' +vlF_CORTE+'  ,null) IMP_IVA_MORA_IMP,   '+ coCRLF +
'  			 PKGCRCOMUN.STPOBTIMPPAGADO(''CN'',''IMPMOR'',CCOM.ID_CREDITO,NUM_PERIODO,NULL,   ' +vlF_CORTE+'  ,''V'') AS Imp_Pag_Moras,   '+ coCRLF +
'  			 PKGCRCOMUN.STPOBTIMPPAGADO(''CN'',''IVAMOR'',CCOM.ID_CREDITO,NUM_PERIODO,NULL,   ' +vlF_CORTE+'  ,''V'') AS IVA_Pag_Moras   '+ coCRLF +
'                        ,SIT_COMISION'+ coCRLF + //HERJA
'  			FROM CR_COMISION CCOM, CR_CREDITO CCRE , PERSONA P, CONTRATO C   '+ coCRLF +
'  			WHERE SIT_COMISION <> ''CA''   '+ coCRLF +
'  			and CCOM.ID_CREDITO=CCRE.ID_CREDITO   '+ coCRLF +
'  			AND CCRE.ID_CONTRATO=C.ID_CONTRATO   '+ coCRLF +
'  			AND C.ID_TITULAR=P.ID_PERSONA   '+ coCRLF +
'  			 '+vlCondicion+'    '+ coCRLF +
'  			) CCNG   '+ coCRLF + }
'  		) CCNG   '+ coCRLF +
'  		WHERE IDENTIFICADOR <> ''X''   '+ coCRLF +
'  UNION   '+ coCRLF +
'  SELECT ID_CONTRATO,ID_CREDITO,IDENTIFICADOR,F_INICIO, PLAZO, F_VENCIMIENTO,TASA_BASE,SOBRETASA, TASA_FINAL,   '+ coCRLF +
'  F_PAGO, IMPORTE, IVA,   '+ coCRLF +
'  CASE WHEN IDENTIFICADOR =''INPA''    '+ coCRLF +
'        THEN  CASE    '+ coCRLF +
'   		       WHEN F_VENCIMIENTO < ' +vlF_CORTE+ coCRLF +
'  		       THEN 0   '+ coCRLF +
'  		    END    '+ coCRLF +
'  	  ELSE IMP_MORA_IMP '+ coCRLF +
'  END AS IMP_MORA,   '+ coCRLF +
'  CASE WHEN IDENTIFICADOR =''INPA''   '+ coCRLF +
'            THEN  CASE   '+ coCRLF +
'  		        WHEN F_VENCIMIENTO < ' +vlF_CORTE+ coCRLF +
'  		         THEN 0    '+ coCRLF +
'  				END    '+ coCRLF +
//'  		  ELSE IMP_IVA_MORA-IVA_PAG_MORAS   '+ coCRLF + //HERJA
'  		  ELSE IMP_IVA_MORA_IMP   '+ coCRLF + //HERJA
'   END AS IMP_IVA_MORA,    '+ coCRLF +
'  NUM_PERIODO,IMP_MORATORIO, IMP_MORA_IMP,IMP_PAG_MORAS, IMP_IVA_MORA_IMP   '+ coCRLF +
'  FROM (   '+ coCRLF +
'  select CINT.*,   '+ coCRLF +
//'  		CASE  WHEN IMP_PAGADO>0    '+ coCRLF + //HERJA
'  		CASE  WHEN ((SIT_INTERES IN (''LQ''))AND(IMP_INTERES>0)) OR ((SIT_INTERES NOT IN (''LQ''))AND(IMP_PAGADO>0))  '+ coCRLF +  //HERJA
'  		 THEN ''INPA''    '+ coCRLF +
'   		 ELSE ''X''    '+ coCRLF +
'  		END AS IDENTIFICADOR,   '+ coCRLF +
'  		IMP_PAGADO AS IMPORTE   '+ coCRLF +
'  		from (   '+ coCRLF +
'    		    SELECT CCRE.ID_CONTRATO,CINT.ID_CREDITO, NUM_PERIODO,CASE WHEN CINT.NUM_PERIODO<>1 then  CINT.F_VENCIMIENTO- CINT.PLAZO +1 ELSE CINT.F_VENCIMIENTO- CINT.PLAZO END AS F_INICIO, CINT.F_VENCIMIENTO, PLAZO,   '+ coCRLF +
'  			PKGCRCOMUN.FUNOBTENTASA(''IN'',CINT.ID_CREDITO, NUM_PERIODO, CINT.F_VENCIMIENTO-1 )  -SOBRETASA TASA_BASE,   '+ coCRLF +
'  			SOBRETASA AS SOBRETASA,   '+ coCRLF +
'  			PKGCRCOMUN.FUNOBTENTASA(''IN'',CINT.ID_CREDITO, NUM_PERIODO, CINT.F_VENCIMIENTO-1 )  AS TASA_FINAL,    '+ coCRLF +
'  			Imp_Interes,   '+ coCRLF +
'  			PKGCRCOMUN.STPOBTIMPPAGADO(''IN'',''IMPBRU'',CINT.ID_CREDITO,NUM_PERIODO,NULL,   ' +vlF_CORTE+'  ,''V'') AS Imp_Pagado,   '+ coCRLF +
'  			 F_PAGO,    '+ coCRLF +
//'  			 IMP_IVA_PAGADO AS IVA,    '+ coCRLF +
'                        PKGCRCOMUN.STPOBTIMPPAGADO(''IN'',''IMPIVA'',CINT.ID_CREDITO,CINT.NUM_PERIODO,NULL,   ' +vlF_CORTE+'  ,''V'') AS IVA,   '+ coCRLF +
'  			 IMP_MORATORIO,   '+ coCRLF +
'  			 IMP_IVA_MORA,   '+ coCRLF +
'  			 PKGCRPERIODO.FUNOBTENMORA(4,''V'',CINT.ID_CREDITO, NUM_PERIODO,NULL,null,   ' +vlF_CORTE+'  +1,NULL) IMP_MORA_IMP,   '+ coCRLF +
'  			 PKGCRPERIODO.FUNOBTENMORA(4,''F'',CINT.ID_CREDITO, NUM_PERIODO,NULL,null,   ' +vlF_CORTE+'  +1,NULL) IMP_IVA_MORA_IMP,   '+ coCRLF +
'  			 PKGCRCOMUN.STPOBTIMPPAGADO(''IN'',''IMPMOR'',CINT.ID_CREDITO,NUM_PERIODO,NULL,   ' +vlF_CORTE+'  ,''V'') AS Imp_Pag_Moras,   '+ coCRLF +
'  			 PKGCRCOMUN.STPOBTIMPPAGADO(''IN'',''IVAMOR'',CINT.ID_CREDITO,NUM_PERIODO,NULL,   ' +vlF_CORTE+'  ,''V'') AS IVA_Pag_Moras   '+ coCRLF +
'                        ,SIT_INTERES '+ coCRLF + //HERJA
'  			FROM CR_INTERES CINT, CR_CREDITO CCRE, CONTRATO C, PERSONA P    '+ coCRLF +
'  			WHERE SIT_INTERES <> ''CA''   '+ coCRLF +
'  			AND CINT.ID_CREDITO=CCRE.ID_CREDITO   '+ coCRLF +
'  			AND IMP_INTERES<> 0   '+ coCRLF +
'  			AND CCRE.ID_CONTRATO=C.ID_CONTRATO   '+ coCRLF +
'  			AND C.ID_TITULAR=P.ID_PERSONA   '+ coCRLF +
'  			 '+vlCondicion+'    '+ coCRLF +
'  			) CINT   '+ coCRLF +
'  UNION		   '+ coCRLF +
'  select CINTV.*,   '+ coCRLF +
//'  	    CASE WHEN (F_VENCIMIENTO<  ' +vlF_CORTE+'  ) and (( Imp_INTERES>Imp_pagado ) or (Iva >0))    '+ coCRLF + //HERJA
'  	    CASE WHEN (F_VENCIMIENTO<  ' +vlF_CORTE+'  ) AND (SIT_INTERES IN (''IM''))    '+ coCRLF + //HERJA
'            THEN ''INVD''    '+ coCRLF +
'   	    ELSE ''X''   '+ coCRLF +
'   		END AS IDENTIFICADOR,   '+ coCRLF +
'  		Imp_INTERES-IMP_PAGADO AS IMPORTE   '+ coCRLF +
'  		from (   '+ coCRLF +
'    		    SELECT CCRE.ID_CONTRATO,CINT.ID_CREDITO, NUM_PERIODO,CASE WHEN CINT.NUM_PERIODO<>1 then  CINT.F_VENCIMIENTO- CINT.PLAZO +1 ELSE CINT.F_VENCIMIENTO- CINT.PLAZO END AS F_INICIO, CINT.F_VENCIMIENTO, PLAZO,   '+ coCRLF +
'  			PKGCRCOMUN.FUNOBTENTASA(''IN'',CINT.ID_CREDITO, NUM_PERIODO, CINT.F_VENCIMIENTO-1 )  -SOBRETASA TASA_BASE,   '+ coCRLF +
'  			SOBRETASA AS SOBRETASA,   '+ coCRLF +
'  			PKGCRCOMUN.FUNOBTENTASA(''IN'',CINT.ID_CREDITO, NUM_PERIODO, CINT.F_VENCIMIENTO-1 )  AS TASA_FINAL,    '+ coCRLF +
'  			Imp_Interes,   '+ coCRLF +
'  			PKGCRCOMUN.STPOBTIMPPAGADO(''IN'',''IMPBRU'',CINT.ID_CREDITO,NUM_PERIODO,NULL,   ' +vlF_CORTE+'  ,''V'') AS Imp_Pagado,   '+ coCRLF +
'  			 F_PAGO,    '+ coCRLF +
//'  			 IMP_IVA - IMP_IVA_PAGADO AS IVA,    '+ coCRLF +
'  			 IMP_IVA - PKGCRCOMUN.STPOBTIMPPAGADO(''IN'',''IMPIVA'',CINT.ID_CREDITO,CINT.NUM_PERIODO,NULL,   ' +vlF_CORTE+'  ,''V'') AS IVA,    '+ coCRLF +
'  			 IMP_MORATORIO,   '+ coCRLF +
'  			 IMP_IVA_MORA,   '+ coCRLF +
'  			 PKGCRPERIODO.FUNOBTENMORA(4,''V'',CINT.ID_CREDITO, NUM_PERIODO,NULL,null,   ' +vlF_CORTE+'  +1,NULL) IMP_MORA_IMP,   '+ coCRLF +
'  			 PKGCRPERIODO.FUNOBTENMORA(4,''F'',CINT.ID_CREDITO, NUM_PERIODO,NULL,null,   ' +vlF_CORTE+'  +1,NULL) IMP_IVA_MORA_IMP,   '+ coCRLF +
'  			 PKGCRCOMUN.STPOBTIMPPAGADO(''IN'',''IMPMOR'',CINT.ID_CREDITO,NUM_PERIODO,NULL,   ' +vlF_CORTE+'  ,''V'') AS Imp_Pag_Moras,   '+ coCRLF +
'  			 PKGCRCOMUN.STPOBTIMPPAGADO(''IN'',''IVAMOR'',CINT.ID_CREDITO,NUM_PERIODO,NULL,   ' +vlF_CORTE+'  ,''V'') AS IVA_Pag_Moras   '+ coCRLF +
'                        ,SIT_INTERES '+ coCRLF +
'  			FROM CR_INTERES CINT, CR_CREDITO CCRE , CONTRATO C, PERSONA P   '+ coCRLF +
'  			WHERE SIT_INTERES <> ''CA''   '+ coCRLF +
'  			AND CINT.ID_CREDITO=CCRE.ID_CREDITO   '+ coCRLF +
'  			AND IMP_INTERES<> 0   '+ coCRLF +
'  			AND CCRE.ID_CONTRATO=C.ID_CONTRATO   '+ coCRLF +
'  			AND C.ID_TITULAR=P.ID_PERSONA   '+ coCRLF +
'  			 '+vlCondicion+'    '+ coCRLF +
'  		    ) CINTV	   '+ coCRLF +
'  UNION		   '+ coCRLF +
'  select CINTG.*,   '+ coCRLF +
//'  	    CASE WHEN (F_VENCIMIENTO>=  ' +vlF_CORTE+'  ) and ( Imp_INTERES>Imp_pagado )    '+ coCRLF +  //HERJA
'  	    CASE WHEN (F_VENCIMIENTO>=  ' +vlF_CORTE+'  ) AND ( SIT_INTERES IN (''AC'',''PA'') )    '+ coCRLF +  //HERJA
'            THEN ''INVI''    '+ coCRLF +
'   	    ELSE ''X''   '+ coCRLF +
'   		END AS IDENTIFICADOR,   '+ coCRLF +
'  		Imp_INTERES-IMP_PAGADO AS IMPORTE   '+ coCRLF +
'  		from (   '+ coCRLF +
'    		    SELECT CCRE.ID_CONTRATO,CINT.ID_CREDITO, NUM_PERIODO,CASE WHEN CINT.NUM_PERIODO<>1 then  CINT.F_VENCIMIENTO- CINT.PLAZO +1 ELSE CINT.F_VENCIMIENTO- CINT.PLAZO END AS F_INICIO, CINT.F_VENCIMIENTO, PLAZO,   '+ coCRLF +
'   			PKGCRCOMUN.FUNOBTENTASA(''IN'',CINT.ID_CREDITO, NUM_PERIODO, CINT.F_VENCIMIENTO-1 )  -SOBRETASA TASA_BASE,   '+ coCRLF +
'  			SOBRETASA AS SOBRETASA,   '+ coCRLF +
' 			PKGCRCOMUN.FUNOBTENTASA(''IN'',CINT.ID_CREDITO, NUM_PERIODO, CINT.F_VENCIMIENTO-1 )  AS TASA_FINAL,    '+ coCRLF +
'  			Imp_Interes,   '+ coCRLF +
'  			PKGCRCOMUN.STPOBTIMPPAGADO(''IN'',''IMPBRU'',CINT.ID_CREDITO,NUM_PERIODO,NULL,   ' +vlF_CORTE+'  ,''V'') AS Imp_Pagado,   '+ coCRLF +
'  			 F_PAGO,    '+ coCRLF +
'   			 IMP_IVA AS IVA,    '+ coCRLF +
'  			 IMP_MORATORIO,   '+ coCRLF +
'  			 IMP_IVA_MORA,   '+ coCRLF +
'  			 PKGCRPERIODO.FUNOBTENMORA(4,''V'',CINT.ID_CREDITO, NUM_PERIODO,NULL,null,   ' +vlF_CORTE+'  +1,NULL) IMP_MORA_IMP,   '+ coCRLF +
'  			 PKGCRPERIODO.FUNOBTENMORA(4,''F'',CINT.ID_CREDITO, NUM_PERIODO,NULL,null,   ' +vlF_CORTE+'  +1,NULL) IMP_IVA_MORA_IMP,   '+ coCRLF +
'  			 PKGCRCOMUN.STPOBTIMPPAGADO(''IN'',''IMPMOR'',CINT.ID_CREDITO,NUM_PERIODO,NULL,   ' +vlF_CORTE+'  ,''V'') AS Imp_Pag_Moras,   '+ coCRLF +
'  			 PKGCRCOMUN.STPOBTIMPPAGADO(''IN'',''IVAMOR'',CINT.ID_CREDITO,NUM_PERIODO,NULL,   ' +vlF_CORTE+'  ,''V'') AS IVA_Pag_Moras   '+ coCRLF +
'                        ,SIT_INTERES   '+ coCRLF +
'  			FROM CR_INTERES CINT, CR_CREDITO CCRE , CONTRATO C, PERSONA P   '+ coCRLF +
'  			WHERE SIT_INTERES <> ''CA''   '+ coCRLF +
'  			AND CINT.ID_CREDITO=CCRE.ID_CREDITO   '+ coCRLF +
'  			AND IMP_INTERES<> 0   '+ coCRLF +
'  			AND CCRE.ID_CONTRATO=C.ID_CONTRATO   '+ coCRLF +
'  			AND C.ID_TITULAR=P.ID_PERSONA   '+ coCRLF +
'  		        '+vlCondicion+'    '+ coCRLF +
'  		    ) CINTG    '+ coCRLF + 
'  		) CCFA   '+ coCRLF +
'  WHeRE IDENTIFICADOR <> ''X''   '+ coCRLF +
'  ) CTOD  '+ coCRLF +
'   UNION   '+ coCRLF +
'  SELECT 0 ESTATUS,   '+ coCRLF +
'  0 CONCEPTO,   '+ coCRLF +
'  F_AUT_COMITE,   '+ coCRLF +
'  CCONT.IMP_AUTORIZADO,  '+ coCRLF +
'  CCONT.F_VENCIMIENTO F_VEN_CONT,  '+ coCRLF +
'  CCONT.CVE_TASA_REFER,   '+ coCRLF +
'  CCONT.OPERADOR_STASA,  '+ coCRLF +
'  CCONT.SOBRETASA SOBRETASACONT,   '+ coCRLF +
'  CCRE.FACT_MORAS,   '+ coCRLF +
'  NOMBRE,  '+ coCRLF +
'  CCRE.ID_CONTRATO,   '+ coCRLF +
'  ID_CREDITO,   '+ coCRLF +
'  NULL IDENTIFICADOR,   '+ coCRLF +
'  CCRE.F_INICIO F_INICIO, 0 PLAZO,  CCRE.F_VENCIMIENTO F_VENCIMIENTO,0 TASA_BASE,0 SOBRETASA, 0 TASA_FINAL,   '+ coCRLF +
//'  NULL F_PAGO,  CCRE.IMP_DISPUESTO IMPORTE, 0 IVA, 0 IMP_MORA,   '+ coCRLF +
'  NULL F_PAGO,  CCRE.IMP_CREDITO IMPORTE, 0 IVA, 0 IMP_MORA,   '+ coCRLF + //HERJA CAMBIO POR IMPORTE DEL CREDITO
'  0 IMP_IVA_MORA,   '+ coCRLF +
'  0  NUM_PERIODO,0 IMP_MORATORIO, 0 IMP_MORA_IMP, 0 IMP_PAG_MORAS, 0 IMP_IVA_MORA_IMP,   '+ coCRLF +
'    0 IMP_DEPOSITO, '+ coCRLF +
'    NULL  F_OPERACION, '+ coCRLF +
'    0 CAPITAL, '+ coCRLF +
'    0 FINADIC, '+ coCRLF +
'    0 INTERES, '+ coCRLF +
'    0 CONCEPTOS, '+ coCRLF +
'    0 MORATORIOS, '+ coCRLF +
'    0 IVAS, '+ coCRLF +
'    0 OTROS, '+ coCRLF +
'  NULL ANIO, NULL F_INI_PER, NULL F_VEN_PER, 0 CAPITAL_AD, 0 FINADIC_AD ,0 INTERES_AD, 0 CONCEPTOS_AD, 0 MORATORIOS_AD, 0 IVAS_AD, '+ coCRLF +
'  0 tasa_base_ad, 0 sobretasa_ad, 0 tasa_final_ad, 0 tasa_mora_ad, 0 MONEDA_AD '+ coCRLF +
'  FROM CR_CREDITO CCRE, CR_CONTRATO CCONT, CONTRATO C, PERSONA P   '+ coCRLF +
'  WHERE CCRE.ID_CONTRATO=CCONT.ID_CONTRATO   '+ coCRLF +
'  AND CCONT.ID_CONTRATO=C.ID_CONTRATO   '+ coCRLF +
'  AND C.ID_TITULAR=P.ID_PERSONA   '+ coCRLF +
'  AND SIT_CREDITO<> ''CA''   '+ coCRLF +
'  '+vlCondicion+'   '+ coCRLF +
'    UNION   '+ coCRLF +
'  SELECT  5 ESTATUS, 5 CONCEPTO, NULL F_AUT_COMITE,  NULL IMP_AUTORIZADO, NULL F_VEN_CONT, NULL CVE_TASA_REFER,   '+ coCRLF +
'  NULL OPERADOR_STASA, NULL SOBRETASACONT, NULL FACT_MORAS, NULL NOMBRE,   '+ coCRLF +
'  ID_CONTRATO,   '+ coCRLF +
'  ID_CREDITO,   '+ coCRLF +
'  NULL IDENTIFICADOR, F_OPERACION F_INICIO, 0 PLAZO, NULL F_VENCIMIENTO, 0 TASA_BASE, 0 SOBRETASA,   '+ coCRLF +
'  0 TASA_FINAL, NULL F_PAGO, 0 IMPORTE,0 IVA,0 IMP_MORA, 0 IMP_IVA_MORA,0 NUM_PERIODO, 0 IMP_MORATORIO,     '+ coCRLF +
'  0 IMP_MORA_IMP, 0 IMP_PAG_MORAS,0 IMP_IVA_MORA_IMP,   '+ coCRLF +
'  IMP_DEPOSITO,F_OPERACION,CAPITAL, FINADIC, INTERES, CONCEPTOS, MORATORIOS, IVAS, OTROS,   '+ coCRLF +
'  NULL ANIO, NULL F_INI_PER, NULL F_VEN_PER, 0 CAPITAL_AD, 0 FINADIC_AD ,0 INTERES_AD, 0 CONCEPTOS_AD, 0 MORATORIOS_AD, 0 IVAS_AD, '+ coCRLF +
'  0 tasa_base_ad, 0 sobretasa_ad, 0 tasa_final_ad, 0 tasa_mora_ad, 0 MONEDA_AD '+ coCRLF +
'  FROM (   '+ coCRLF +
'  SELECT CTRA.ID_CONTRATO, CTRA.ID_CREDITO,SUM(IMP_CONCEPTO) IMP_DEPOSITO, CTRA.F_OPERACION,  '+ coCRLF +
'  SUM( CASE WHEN CACC.CVE_ACCESORIO=''CP'' AND CVE_CONCEPTO=''IMPBRU'' THEN IMP_CONCEPTO END ) CAPITAL,   '+ coCRLF +
'  SUM( CASE WHEN CACC.CVE_ACCESORIO=''FN'' AND CVE_CONCEPTO=''IMPBRU'' THEN IMP_CONCEPTO END ) FINADIC,   '+ coCRLF +
'  SUM( CASE WHEN CACC.CVE_ACCESORIO=''IN'' AND CVE_CONCEPTO=''IMPBRU'' THEN IMP_CONCEPTO END ) INTERES,   '+ coCRLF +
'  SUM( CASE WHEN CACC.CVE_ACCESORIO=''CN'' AND CVE_CONCEPTO=''IMPBRU'' THEN IMP_CONCEPTO END ) CONCEPTOS,   '+ coCRLF +
'  SUM( CASE WHEN CVE_CONCEPTO=''IMPMOR'' THEN IMP_CONCEPTO END ) MORATORIOS,   '+ coCRLF +
//'  SUM( CASE WHEN CVE_CONCEPTO=''IMPIVA'' THEN IMP_CONCEPTO END ) IVAS,   '+ coCRLF +  //HERJA
'  SUM( CASE WHEN CVE_CONCEPTO IN (''IMPIVA'',''IVAMOR'') THEN IMP_CONCEPTO END ) IVAS,   '+ coCRLF +  //HERJA
'  SUM(CASE WHEN CACC.CVE_ACCESORIO NOT IN (''CP'',''FN'',''IN'',''CN'') THEN IMP_CONCEPTO end ) otros   '+ coCRLF +
'  from cr_transaccion CTRA, CR_DET_TRANSAC CDTRA, CR_OPERACION COPE, CR_ACCESORIO CACC, CR_CREDITO CCRE   '+ coCRLF +
'  where id_trans_cancela  is null and sit_transaccion <> ''CA''   '+ coCRLF +
'  AND CTRA.ID_CREDITO=CCRE.ID_CREDITO '+ coCRLF +
'  '+vlCondicion+'   '+ coCRLF +
'  AND CTRA.ID_TRANSACCION=CDTRA.ID_TRANSACCION  '+ coCRLF +
'  AND CTRA.CVE_OPERACION=COPE.CVE_OPERACION  '+ coCRLF +
'  AND COPE.CVE_ACCESORIO=CACC.CVE_ACCESORIO  '+ coCRLF +
'  AND COPE.B_EDO_CTA=''V''  '+ coCRLF +
'  AND CTRA.CVE_OPERACION NOT IN (''PGCPGF'', ''PGCPGP'',''PGFNGF'',''PGFNGP'', ''PGINGF'',''PGINGP'' ,''PGCNGF'',''PGCNGP'') '+ coCRLF +
'  AND F_OPERACION <='+vlF_CORTE +
'  group by CTRA.ID_CONTRATO,CTRA.ID_CREDITO,CTRA.f_operacion  '+ coCRLF +
'  ORDER BY CTRA.ID_CONTRATO,CTRA.ID_CREDITO,CTRA.F_OPERACION  '+ coCRLF +
'  ) yyy '+ coCRLF +
//inicia ultima union U_6
' UNION '+ coCRLF +
' SELECT U_6.*  '+ coCRLF +
' FROM (SELECT 6 ESTATUS, 6 CONCEPTO,   '+ coCRLF +
'   null F_AUT_COMITE,    '+ coCRLF +
'   0 IMP_AUTORIZADO,   '+ coCRLF +
'   NULL F_VEN_CONT,    '+ coCRLF +
'   NULL CVE_TASA_REFER,    '+ coCRLF +
'   NULL OPERADOR_STASA,    '+ coCRLF +
'   0 SOBRETASACONT,    '+ coCRLF +
'   0 FACT_MORAS,    '+ coCRLF +
'   NULL NOMBRE, '+ coCRLF +
'   ID_CONTRATO,    '+ coCRLF +
'   ZZZ.ID_CREDITO,    '+ coCRLF +
'   NULL IDENTIFICADOR,    '+ coCRLF +
'   NULL F_INICIO, 0 PLAZO,  NULL F_VENCIMIENTO, TASA_BASE, SOBRETASA,  TASA_FINAL,      '+ coCRLF +
'   NULL F_PAGO,  NULL IMPORTE, 0 IVA, 0 IMP_MORA,    '+ coCRLF +
'   0 IMP_IVA_MORA,    '+ coCRLF +
'   0  NUM_PERIODO,0 IMP_MORATORIO, 0 IMP_MORA_IMP, 0 IMP_PAG_MORAS, 0 IMP_IVA_MORA_IMP, '+ coCRLF +
'   0 IMP_DEPOSITO, '+ coCRLF +
'   NULL F_OPERACION,    '+ coCRLF +
'     0 CAPITAL,  '+ coCRLF +
'     0 FINADIC,  '+ coCRLF +
'     0 INTERES,  '+ coCRLF +
'     0 CONCEPTOS,  '+ coCRLF +
'     0 MORATORIOS,  '+ coCRLF +
'     0 IVAS,  '+ coCRLF +
'     0 OTROS,   '+ coCRLF +
//' TO_CHAR(F_INICIO,''YYYY'') ANIO, min(F_INICIO) f_ini_per, max(f_Vencimiento) f_ven_per, SUM(DECODE(CONCEPTO,3,IMPORTE,0)) AS CAPITAL_AD, SUM(DECODE(CONCEPTO,1,IMPORTE,0)) AS FINADIC_AD, '+ coCRLF +
' ''ANIO'', min(F_INICIO) f_ini_per, f_Vencimiento f_ven_per, SUM(DECODE(CONCEPTO,3,IMPORTE,0)) AS CAPITAL_AD, SUM(DECODE(CONCEPTO,1,IMPORTE,0)) AS FINADIC_AD, '+ coCRLF +
' SUM(DECODE(CONCEPTO,2,IMPORTE,0)) AS INTERESES_AD, SUM(DECODE(CONCEPTO,4,IMPORTE,0)) AS CONCEPTOS_AD, SUM(IMP_MORA) MORATORIOS_AD, '+ coCRLF +
' SUM(IVA+IMP_IVA_MORA) IVAS_AD, tasa_base as tasa_base_Ad  , sobretasa as sobretasa_ad, tasa_final as tasa_final_ad,   '+ coCRLF +
' DECODE( CVE_CALCULO_M, NULL, tasa_final* FACT_MORAS_M ,DECODE (OPERADOR_STASA_M,''*'', tasa_final*SOBRETASA_M, '+ coCRLF +
'                                						  ''+'', tasa_final+SOBRETASA_M,  '+ coCRLF +
'  				                                                  ''-'', tasa_final-SOBRETASA_M,  '+ coCRLF +
'										  ''/'', tasa_final/SOBRETASA_M ) ) TASA_MORA_AD, '+ coCRLF +
' MONEDA_AD  '+ coCRLF +
' FROM ( '+ coCRLF +
'   SELECT Decode(Substr(IDENTIFICADOR,3,2),''PA'',1,Decode(Substr(Identificador,3,2) ,''VD'',2,3)) ESTATUS,    '+ coCRLF +
'   Decode(Substr(IDENTIFICADOR,1,2),''FA'',1, Decode(Substr(Identificador,1,2) ,''IN'',2,Decode(Substr(Identificador,1,2) ,''CA'',3,4))) CONCEPTO,    '+ coCRLF +
'   null F_AUT_COMITE,    '+ coCRLF +
'   0 IMP_AUTORIZADO,   '+ coCRLF +
'   NULL F_VEN_CONT,    '+ coCRLF +
'   NULL CVE_TASA_REFER,    '+ coCRLF +
'   NULL OPERADOR_STASA,    '+ coCRLF +
'   0 SOBRETASACONT,    '+ coCRLF +
'   0 FACT_MORAS,    '+ coCRLF +
'   NULL NOMBRE,    '+ coCRLF +
'   CTOD.*, '+ coCRLF +
'   0 CAPITAL, '+ coCRLF +
'   0 FINADIC, '+ coCRLF +
'   0 INTERES, '+ coCRLF +
'   0 CONCEPTOS, '+ coCRLF +
'   0 MORATORIOS, '+ coCRLF +
'   0 IVAS, '+ coCRLF +
'   0 OTROS   '+ coCRLF +
//'    NULL ANIO, NULL F_INI_PER, NULL F_VEN_PER, 0 CAPITAL_AD, 0 FINADIC_AD ,0 INTERES_AD, 0 CONCEPTOS_AD, 0 MORATORIOS_AD, 0 IVAS_AD '+ coCRLF +
'   FROM      '+ coCRLF +
'   (    '+ coCRLF +
'   SELECT ID_CONTRATO,ID_CREDITO,IDENTIFICADOR,    '+ coCRLF +
'   F_INICIO, PLAZO, F_VENCIMIENTO,TASA_BASE,SOBRETASA, TASA_FINAL,    '+ coCRLF +
'   F_PAGO, IMPORTE, IVA,    '+ coCRLF +
'   CASE WHEN IDENTIFICADOR =''CAPA''    '+ coCRLF +
'             THEN  CASE    '+ coCRLF +
'   		        WHEN F_VENCIMIENTO <  ' + vlF_corte + '  '+ coCRLF +
'   		         THEN 0    '+ coCRLF +
'   				END     '+ coCRLF +
'   		  ELSE IMP_MORA_IMP'+ coCRLF +
'    END AS IMP_MORA,    '+ coCRLF +
'   CASE WHEN IDENTIFICADOR =''CAPA''    '+ coCRLF +
'             THEN  CASE    '+ coCRLF +
'  		        WHEN F_VENCIMIENTO <  ' + vlF_corte + '  '+ coCRLF +
'   		         THEN 0    '+ coCRLF +
'   				END     '+ coCRLF +
//'   		  ELSE IMP_IVA_MORA-IVA_PAG_MORAS    '+ coCRLF + //HERJA
'   		  ELSE IMP_IVA_MORA_IMP    '+ coCRLF + //HERJA
'    END AS IMP_IVA_MORA,      '+ coCRLF +
'   NUM_PERIODO,IMP_MORATORIO, IMP_MORA_IMP,IMP_PAG_MORAS, IMP_IVA_MORA_IMP    '+ coCRLF +
'   FROM (    '+ coCRLF +
'   select CCA.*,    '+ coCRLF +
//'   		CASE  WHEN IMP_PAGADO>0     '+ coCRLF +  //HERJA
'  		CASE  WHEN ((SIT_CAPITAL IN (''LQ''))AND(IMP_CAPITAL>0)) OR ((SIT_CAPITAL NOT IN (''LQ''))AND(IMP_PAGADO>0))  '+ coCRLF +  //HERJA
'   		 THEN ''CAPA''     '+ coCRLF +
'   		 ELSE ''X''     '+ coCRLF +
'   		END AS IDENTIFICADOR,    '+ coCRLF +
'   		IMP_PAGADO AS IMPORTE    '+ coCRLF +
'   		from (    '+ coCRLF +
'   				SELECT CCRE.ID_CONTRATO,CCAP.ID_CREDITO,NUM_PERIODO,CASE WHEN CCAP.NUM_PERIODO<>1 then  CCAP.F_VENCIMIENTO- CCAP.PLAZO +1 ELSE CCAP.F_VENCIMIENTO- CCAP.PLAZO END AS F_INICIO, CCAP.F_VENCIMIENTO, PLAZO,    '+ coCRLF +
{
'   				0 TASA_BASE,    '+ coCRLF +
'   				0 AS SOBRETASA,    '+ coCRLF +
'   				0 AS TASA_FINAL,     '+ coCRLF +
}
'  				PKGCRCOMUN.FUNOBTENTASA(''CP'',CCAP.ID_CREDITO, NUM_PERIODO, CCAP.F_VENCIMIENTO-1 )-SOBRETASA TASA_BASE, '+ coCRLF +
'  				SOBRETASA AS SOBRETASA,   '+ coCRLF +
'  				PKGCRCOMUN.FUNOBTENTASA(''CP'',CCAP.ID_CREDITO, NUM_PERIODO, CCAP.F_VENCIMIENTO-1 )AS TASA_FINAL,  '+ coCRLF +
'   				Imp_Capital,    '+ coCRLF +
'   				PKGCRCOMUN.STPOBTIMPPAGADO(''CP'',''IMPBRU'',CCAP.ID_CREDITO,NUM_PERIODO,NULL,    ' + vlF_corte + '  ,''V'') AS Imp_Pagado,    '+ coCRLF +
'   				 F_PAGO,     '+ coCRLF +
'   				 0 AS IVA,     '+ coCRLF +
'   				 IMP_MORATORIO,     '+ coCRLF +
'   				 IMP_IVA_MORA,      '+ coCRLF +
'   				 PKGCRPERIODO.FUNOBTENMORA(1,''V'',CCAP.ID_CREDITO, NUM_PERIODO,null,null,    ' + vlF_corte + '  ,NULL) IMP_MORA_IMP,    '+ coCRLF +
'   				 PKGCRPERIODO.FUNOBTENMORA(1,NULL,CCAP.ID_CREDITO, NUM_PERIODO,null,null,    ' + vlF_corte + '  ,null) IMP_IVA_MORA_IMP,    '+ coCRLF +
'   				 PKGCRCOMUN.STPOBTIMPPAGADO(''CP'',''IMPMOR'',CCAP.ID_CREDITO,NUM_PERIODO,NULL,    ' + vlF_corte + '   ,''V'') AS Imp_Pag_Moras,    '+ coCRLF +
'   				 PKGCRCOMUN.STPOBTIMPPAGADO(''CP'',''IVAMOR'',CCAP.ID_CREDITO,NUM_PERIODO,NULL,    ' + vlF_corte + '  ,''V'') AS IVA_Pag_Moras    '+ coCRLF +
'                                ,SIT_CAPITAL '+ coCRLF +
'   				FROM CR_CAPITAL CCAP, CR_CREDITO CCRE     '+ coCRLF +
'   				WHERE SIT_CAPITAL <> ''CA''    '+ coCRLF +
'   				AND CCAP.ID_CREDITO=CCRE.ID_CREDITO    '+ coCRLF +
'   			    ' + vlCondicion +  coCRLF +
'   				) CCA    '+ coCRLF +
'   UNION		    '+ coCRLF +
'   select CCAV.*,    '+ coCRLF +
//'   	    CASE WHEN (F_VENCIMIENTO<   ' + vlF_corte + '   ) and ( Imp_CAPITAL>Imp_pagado )     '+ coCRLF + //HERJA
'   	    CASE WHEN (F_VENCIMIENTO<   ' + vlF_corte + '   ) AND ( SIT_CAPITAL IN (''IM'') )     '+ coCRLF + //HERJA
'           THEN ''CAVD''     '+ coCRLF +
'   	    ELSE ''X''    '+ coCRLF +
'   		END AS IDENTIFICADOR,    '+ coCRLF +
//'   		Imp_CAPITAL-IMP_PAGADO AS IMPORTE    '+ coCRLF +
'   		Imp_CAPITAL-IMP_PAGADO + NVL(CA_HIST_PGDMCP.IMP_HIST_PGDMCP,0) AS IMPORTE    '+ coCRLF + //HERJA ENERO 2013
'   		from (    '+ coCRLF +
'   				SELECT CCRE.ID_CONTRATO,CCAP.ID_CREDITO,NUM_PERIODO,CASE WHEN CCAP.NUM_PERIODO<>1 then  CCAP.F_VENCIMIENTO- CCAP.PLAZO +1 ELSE CCAP.F_VENCIMIENTO- CCAP.PLAZO END AS F_INICIO, CCAP.F_VENCIMIENTO, PLAZO,    '+ coCRLF +
'   				PKGCRCOMUN.FUNOBTENTASA(''CP'',CCAP.ID_CREDITO, NUM_PERIODO, CCAP.F_VENCIMIENTO-1 ) -SOBRETASA TASA_BASE,    '+ coCRLF +
'   				SOBRETASA AS SOBRETASA,    '+ coCRLF +
'   				PKGCRCOMUN.FUNOBTENTASA(''CP'',CCAP.ID_CREDITO, NUM_PERIODO, CCAP.F_VENCIMIENTO-1 ) AS TASA_FINAL,     '+ coCRLF +
'   				Imp_Capital,    '+ coCRLF +
'   				PKGCRCOMUN.STPOBTIMPPAGADO(''CP'',''IMPBRU'',CCAP.ID_CREDITO,NUM_PERIODO,NULL,    ' + vlF_corte + '   ,''V'') AS Imp_Pagado,    '+ coCRLF +
'   				 F_PAGO,     '+ coCRLF +
'   				 0 AS IVA,     '+ coCRLF +
'   				 IMP_MORATORIO,     '+ coCRLF +
'   				 IMP_IVA_MORA,      '+ coCRLF +
'   				 PKGCRPERIODO.FUNOBTENMORA(1,''V'',CCAP.ID_CREDITO, NUM_PERIODO,null,null,    ' + vlF_corte + '   ,NULL) IMP_MORA_IMP,    '+ coCRLF +
'   				 PKGCRPERIODO.FUNOBTENMORA(1,NULL,CCAP.ID_CREDITO, NUM_PERIODO,null,null,    ' + vlF_corte + '   ,null) IMP_IVA_MORA_IMP,    '+ coCRLF +
'   				 PKGCRCOMUN.STPOBTIMPPAGADO(''CP'',''IMPMOR'',CCAP.ID_CREDITO,NUM_PERIODO,NULL,    ' + vlF_corte + '   ,''V'') AS Imp_Pag_Moras,    '+ coCRLF +
'   				 PKGCRCOMUN.STPOBTIMPPAGADO(''CP'',''IVAMOR'',CCAP.ID_CREDITO,NUM_PERIODO,NULL,    ' + vlF_corte + '   ,''V'') AS IVA_Pag_Moras    '+ coCRLF +
'                                ,SIT_CAPITAL '+ coCRLF +
'   				FROM CR_CAPITAL CCAP, CR_CREDITO CCRE     '+ coCRLF +
'   				WHERE SIT_CAPITAL <> ''CA''    '+ coCRLF +
'   				AND CCAP.ID_CREDITO=CCRE.ID_CREDITO    '+ coCRLF +
'   			         ' + vlCondicion + coCRLF +
'   				) CCAV	    '+ coCRLF +
//HERJA ENERO 2013
'				,( '+ coCRLF +
'				   SELECT CT.ID_CREDITO, CT.ID_PERIODO, '+ coCRLF +
'				          NVL(SUM(CDT.IMP_CONCEPTO),0) AS IMP_HIST_PGDMCP '+ coCRLF +
'				     FROM CR_TRANSACCION CT, CR_DET_TRANSAC CDT '+ coCRLF +
'				    WHERE 1=1 '+ coCRLF +
'				      AND CT.SIT_TRANSACCION = ''AC'' '+ coCRLF +
'				      AND CT.ID_TRANS_CANCELA IS NULL '+ coCRLF +
'				      AND CT.ID_TRANSACCION = CDT.ID_TRANSACCION '+ coCRLF +
'				      AND CT.CVE_OPERACION IN (''PGDMCP'') '+ coCRLF +
'				      AND CDT.CVE_CONCEPTO IN (''IMPBRU'') '+ coCRLF +
'				    GROUP BY CT.ID_CREDITO, CT.ID_PERIODO '+ coCRLF +
'				  ) CA_HIST_PGDMCP '+ coCRLF +
'			     WHERE 1=1 '+ coCRLF +
' 			       AND CA_HIST_PGDMCP.ID_CREDITO (+)= CCAV.ID_CREDITO '+ coCRLF +
'			       AND CA_HIST_PGDMCP.ID_PERIODO (+)= CCAV.NUM_PERIODO '+ coCRLF +
//FIN HERJA
'   UNION		    '+ coCRLF +
'   select CCAG.*,    '+ coCRLF +
//'   	    CASE WHEN (F_VENCIMIENTO>=   ' + vlF_corte + '  ) and ( Imp_CAPITAL>Imp_pagado )     '+ coCRLF + //HERJA
'   	    CASE WHEN (F_VENCIMIENTO>=   ' + vlF_corte + '  ) and ( SIT_CAPITAL IN (''AC'',''PA'') )     '+ coCRLF + //HERJA
'           THEN ''CAVI''     '+ coCRLF +
'   	    ELSE ''X''    '+ coCRLF +
'   		END AS IDENTIFICADOR,    '+ coCRLF +
//'   		Imp_CAPITAL-IMP_PAGADO AS IMPORTE    '+ coCRLF +  //HERJA ENERO 2013
'   		Imp_CAPITAL-IMP_PAGADO + NVL(CA_HIST_PGDMCP.IMP_HIST_PGDMCP,0) AS IMPORTE    '+ coCRLF +
'   		from (    '+ coCRLF +
'   				SELECT CCRE.ID_CONTRATO,CCAP.ID_CREDITO,NUM_PERIODO,CASE WHEN CCAP.NUM_PERIODO<>1 then  CCAP.F_VENCIMIENTO- CCAP.PLAZO +1 ELSE CCAP.F_VENCIMIENTO- CCAP.PLAZO END AS F_INICIO, CCAP.F_VENCIMIENTO, PLAZO,    '+ coCRLF +
'    				PKGCRCOMUN.FUNOBTENTASA(''CP'',CCAP.ID_CREDITO, NUM_PERIODO, CCAP.F_VENCIMIENTO-1 )  -SOBRETASA TASA_BASE, '+ coCRLF +
'   				SOBRETASA AS SOBRETASA,'+ coCRLF +
'   				PKGCRCOMUN.FUNOBTENTASA(''CP'',CCAP.ID_CREDITO, NUM_PERIODO, CCAP.F_VENCIMIENTO-1 )  AS TASA_FINAL, '+ coCRLF +
'   				Imp_Capital,    '+ coCRLF +
'   				PKGCRCOMUN.STPOBTIMPPAGADO(''CP'',''IMPBRU'',CCAP.ID_CREDITO,NUM_PERIODO,NULL,    ' + vlF_corte + '   ,''V'') AS Imp_Pagado,    '+ coCRLF +
'   				 F_PAGO,     '+ coCRLF +
'   				 0 AS IVA,     '+ coCRLF +
'   				 IMP_MORATORIO,     '+ coCRLF +
'   				 IMP_IVA_MORA,      '+ coCRLF +
'   				 PKGCRPERIODO.FUNOBTENMORA(1,''V'',CCAP.ID_CREDITO, NUM_PERIODO,null,null,    ' + vlF_corte + '   ,NULL) IMP_MORA_IMP,    '+ coCRLF +
'   				 PKGCRPERIODO.FUNOBTENMORA(1,NULL,CCAP.ID_CREDITO, NUM_PERIODO,null,null,    ' + vlF_corte + '   ,null) IMP_IVA_MORA_IMP,    '+ coCRLF +
'   				 PKGCRCOMUN.STPOBTIMPPAGADO(''CP'',''IMPMOR'',CCAP.ID_CREDITO,NUM_PERIODO,NULL,    ' + vlF_corte + '  ,''V'') AS Imp_Pag_Moras,    '+ coCRLF +
'   				 PKGCRCOMUN.STPOBTIMPPAGADO(''CP'',''IVAMOR'',CCAP.ID_CREDITO,NUM_PERIODO,NULL,    ' + vlF_corte + '  ,''V'') AS IVA_Pag_Moras    '+ coCRLF +
'                                ,SIT_CAPITAL '+ coCRLF + //HERJA
'   				FROM CR_CAPITAL CCAP, CR_CREDITO CCRE     '+ coCRLF +
'   				WHERE SIT_CAPITAL <> ''CA''    '+ coCRLF +
'   				AND CCAP.ID_CREDITO=CCRE.ID_CREDITO    '+ coCRLF +
'   			         ' + vlCondicion + coCRLF +
'   				)  CCAG    '+ coCRLF +
//HERJA ENERO 2013
'				,( '+ coCRLF +
'				   SELECT CT.ID_CREDITO, CT.ID_PERIODO, '+ coCRLF +
'				          NVL(SUM(CDT.IMP_CONCEPTO),0) AS IMP_HIST_PGDMCP '+ coCRLF +
'				     FROM CR_TRANSACCION CT, CR_DET_TRANSAC CDT '+ coCRLF +
'				    WHERE 1=1 '+ coCRLF +
'				      AND CT.SIT_TRANSACCION = ''AC'' '+ coCRLF +
'				      AND CT.ID_TRANS_CANCELA IS NULL '+ coCRLF +
'				      AND CT.ID_TRANSACCION = CDT.ID_TRANSACCION '+ coCRLF +
'				      AND CT.CVE_OPERACION IN (''PGDMCP'') '+ coCRLF +
'				      AND CDT.CVE_CONCEPTO IN (''IMPBRU'') '+ coCRLF +
'				    GROUP BY CT.ID_CREDITO, CT.ID_PERIODO '+ coCRLF +
'				  ) CA_HIST_PGDMCP '+ coCRLF +
'			     WHERE 1=1 '+ coCRLF +
' 			       AND CA_HIST_PGDMCP.ID_CREDITO (+)= CCAG.ID_CREDITO '+ coCRLF +
'			       AND CA_HIST_PGDMCP.ID_PERIODO (+)= CCAG.NUM_PERIODO '+ coCRLF +
//FIN HERJA
'   	) CCCA    '+ coCRLF +
'   WHERE IDENTIFICADOR <> ''X''    '+ coCRLF +
'   UNION    '+ coCRLF +
'   SELECT ID_CONTRATO,ID_CREDITO, IDENTIFICADOR,F_INICIO, PLAZO, F_VENCIMIENTO,TASA_BASE,SOBRETASA, TASA_FINAL,    '+ coCRLF +
'   F_PAGO, IMPORTE, IVA,    '+ coCRLF +
'   CASE WHEN IDENTIFICADOR =''FAPA''    '+ coCRLF +
'             THEN  CASE    '+ coCRLF +
'   		        WHEN F_VENCIMIENTO <  ' + vlF_corte + '  '+ coCRLF +
'   		         THEN 0    '+ coCRLF +
'   				END     '+ coCRLF +
'   		  ELSE IMP_MORA_IMP '+ coCRLF +
'    END AS IMP_MORA,    '+ coCRLF +
'   CASE WHEN IDENTIFICADOR =''FAPA''    '+ coCRLF +
'             THEN  CASE    '+ coCRLF +
'   		        WHEN F_VENCIMIENTO <  ' + vlF_corte + '  '+ coCRLF +
'   		         THEN 0    '+ coCRLF +
'   				END     '+ coCRLF +
//'   		  ELSE IMP_IVA_MORA-IVA_PAG_MORAS    '+ coCRLF + //HERJA
'   		  ELSE IMP_IVA_MORA_IMP    '+ coCRLF + //HERJA
'    END AS IMP_IVA_MORA,      '+ coCRLF +
'   NUM_PERIODO,IMP_MORATORIO, IMP_MORA_IMP,IMP_PAG_MORAS, IMP_IVA_MORA_IMP    '+ coCRLF +
'   FROM (    '+ coCRLF +
'   select CFA.*,    '+ coCRLF +
//'   		CASE  WHEN IMP_PAGADO>0     '+ coCRLF + //HEJRA
'  		CASE  WHEN ((SIT_FINAN_ADIC IN (''LQ''))AND(IMP_FINAN_ADIC>0)) OR ((SIT_FINAN_ADIC NOT IN (''LQ''))AND(IMP_PAGADO>0))  '+ coCRLF +  //HERJA
'  		 THEN ''FAPA''     '+ coCRLF +
'   		 ELSE ''X''     '+ coCRLF +
'   		END AS IDENTIFICADOR,    '+ coCRLF +
'   		IMP_PAGADO AS IMPORTE    '+ coCRLF +
'   		from (    '+ coCRLF +
'   		SELECT CCRE.ID_CONTRATO,CFAD.ID_CREDITO, NUM_PERIODO,CASE WHEN CFAD.NUM_PERIODO<>1 then  CFAD.F_VENCIMIENTO- CFAD.PLAZO +1 ELSE CFAD.F_VENCIMIENTO- CFAD.PLAZO END AS F_INICIO, CFAD.F_VENCIMIENTO, PLAZO,    '+ coCRLF +
'   		PKGCRCOMUN.FUNOBTENTASA(''FN'',CFAD.ID_CREDITO, NUM_PERIODO, CFAD.F_VENCIMIENTO-1 )  -SOBRETASA TASA_BASE,    '+ coCRLF +
'   		SOBRETASA AS SOBRETASA,    '+ coCRLF +
'   		PKGCRCOMUN.FUNOBTENTASA(''FN'',CFAD.ID_CREDITO, NUM_PERIODO, CFAD.F_VENCIMIENTO-1 )  AS TASA_FINAL,     '+ coCRLF +
'   		Imp_FINAN_aDIC,    '+ coCRLF +
'   		PKGCRCOMUN.STPOBTIMPPAGADO(''FN'',''IMPBRU'',CFAD.ID_CREDITO,NUM_PERIODO,NULL,    ' + vlF_corte + '   ,''V'') AS Imp_Pagado,    '+ coCRLF +
'   		 F_PAGO,     '+ coCRLF +
'   		 0 AS IVA,     '+ coCRLF +
'        	 IMP_MORATORIO,     '+ coCRLF +
'   		 IMP_IVA_MORA,       '+ coCRLF +
'   		 PKGCRPERIODO.FUNOBTENMORA(3,''V'',CFAD.ID_CREDITO, NUM_PERIODO,NULL,null,    ' + vlF_corte + '   ,null) IMP_MORA_IMP,    '+ coCRLF +
'   		 PKGCRPERIODO.FUNOBTENMORA(3,''F'',CFAD.ID_CREDITO, NUM_PERIODO,null,null,    ' + vlF_corte + '   ,null) IMP_IVA_MORA_IMP,    '+ coCRLF +
'   		 PKGCRCOMUN.STPOBTIMPPAGADO(''FN'',''IMPMOR'',CFAD.ID_CREDITO,NUM_PERIODO,NULL,    ' + vlF_corte + '   ,''V'') AS Imp_Pag_Moras,    '+ coCRLF +
'   		 PKGCRCOMUN.STPOBTIMPPAGADO(''FN'',''IVAMOR'',CFAD.ID_CREDITO,NUM_PERIODO,NULL,    ' + vlF_corte + '   ,''V'') AS IVA_Pag_Moras    '+ coCRLF +
'                ,SIT_FINAN_ADIC '+ coCRLF + //HERJA
'   		FROM CR_FINAN_ADIC CFAD, CR_CREDITO CCRE     '+ coCRLF +
' 		WHERE SIT_FINAN_ADIC <> ''CA''    '+ coCRLF +
'   		AND CFAD.ID_CREDITO=CCRE.ID_CREDITO    '+ coCRLF +
'   	         ' + vlCondicion + coCRLF +
'   		) CFA    '+ coCRLF +
'   UNION		    '+ coCRLF +
'   select CFAV.*,    '+ coCRLF +
//'   	    CASE WHEN (F_VENCIMIENTO<   ' + vlF_corte + '   ) and ( Imp_FINAN_aDIC>Imp_pagado )     '+ coCRLF + //HERJA
'   	    CASE WHEN (F_VENCIMIENTO<   ' + vlF_corte + '   ) AND ( SIT_FINAN_ADIC IN (''IM'') )     '+ coCRLF + //HERJA
'           THEN ''FAVD''     '+ coCRLF +
'   	    ELSE ''X''    '+ coCRLF +
'   		END AS IDENTIFICADOR,    '+ coCRLF +
'   		Imp_FINAN_aDIC-IMP_PAGADO AS IMPORTE    '+ coCRLF +
'   		from (    '+ coCRLF +
'   		SELECT CCRE.ID_CONTRATO,CFAD.ID_CREDITO, NUM_PERIODO,CASE WHEN CFAD.NUM_PERIODO<>1 then  CFAD.F_VENCIMIENTO- CFAD.PLAZO +1 ELSE CFAD.F_VENCIMIENTO- CFAD.PLAZO END AS F_INICIO, CFAD.F_VENCIMIENTO, PLAZO,    '+ coCRLF +
'   		PKGCRCOMUN.FUNOBTENTASA(''FN'',CFAD.ID_CREDITO, NUM_PERIODO, CFAD.F_VENCIMIENTO-1 )  -SOBRETASA TASA_BASE,    '+ coCRLF +
'   		SOBRETASA AS SOBRETASA,    '+ coCRLF +
'   		PKGCRCOMUN.FUNOBTENTASA(''FN'',CFAD.ID_CREDITO, NUM_PERIODO, CFAD.F_VENCIMIENTO-1 )  AS TASA_FINAL,     '+ coCRLF +
'   		Imp_FINAN_aDIC,    '+ coCRLF +
'   		PKGCRCOMUN.STPOBTIMPPAGADO(''FN'',''IMPBRU'',CFAD.ID_CREDITO,NUM_PERIODO,NULL,    ' + vlF_corte + '   ,''V'') AS Imp_Pagado,    '+ coCRLF +
'   		 F_PAGO,     '+ coCRLF +
'   		 0 AS IVA,     '+ coCRLF +
'        	 IMP_MORATORIO,     '+ coCRLF +
'    		 IMP_IVA_MORA,       '+ coCRLF +
'   		 PKGCRPERIODO.FUNOBTENMORA(3,''V'',CFAD.ID_CREDITO, NUM_PERIODO,NULL,null,    ' + vlF_corte + '   ,null) IMP_MORA_IMP,    '+ coCRLF +
'   		 PKGCRPERIODO.FUNOBTENMORA(3,''F'',CFAD.ID_CREDITO, NUM_PERIODO,null,null,    ' + vlF_corte + '   ,null) IMP_IVA_MORA_IMP,    '+ coCRLF +
'   		 PKGCRCOMUN.STPOBTIMPPAGADO(''FN'',''IMPMOR'',CFAD.ID_CREDITO,NUM_PERIODO,NULL,    ' + vlF_corte + '   ,''V'') AS Imp_Pag_Moras,    '+ coCRLF +
'   		 PKGCRCOMUN.STPOBTIMPPAGADO(''FN'',''IVAMOR'',CFAD.ID_CREDITO,NUM_PERIODO,NULL,    ' + vlF_corte + '   ,''V'') AS IVA_Pag_Moras    '+ coCRLF +
'                ,SIT_FINAN_ADIC '+ coCRLF +
'   		FROM CR_FINAN_ADIC CFAD, CR_CREDITO CCRE     '+ coCRLF +
' 		WHERE SIT_FINAN_ADIC <> ''CA''    '+ coCRLF +
'   		AND CFAD.ID_CREDITO=CCRE.ID_CREDITO    '+ coCRLF +
'   	         ' + vlCondicion + coCRLF +
'   		) CFAV	    '+ coCRLF +
'   UNION		    '+ coCRLF +
'   select CFAG.*,    '+ coCRLF +
//'   	    CASE WHEN (F_VENCIMIENTO>=   ' + vlF_corte + '   ) and ( Imp_FINAN_aDIC>Imp_pagado )     '+ coCRLF +  //HERJA
'   	    CASE WHEN (F_VENCIMIENTO>=   ' + vlF_corte + '   ) AND ( SIT_FINAN_ADIC IN (''AC'',''PA'') )     '+ coCRLF +  //HERJA
'             THEN ''FAVI''     '+ coCRLF +
'    	    ELSE ''X''    '+ coCRLF +
'      		END AS IDENTIFICADOR,    '+ coCRLF +
'    		Imp_FINAN_aDIC-IMP_PAGADO AS IMPORTE    '+ coCRLF +
'   		from (    '+ coCRLF +
'   		SELECT CCRE.ID_CONTRATO,CFAD.ID_CREDITO, NUM_PERIODO, CASE WHEN CFAD.NUM_PERIODO<>1 then  CFAD.F_VENCIMIENTO- CFAD.PLAZO +1 ELSE CFAD.F_VENCIMIENTO- CFAD.PLAZO END AS F_INICIO, CFAD.F_VENCIMIENTO, PLAZO,    '+ coCRLF +
'   		PKGCRCOMUN.FUNOBTENTASA(''FN'',CFAD.ID_CREDITO, NUM_PERIODO, CFAD.F_VENCIMIENTO-1 )  -SOBRETASA TASA_BASE,    '+ coCRLF +
'   		SOBRETASA AS SOBRETASA,    '+ coCRLF +
'   		PKGCRCOMUN.FUNOBTENTASA(''FN'',CFAD.ID_CREDITO, NUM_PERIODO, CFAD.F_VENCIMIENTO-1 )  AS TASA_FINAL,     '+ coCRLF +
'   		Imp_FINAN_aDIC,    '+ coCRLF +
'   		PKGCRCOMUN.STPOBTIMPPAGADO(''FN'',''IMPBRU'',CFAD.ID_CREDITO,NUM_PERIODO,NULL,    ' + vlF_corte + '   ,''V'') AS Imp_Pagado,    '+ coCRLF +
'   		 F_PAGO,     '+ coCRLF +
'   		 0 AS IVA,     '+ coCRLF +
'        	 IMP_MORATORIO,     '+ coCRLF +
'   		 IMP_IVA_MORA,       '+ coCRLF +
'   		 PKGCRPERIODO.FUNOBTENMORA(3,''V'',CFAD.ID_CREDITO, NUM_PERIODO,NULL,null,    ' + vlF_corte + '   ,null) IMP_MORA_IMP,    '+ coCRLF +
'   		 PKGCRPERIODO.FUNOBTENMORA(3,''F'',CFAD.ID_CREDITO, NUM_PERIODO,null,null,    ' + vlF_corte + '   ,null) IMP_IVA_MORA_IMP,    '+ coCRLF +
'   		 PKGCRCOMUN.STPOBTIMPPAGADO(''FN'',''IMPMOR'',CFAD.ID_CREDITO,NUM_PERIODO,NULL,    ' + vlF_corte + '   ,''V'') AS Imp_Pag_Moras,    '+ coCRLF +
'   		 PKGCRCOMUN.STPOBTIMPPAGADO(''FN'',''IVAMOR'',CFAD.ID_CREDITO,NUM_PERIODO,NULL,    ' + vlF_corte + '   ,''V'') AS IVA_Pag_Moras    '+ coCRLF +
'                ,SIT_FINAN_ADIC '+ coCRLF +
'   		FROM CR_FINAN_ADIC CFAD, CR_CREDITO CCRE    '+ coCRLF +
' 		WHERE SIT_FINAN_ADIC <> ''CA''    '+ coCRLF +
'   		AND CFAD.ID_CREDITO=CCRE.ID_CREDITO    '+ coCRLF +
'                  ' + vlCondicion + coCRLF +
'   		) CFAG	   '+ coCRLF +
'   		) CCFA    '+ coCRLF +
'   WHERE IDENTIFICADOR <> ''X''    '+ coCRLF +
'   UNION    '+ coCRLF +
'   SELECT ID_CONTRATO, ID_CREDITO,IDENTIFICADOR,F_INICIO, PLAZO, F_VENCIMIENTO,TASA_BASE,SOBRETASA, TASA_FINAL,    '+ coCRLF +
'   F_PAGO, IMPORTE, IVA,    '+ coCRLF +
'   CASE WHEN IDENTIFICADOR =''COPA''    '+ coCRLF +
'         THEN  CASE    '+ coCRLF +
'     WHEN F_VENCIMIENTO <  ' + vlF_corte + '  '+ coCRLF +
'     THEN 0    '+ coCRLF +
'  END     '+ coCRLF +
'   	  ELSE IMP_MORA_IMP  '+ coCRLF +
'   END AS IMP_MORA,    '+ coCRLF +
'   CASE WHEN IDENTIFICADOR =''COPA''    '+ coCRLF +
'             THEN  CASE    '+ coCRLF +
'      WHEN F_VENCIMIENTO <  ' + vlF_corte + '  '+ coCRLF +
'       THEN 0    '+ coCRLF +
'   				END     '+ coCRLF +
//'   		  ELSE IMP_IVA_MORA-IVA_PAG_MORAS    '+ coCRLF + //HERJA
'   		  ELSE IMP_IVA_MORA_IMP    '+ coCRLF + //HERJA
'    END AS IMP_IVA_MORA,     '+ coCRLF +
'   NUM_PERIODO,IMP_MORATORIO, IMP_MORA_IMP,IMP_PAG_MORAS, IMP_IVA_MORA_IMP    '+ coCRLF +
'   FROM (    '+ coCRLF +
'   select CCNP.*,    '+ coCRLF +
//'   		CASE  WHEN IMP_PAGADO>0     '+ coCRLF + //HERJA
'  		CASE  WHEN ((SIT_COMISION IN (''LQ''))AND(IMP_COMISION>0)) OR ((SIT_COMISION NOT IN (''LQ''))AND(IMP_PAGADO>0))  '+ coCRLF +  //HERJA
'   		 THEN ''COPA''     '+ coCRLF +
'   		 ELSE ''X''     '+ coCRLF +
'   		END AS IDENTIFICADOR,    '+ coCRLF +
'   		IMP_PAGADO AS IMPORTE    '+ coCRLF +
'   		from (    '+ coCRLF +
'   			SELECT CCRE.ID_CONTRATO,CCOM.ID_CREDITO, NUM_PERIODO,CCOM.F_VENCIMIENTO-PLAZO AS F_INICIO, CCOM.F_VENCIMIENTO, PLAZO,    '+ coCRLF +
'   			0 TASA_BASE,    '+ coCRLF +
'   			0 AS SOBRETASA,    '+ coCRLF +
'   			0 AS TASA_FINAL,     '+ coCRLF +
'   			Imp_Comision,    '+ coCRLF +
'   			PKGCRCOMUN.STPOBTIMPPAGADO(''CN'',''IMPBRU'',CCOM.ID_CREDITO,CCOM.NUM_PERIODO,CCOM.CVE_COMISION,    ' + vlF_corte + '   ,''V'') AS Imp_Pagado,    '+ coCRLF +
'   			 F_PAGO,     '+ coCRLF +
//'   			 IMP_IVA AS IVA,    '+ coCRLF +
//'  			 IMP_IVA_PAGADO AS IVA,   '+ coCRLF +
'                        PKGCRCOMUN.STPOBTIMPPAGADO(''CN'',''IMPIVA'',CCOM.ID_CREDITO,CCOM.NUM_PERIODO,CCOM.CVE_COMISION,   ' +vlF_CORTE+'  ,''V'') AS IVA,   '+ coCRLF +
'   			 IMP_MORATORIO,    '+ coCRLF +
'   			 IMP_IVA_MORA,     '+ coCRLF +
'   			 PKGCRPERIODO.FUNOBTENMORA(2,''V'',CCOM.ID_CREDITO, CCOM.NUM_PERIODO,CCOM.CVE_COMISION,null,    ' + vlF_corte + '   ,null) IMP_MORA_IMP,    '+ coCRLF +
'   			 PKGCRPERIODO.FUNOBTENMORA(2,''F'',CCOM.ID_CREDITO, CCOM.NUM_PERIODO,CCOM.CVE_COMISION,null,    ' + vlF_corte + '   ,null) IMP_IVA_MORA_IMP,    '+ coCRLF +
'   			 PKGCRCOMUN.STPOBTIMPPAGADO(''CN'',''IMPMOR'',CCOM.ID_CREDITO,CCOM.NUM_PERIODO,CCOM.CVE_COMISION,    ' + vlF_corte + '   ,''V'') AS Imp_Pag_Moras,    '+ coCRLF +
'   			 PKGCRCOMUN.STPOBTIMPPAGADO(''CN'',''IVAMOR'',CCOM.ID_CREDITO,CCOM.NUM_PERIODO,CCOM.CVE_COMISION,    ' + vlF_corte + '   ,''V'') AS IVA_Pag_Moras    '+ coCRLF +
'                        ,SIT_COMISION '+ coCRLF +
'   			FROM CR_COMISION CCOM, CR_CREDITO CCRE    '+ coCRLF +
' 	          	WHERE SIT_COMISION <> ''CA''    '+ coCRLF +
'   			and CCOM.ID_CREDITO=CCRE.ID_CREDITO    '+ coCRLF +
'       ' + vlCondicion + coCRLF +
'   			) CCNP    '+ coCRLF +
'   UNION		    '+ coCRLF +
'   select CCNV.*,    '+ coCRLF +
//'   	    CASE WHEN (F_VENCIMIENTO<   ' + vlF_corte + '   ) and ( Imp_COMISION>Imp_pagado )     '+ coCRLF + //HERJA
'   	    CASE WHEN (F_VENCIMIENTO<   ' + vlF_corte + '   ) AND ( SIT_COMISION IN (''IM'') )     '+ coCRLF + //HERJA
'           THEN ''COVD''     '+ coCRLF +
'   	    ELSE ''X''    '+ coCRLF +
'   		END AS IDENTIFICADOR,    '+ coCRLF +
'   		Imp_COMISION-IMP_PAGADO AS IMPORTE    '+ coCRLF +
'   		from (    '+ coCRLF +
'   			SELECT CCRE.ID_CONTRATO,CCOM.ID_CREDITO, NUM_PERIODO,CCOM.F_VENCIMIENTO-PLAZO AS F_INICIO, CCOM.F_VENCIMIENTO, PLAZO,    '+ coCRLF +
'   			0 TASA_BASE,    '+ coCRLF +
'   			0 AS SOBRETASA,    '+ coCRLF +
'   			0 AS TASA_FINAL,     '+ coCRLF +
'   			Imp_Comision,    '+ coCRLF +
'   			PKGCRCOMUN.STPOBTIMPPAGADO(''CN'',''IMPBRU'',CCOM.ID_CREDITO,CCOM.NUM_PERIODO,CCOM.CVE_COMISION,    ' + vlF_corte + '   ,''V'') AS Imp_Pagado,    '+ coCRLF +
'    			 F_PAGO,     '+ coCRLF +
//'   			 IMP_IVA AS IVA,    '+ coCRLF +
//'  			 IMP_IVA - IMP_IVA_PAGADO AS IVA,    '+ coCRLF +
'  			 IMP_IVA - PKGCRCOMUN.STPOBTIMPPAGADO(''CN'',''IMPIVA'',CCOM.ID_CREDITO,CCOM.NUM_PERIODO,CCOM.CVE_COMISION,   ' +vlF_CORTE+'  ,''V'') AS IVA,    '+ coCRLF +
'   			 IMP_MORATORIO,    '+ coCRLF +
'   			 IMP_IVA_MORA,     '+ coCRLF +
'   			 PKGCRPERIODO.FUNOBTENMORA(2,''V'',CCOM.ID_CREDITO, CCOM.NUM_PERIODO,CCOM.CVE_COMISION,null,    ' + vlF_corte + '   ,null) IMP_MORA_IMP,    '+ coCRLF +
'   			 PKGCRPERIODO.FUNOBTENMORA(2,''F'',CCOM.ID_CREDITO, CCOM.NUM_PERIODO,CCOM.CVE_COMISION,null,    ' + vlF_corte + '   ,null) IMP_IVA_MORA_IMP,    '+ coCRLF +
'   			 PKGCRCOMUN.STPOBTIMPPAGADO(''CN'',''IMPMOR'',CCOM.ID_CREDITO,CCOM.NUM_PERIODO,CCOM.CVE_COMISION,    ' + vlF_corte + '   ,''V'') AS Imp_Pag_Moras,    '+ coCRLF +
'   			 PKGCRCOMUN.STPOBTIMPPAGADO(''CN'',''IVAMOR'',CCOM.ID_CREDITO,CCOM.NUM_PERIODO,CCOM.CVE_COMISION,    ' + vlF_corte + '   ,''V'') AS IVA_Pag_Moras    '+ coCRLF +


'                        ,SIT_COMISION '+ coCRLF +
'    			FROM CR_COMISION CCOM, CR_CREDITO CCRE     '+ coCRLF +
' 	          	WHERE SIT_COMISION <> ''CA''    '+ coCRLF +
'   			and CCOM.ID_CREDITO=CCRE.ID_CREDITO    '+ coCRLF +
'   			  ' + vlCondicion + coCRLF +
'   			) CCNV    '+ coCRLF +
{'   UNION		    '+ coCRLF +
'   select CCNG.*,    '+ coCRLF +
//'   	    CASE WHEN (F_VENCIMIENTO>=   ' + vlF_corte + '   ) and ( Imp_COMISION>Imp_pagado )     '+ coCRLF + //HERJA
'   	    CASE WHEN (F_VENCIMIENTO>=   ' + vlF_corte + '   ) AND ( SIT_COMISION IN (''AC'') )     '+ coCRLF + //HERJA
'           THEN ''COVI''     '+ coCRLF +
'   	    ELSE ''X''    '+ coCRLF +
'   		END AS IDENTIFICADOR,    '+ coCRLF +
'   		Imp_COMISION-IMP_PAGADO AS IMPORTE    '+ coCRLF +
'   		from (    '+ coCRLF +
'   			SELECT CCRE.ID_CONTRATO,CCOM.ID_CREDITO, NUM_PERIODO,CCOM.F_VENCIMIENTO-PLAZO AS F_INICIO, CCOM.F_VENCIMIENTO, PLAZO,    '+ coCRLF +
'   			0 TASA_BASE,    '+ coCRLF +
'   			0 AS SOBRETASA,    '+ coCRLF +
'   			0 AS TASA_FINAL,     '+ coCRLF +
'   			Imp_Comision,    '+ coCRLF +
'   			PKGCRCOMUN.STPOBTIMPPAGADO(''CN'',''IMPBRU'',CCOM.ID_CREDITO,NUM_PERIODO,CVE_COMISION,    ' + vlF_corte + '   ,''V'') AS Imp_Pagado,    '+ coCRLF +
'   			 F_PAGO,     '+ coCRLF +
'   			 IMP_IVA AS IVA,    '+ coCRLF +
'   			 IMP_MORATORIO,    '+ coCRLF +
'   			 IMP_IVA_MORA,     '+ coCRLF +
'   			 PKGCRPERIODO.FUNOBTENMORA(2,''V'',CCOM.ID_CREDITO, NUM_PERIODO,CVE_COMISION,null,    ' + vlF_corte + '   ,null) IMP_MORA_IMP,    '+ coCRLF +
'   			 PKGCRPERIODO.FUNOBTENMORA(2,''F'',CCOM.ID_CREDITO, NUM_PERIODO,CVE_COMISION,null,    ' + vlF_corte + '   ,null) IMP_IVA_MORA_IMP,    '+ coCRLF +
'   			 PKGCRCOMUN.STPOBTIMPPAGADO(''CN'',''IMPMOR'',CCOM.ID_CREDITO,NUM_PERIODO,NULL,    ' + vlF_corte + '   ,''V'') AS Imp_Pag_Moras,    '+ coCRLF +
'   			 PKGCRCOMUN.STPOBTIMPPAGADO(''CN'',''IVAMOR'',CCOM.ID_CREDITO,NUM_PERIODO,NULL,    ' + vlF_corte + '   ,''V'') AS IVA_Pag_Moras    '+ coCRLF +
'                        ,SIT_COMISION  '+ coCRLF + //HERJA
'   			FROM CR_COMISION CCOM, CR_CREDITO CCRE    '+ coCRLF +
' 	          	WHERE SIT_COMISION <> ''CA''    '+ coCRLF +
'   			and CCOM.ID_CREDITO=CCRE.ID_CREDITO    '+ coCRLF +
'   			  ' + vlCondicion + coCRLF +
'   			) CCNG    '+ coCRLF + }
'   		) CCNG    '+ coCRLF +
'   		WHERE IDENTIFICADOR <> ''X''    '+ coCRLF +
'   UNION    '+ coCRLF +
'   SELECT ID_CONTRATO,ID_CREDITO,IDENTIFICADOR,F_INICIO, PLAZO, F_VENCIMIENTO,TASA_BASE,SOBRETASA, TASA_FINAL,    '+ coCRLF +
'   F_PAGO, IMPORTE, IVA,    '+ coCRLF +
'   CASE WHEN IDENTIFICADOR =''INPA''     '+ coCRLF +
'         THEN  CASE     '+ coCRLF +
'      WHEN F_VENCIMIENTO <  ' + vlF_corte + '  '+ coCRLF +
'     THEN 0    '+ coCRLF +
'  END     '+ coCRLF +
'   	  ELSE IMP_MORA_IMP '+ coCRLF +
'   END AS IMP_MORA,    '+ coCRLF +
'   CASE WHEN IDENTIFICADOR =''INPA''    '+ coCRLF +
'             THEN  CASE    '+ coCRLF +
'      WHEN F_VENCIMIENTO <  ' + vlF_corte + '  '+ coCRLF +
'       THEN 0     '+ coCRLF +
'   				END     '+ coCRLF +
//'   		  ELSE IMP_IVA_MORA-IVA_PAG_MORAS    '+ coCRLF + //HERJA
'   		  ELSE IMP_IVA_MORA_IMP    '+ coCRLF + //HERJA
'    END AS IMP_IVA_MORA,     '+ coCRLF +
'   NUM_PERIODO,IMP_MORATORIO, IMP_MORA_IMP,IMP_PAG_MORAS, IMP_IVA_MORA_IMP    '+ coCRLF +
'    FROM (    '+ coCRLF +
'    select CINT.*,    '+ coCRLF +
//'   		CASE  WHEN IMP_PAGADO>0     '+ coCRLF + //HERJA
'  		CASE  WHEN ((SIT_INTERES IN (''LQ''))AND(IMP_INTERES>0)) OR ((SIT_INTERES NOT IN (''LQ''))AND(IMP_PAGADO>0))  '+ coCRLF +  //HERJA

'   		 THEN ''INPA''     '+ coCRLF +
'     		 ELSE ''X''     '+ coCRLF +
'   		END AS IDENTIFICADOR,    '+ coCRLF +
'   		IMP_PAGADO AS IMPORTE    '+ coCRLF +
'   		from (    '+ coCRLF +
'    SELECT CCRE.ID_CONTRATO,CINT.ID_CREDITO, NUM_PERIODO, CASE WHEN CINT.NUM_PERIODO<>1 then  CINT.F_VENCIMIENTO- CINT.PLAZO +1 ELSE CINT.F_VENCIMIENTO- CINT.PLAZO END AS F_INICIO, CINT.F_VENCIMIENTO, PLAZO,    '+ coCRLF +
'   			PKGCRCOMUN.FUNOBTENTASA(''IN'',CINT.ID_CREDITO, NUM_PERIODO, CINT.F_VENCIMIENTO-1 )  -SOBRETASA TASA_BASE,    '+ coCRLF +
'   			SOBRETASA AS SOBRETASA,    '+ coCRLF +
'   			PKGCRCOMUN.FUNOBTENTASA(''IN'',CINT.ID_CREDITO, NUM_PERIODO, CINT.F_VENCIMIENTO-1 )  AS TASA_FINAL,     '+ coCRLF +
'   			Imp_Interes,    '+ coCRLF +
'   			PKGCRCOMUN.STPOBTIMPPAGADO(''IN'',''IMPBRU'',CINT.ID_CREDITO,NUM_PERIODO,NULL,    ' + vlF_corte + '   ,''V'') AS Imp_Pagado,    '+ coCRLF +
'   			 F_PAGO,     '+ coCRLF +
//'   			 IMP_IVA_PAGADO AS IVA,     '+ coCRLF +
'                        PKGCRCOMUN.STPOBTIMPPAGADO(''IN'',''IMPIVA'',CINT.ID_CREDITO,CINT.NUM_PERIODO,NULL,   ' +vlF_CORTE+'  ,''V'') AS IVA,   '+ coCRLF +
'   			 IMP_MORATORIO,    '+ coCRLF +
'   			 IMP_IVA_MORA,    '+ coCRLF +
'   			 PKGCRPERIODO.FUNOBTENMORA(4,''V'',CINT.ID_CREDITO, NUM_PERIODO,NULL,null,    ' + vlF_corte + '   +1,NULL) IMP_MORA_IMP,    '+ coCRLF +
'   			 PKGCRPERIODO.FUNOBTENMORA(4,''F'',CINT.ID_CREDITO, NUM_PERIODO,NULL,null,    ' + vlF_corte + '   +1,NULL) IMP_IVA_MORA_IMP,    '+ coCRLF +
'   			 PKGCRCOMUN.STPOBTIMPPAGADO(''IN'',''IMPMOR'',CINT.ID_CREDITO,NUM_PERIODO,NULL,    ' + vlF_corte + '   ,''V'') AS Imp_Pag_Moras,    '+ coCRLF +
'   			 PKGCRCOMUN.STPOBTIMPPAGADO(''IN'',''IVAMOR'',CINT.ID_CREDITO,NUM_PERIODO,NULL,    ' + vlF_corte + '   ,''V'') AS IVA_Pag_Moras    '+ coCRLF +
'                        ,SIT_INTERES '+ coCRLF + //HERJA
'   			FROM CR_INTERES CINT, CR_CREDITO CCRE     '+ coCRLF +
' 	          	WHERE SIT_INTERES <> ''CA''    '+ coCRLF +
'   			AND CINT.ID_CREDITO=CCRE.ID_CREDITO    '+ coCRLF +
'   			AND IMP_INTERES<> 0    '+ coCRLF +
'   			  ' + vlCondicion + coCRLF +
'   			) CINT    '+ coCRLF +
'   UNION		    '+ coCRLF +
'   select CINTV.*,    '+ coCRLF +
//'   	    CASE WHEN (F_VENCIMIENTO<   ' + vlF_corte + '   ) and (( Imp_INTERES>Imp_pagado ) or (Iva >0))     '+ coCRLF + //HERJA
'   	    CASE WHEN (F_VENCIMIENTO<   ' + vlF_corte + '   ) AND (SIT_INTERES IN (''IM''))     '+ coCRLF + //HERJA
'             THEN ''INVD''     '+ coCRLF +
'    	    ELSE ''X''    '+ coCRLF +
'    		END AS IDENTIFICADOR,    '+ coCRLF +
'   		Imp_INTERES-IMP_PAGADO AS IMPORTE    '+ coCRLF +
'   		from (    '+ coCRLF +
'    SELECT CCRE.ID_CONTRATO,CINT.ID_CREDITO, NUM_PERIODO,CASE WHEN CINT.NUM_PERIODO<>1 then  CINT.F_VENCIMIENTO- CINT.PLAZO +1 ELSE CINT.F_VENCIMIENTO- CINT.PLAZO END AS F_INICIO, CINT.F_VENCIMIENTO, PLAZO,    '+ coCRLF +
'   			PKGCRCOMUN.FUNOBTENTASA(''IN'',CINT.ID_CREDITO, NUM_PERIODO, CINT.F_VENCIMIENTO-1 )  -SOBRETASA TASA_BASE,    '+ coCRLF +
'   			SOBRETASA AS SOBRETASA,    '+ coCRLF +
'   			PKGCRCOMUN.FUNOBTENTASA(''IN'',CINT.ID_CREDITO, NUM_PERIODO, CINT.F_VENCIMIENTO-1 )  AS TASA_FINAL,     '+ coCRLF +
'   			Imp_Interes,    '+ coCRLF +
'   			PKGCRCOMUN.STPOBTIMPPAGADO(''IN'',''IMPBRU'',CINT.ID_CREDITO,NUM_PERIODO,NULL,    ' + vlF_corte + '   ,''V'') AS Imp_Pagado,    '+ coCRLF +
'   			 F_PAGO,     '+ coCRLF +
//'   			 IMP_IVA-IMP_IVA_PAGADO AS IVA,     '+ coCRLF +
'                        IMP_IVA - PKGCRCOMUN.STPOBTIMPPAGADO(''IN'',''IMPIVA'',CINT.ID_CREDITO,CINT.NUM_PERIODO,NULL,   ' +vlF_CORTE+'  ,''V'') AS IVA,   '+ coCRLF +
'   			 IMP_MORATORIO,    '+ coCRLF +
'   			 IMP_IVA_MORA,    '+ coCRLF +
'   			 PKGCRPERIODO.FUNOBTENMORA(4,''V'',CINT.ID_CREDITO, NUM_PERIODO,NULL,null,    ' + vlF_corte + '   +1,NULL) IMP_MORA_IMP,    '+ coCRLF +
'   			 PKGCRPERIODO.FUNOBTENMORA(4,''F'',CINT.ID_CREDITO, NUM_PERIODO,NULL,null,    ' + vlF_corte + '   +1,NULL) IMP_IVA_MORA_IMP,    '+ coCRLF +
'   			 PKGCRCOMUN.STPOBTIMPPAGADO(''IN'',''IMPMOR'',CINT.ID_CREDITO,NUM_PERIODO,NULL,    ' + vlF_corte + '   ,''V'') AS Imp_Pag_Moras,    '+ coCRLF +
'   			 PKGCRCOMUN.STPOBTIMPPAGADO(''IN'',''IVAMOR'',CINT.ID_CREDITO,NUM_PERIODO,NULL,    ' + vlF_corte + '   ,''V'') AS IVA_Pag_Moras    '+ coCRLF +
'                        ,SIT_INTERES  '+ coCRLF + //HERJA
'   			FROM CR_INTERES CINT, CR_CREDITO CCRE     '+ coCRLF +
' 	          	WHERE SIT_INTERES <> ''CA''    '+ coCRLF +
'   			AND CINT.ID_CREDITO=CCRE.ID_CREDITO    '+ coCRLF +
'   			AND IMP_INTERES<> 0    '+ coCRLF +
'   			  ' + vlCondicion + coCRLF +
'  ) CINTV	    '+ coCRLF +
'   UNION		    '+ coCRLF +
'   select CINTG.*,    '+ coCRLF +
//'   	    CASE WHEN (F_VENCIMIENTO>=   ' + vlF_corte + '   ) and  (( Imp_INTERES>Imp_pagado ) )       '+ coCRLF + //HERJA
'   	    CASE WHEN (F_VENCIMIENTO>=   ' + vlF_corte + '   ) AND  (SIT_INTERES IN (''AC'',''PA''))       '+ coCRLF + //HERJA
'             THEN ''INVI''     '+ coCRLF +
'     	    ELSE ''X''    '+ coCRLF +
'    		END AS IDENTIFICADOR,    '+ coCRLF +
'   		Imp_INTERES-IMP_PAGADO AS IMPORTE    '+ coCRLF +
'   		from (    '+ coCRLF +
'    SELECT CCRE.ID_CONTRATO,CINT.ID_CREDITO, NUM_PERIODO,CASE WHEN CINT.NUM_PERIODO<>1 then  CINT.F_VENCIMIENTO- CINT.PLAZO +1 ELSE CINT.F_VENCIMIENTO- CINT.PLAZO END AS F_INICIO, CINT.F_VENCIMIENTO, PLAZO,    '+ coCRLF +
'   			PKGCRCOMUN.FUNOBTENTASA(''IN'',CINT.ID_CREDITO, NUM_PERIODO, CINT.F_VENCIMIENTO-1 )  -SOBRETASA TASA_BASE,    '+ coCRLF +
'   			SOBRETASA AS SOBRETASA,    '+ coCRLF +
'   			PKGCRCOMUN.FUNOBTENTASA(''IN'',CINT.ID_CREDITO, NUM_PERIODO, CINT.F_VENCIMIENTO-1 )  AS TASA_FINAL,     '+ coCRLF +
'   			Imp_Interes,    '+ coCRLF +
'   			PKGCRCOMUN.STPOBTIMPPAGADO(''IN'',''IMPBRU'',CINT.ID_CREDITO,NUM_PERIODO,NULL,    ' + vlF_corte + '   ,''V'') AS Imp_Pagado,    '+ coCRLF +
'   			 F_PAGO,     '+ coCRLF +
//'    			 IMP_IVA-IMP_IVA_PAGADO AS IVA,     '+ coCRLF +
'    			 IMP_IVA AS IVA,     '+ coCRLF +
'   			 IMP_MORATORIO,    '+ coCRLF +
'   			 IMP_IVA_MORA,    '+ coCRLF +
'   			 PKGCRPERIODO.FUNOBTENMORA(4,''V'',CINT.ID_CREDITO, NUM_PERIODO,NULL,null,    ' + vlF_corte + '   +1,NULL) IMP_MORA_IMP,    '+ coCRLF +
'   			 PKGCRPERIODO.FUNOBTENMORA(4,''F'',CINT.ID_CREDITO, NUM_PERIODO,NULL,null,    ' + vlF_corte + '   +1,NULL) IMP_IVA_MORA_IMP,    '+ coCRLF +
'   			 PKGCRCOMUN.STPOBTIMPPAGADO(''IN'',''IMPMOR'',CINT.ID_CREDITO,NUM_PERIODO,NULL,    ' + vlF_corte + '   ,''V'') AS Imp_Pag_Moras,    '+ coCRLF +
'   			 PKGCRCOMUN.STPOBTIMPPAGADO(''IN'',''IVAMOR'',CINT.ID_CREDITO,NUM_PERIODO,NULL,    ' + vlF_corte + '   ,''V'') AS IVA_Pag_Moras    '+ coCRLF +
'                        ,SIT_INTERES '+ coCRLF + //HERJA
'   			FROM CR_INTERES CINT, CR_CREDITO CCRE     '+ coCRLF +
' 	          	WHERE SIT_INTERES <> ''CA''    '+ coCRLF +
'   			AND CINT.ID_CREDITO=CCRE.ID_CREDITO    '+ coCRLF +
'   			AND IMP_INTERES<> 0    '+ coCRLF +
'       ' + vlCondicion + coCRLF +
'       ) CINTG    '+ coCRLF + 
'   		) CCFA    '+ coCRLF +
'   WHeRE IDENTIFICADOR <> ''X''    '+ coCRLF +
'   ) CTOD   '+ coCRLF +
' ) ZZZ,  '+ coCRLF +
{
' ( SELECT    DISTINCT CCRE.ID_cREDITO ID_CREDITO,  PKGCRCOMUN.FUNOBTENTASA(''CP'',CCAP.ID_CREDITO, NUM_PERIODO, CCAP.F_VENCIMIENTO-1 )  -CCRE.SOBRETASA TASA_BASE_Ad,    '+ coCRLF +
'   				CCRE.SOBRETASA AS SOBRETASA_Ad,    '+ coCRLF +
'   				PKGCRCOMUN.FUNOBTENTASA(''CP'',CCAP.ID_CREDITO, NUM_PERIODO, CCAP.F_VENCIMIENTO-1 )  AS TASA_FINAL_Ad,    '+ coCRLF +
'                               PKGCRCOMUN.FUNOBTENTASA(''CP'',CCAP.ID_CREDITO, NUM_PERIODO, CCAP.F_VENCIMIENTO-1 )*FACT_MORAS  TASA_MORA_AD , CVE_MONEDA MONEDA_AD'+ coCRLF +
'   				FROM CR_CAPITAL CCAP, CR_CREDITO CCRE , CR_CONTRATO CCONT    '+ coCRLF +
'   				WHERE SIT_CAPITAL <> ''CA''    '+ coCRLF +
'   				AND CCAP.ID_CREDITO=CCRE.ID_CREDITO    '+ coCRLF +
'   				AND CCRE.ID_CONTRATO=CCONT.ID_CONTRATO '+ coCRLF +
'  			        '+vlCondicion+'    '+ coCRLF +
'                               order by ccre.id_credito  '+ coCRLF +
}
' ( SELECT CCRE.ID_CREDITO , CCRE.TASA_CREDITO-CCRE.SOBRETASA TASA_BASE_aD,CCRE.SOBRETASA SOBRETASA_AD, CCRE.TASA_CREDITO TASA_FINAL_AD, '+coCRLF +
'   DECODE( CCRE.CVE_CALCULO_M, NULL, CCRE.TASA_CREDITO* FACT_MORAS ,DECODE (OPERADOR_STASA_M,''*'', CCRE.TASA_CREDITO*SOBRETASA_M,      '+coCRLF +
'                                         						      ''+'', CCRE.TASA_CREDITO+SOBRETASA_M,      '+coCRLF +
' 				                                                              ''-'', CCRE.TASA_CREDITO-SOBRETASA_M,      '+coCRLF +
'											      ''/'', CCRE.TASA_CREDITO/SOBRETASA_M ) ) TASA_MORA_AD,   cve_calculo_m, Operador_sTasa_m, sobretasa_m, fact_moras as fact_moras_m, '+coCRLF +
' CVE_MONEDA MONEDA_AD'+ coCRLF +
' FROM CR_CREDITO CCRE, CR_CONTRATO CCON '+ coCRLF +
' WHERE CCRE.ID_CONTRATO=CCON.ID_CONTRATO '+ coCRLF +vlCondicion+'    '+ coCRLF +
' order by ccre.id_credito  '+ coCRLF +
' ) LLL '+ coCRLF +
' WHERE ESTATUS IN (2,3) '+ coCRLF +
' AND ZZZ.ID_CREDITO=LLL.ID_CREDITO '+ coCRLF +
//' GROUP BY ID_CONTRATO, TO_CHAR(F_INICIO,''YYYY''), ZZZ.ID_CREDITO, tasa_base_ad, sobretasa_ad, tasa_final_ad, tasa_mora_ad, moneda_Ad '+ coCRLF +
' GROUP BY ID_CONTRATO, ''ANIO'', ZZZ.F_VENCIMIENTO, TASA_BASE,  SOBRETASA,  TASA_FINAL, ZZZ.ID_CREDITO, tasa_base_ad, sobretasa_ad, tasa_final_ad, tasa_mora_ad, moneda_Ad, cve_calculo_m,FACT_MORAS_M, sobretasa_m, operador_stasa_m '+ coCRLF +
//' ORDER BY ID_CONTRATO, TO_CHAR(F_INICIO,''YYYY''), ZZZ.ID_CREDITO'+ coCRLF +
' ORDER BY ID_CONTRATO, ZZZ.ID_CREDITO, F_VEN_PER '+ coCRLF +
' ) U_6 '+ coCRLF +
// termina ultima union U_6
'  ) XXX   '+ coCRLF +
' ORDER BY ID_CONTRATO,ESTATUS, CONCEPTO, F_VEN_PER, F_OPERACION, '+vlorden; //f_vencimiento,ID_CREDITO  ';


   Result:=sSQL;
End;

procedure TQREdoCC.GrpDetalleBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
printBand:=true;
if (qyQueryESTATUS.AsInteger = 0 )OR
   (qyQueryESTATUS.AsInteger = 5) OR
   (qyQueryESTATUS.AsInteger = 6) OR
   (qyQueryCONCEPTO.AsInteger = 4)
 then printBand:=False;

 if qyQueryESTATUS.AsInteger=1
 then lbTitulo9.Font.Color:=clBlack
 else  lbTitulo9.Font.Color:=clWhite;

  if qyQueryESTATUS.AsInteger=1
 then QRDBText18.Font.Color:=clBlack
 else  QRDBText18.Font.Color:=clWhite;

 IF qyQueryCONCEPTO.ASinteger = 3 THEN
 Begin
    lbTitulo5.Font.color:=clWhite;
    lbTitulo6.Font.color:=clWhite;
    lbTitulo7.Font.color:=clWhite;
 End
 else
 Begin
    lbTitulo5.Font.color:=clBlack;
    lbTitulo6.Font.color:=clBlack;
    lbTitulo7.Font.color:=clBlack;
 End;


 case  qyQueryESTATUS.AsInteger OF
//   0,5,6:printBand:=false;
   1:case qyQueryCONCEPTO.AsInteger OF
     1:qrTituloSegmento.Caption:='INTERESES ORDINARIOS CAPITALIZADOS PAGADOS';
     2:qrTituloSegmento.Caption:='INTERESES ORDINARIOS PAGADOS';
     3:qrTituloSegmento.Caption:='CAPITAL PAGADO';
     4:qrTituloSegmento.Caption:='CONCEPTOS PAGADOS';
     END;
   2:case qyQueryCONCEPTO.AsInteger OF
     1:qrTituloSegmento.Caption:='INTERESES ORDINARIOS CAPITALIZADOS VENCIDOS';
     2:qrTituloSegmento.Caption:='INTERESES ORDINARIOS VENCIDOS';
     3:qrTituloSegmento.Caption:='CAPITAL VENCIDO';
     4:qrTituloSegmento.Caption:='CONCEPTOS VENCIDOS';
     END;
   3:case qyQueryCONCEPTO.AsInteger OF
     1:qrTituloSegmento.Caption:='INTERESES ORDINARIOS CAPITALIZADOS VIGENTES';
     2:qrTituloSegmento.Caption:='INTERESES ORDINARIOS VIGENTES';
     3:qrTituloSegmento.Caption:='CAPITAL VIGENTE';
     4:qrTituloSegmento.Caption:='CONCEPTOS VIGENTES';
     END;
END;
 If qyQueryCONCEPTO.AsInteger=4 then PrintBand:=false;
end;

procedure TQREdoCC.BandaDetalleBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
PrintBand:=TRUE;
if (qyQueryESTATUS.AsInteger = 0 )OR
   (qyQueryESTATUS.AsInteger = 5) OR
   (qyQueryESTATUS.AsInteger = 6) OR
   (qyQueryCONCEPTO.AsInteger = 4)
 then printBand:=False;

 IF qyQueryESTATUS.AsInteger = 2 THEN
    DT_DATO9.Font.Color:=clWhite
 ELSE
    DT_DATO9.Font.Color:=clBlack;

 IF qyQueryCONCEPTO.ASinteger = 3 THEN
 Begin
    dt_Dato5.Font.color:=clWhite;
    dt_Dato6.Font.color:=clWhite;
    dt_Dato7.Font.color:=clWhite;
 End
 else
 Begin
    dt_Dato5.Font.color:=clBlack;
    dt_Dato6.Font.color:=clBlack;
    dt_Dato7.Font.color:=clBlack;
 End;
end;

procedure TQREdoCC.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
PrintBand:=false;
if qyQueryESTATUS.AsInteger = 0 then printBand:=true;
end;

procedure TQREdoCC.GrpContratoAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin


TotCapVig:=0;
TotCapVdo:=0;
TotCapMor:=0;
TotCapMorIVA:=0;
TotFaVig:=0;
TotFaVdo:=0;
TotFAMor:=0;
TotFAMorIVA:=0;
TotIntVig:=0;
TotIntVdo:=0;
TotIvaIntVig:=0;
TotIvaIntVdo:=0;
TotIntMor:=0;
TotCoPag:=0;
TotIvaCoPag:=0;
TotCoMoraPag:=0;
TotCoIvaMoraPag:=0;

TotCOVig:=0;
TotIvaCoVIg:=0;
TotCoMoraVig:=0;
TotCoIvaMoraVig:=0;

TotCOVdo:=0;
TotIvaCoVdo:=0;
TotCoMoraVdo:=0;
TotCoIvaMoraVdo:=0;

TotCOMor:=0;
TotCOIvaMor:=0;

TotCapDisp:=0;

TotCapital:=0;
TotFinadic:=0;
TotIntereses:=0;
TotConceptos:=0;
TotMoratorios:=0;
TotIVas     :=0;

TotConPAg1:=0;
TotConVen1:=0;
TotConVig1:=0;

TotCapAD:=0;
TotFINADICAD:=0;
TotInteresad:=0;
TotConceptosAd:=0;
TotMoratoriosAd:=0;
TotIVaAD:=0;
TotAdeudo:=0;


end;

procedure TQREdoCC.ChildBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
PrintBand:=false;
if qyQueryESTATUS.AsInteger = 5 then printBand:=true;

end;

procedure TQREdoCC.GrpPieDetalleBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
PrintBand:=true;
if (qyQueryESTATUS.AsInteger = 0)  OR
   (qyQueryESTATUS.AsInteger = 5)  OR
   (qyQueryESTATUS.AsInteger = 6)  or (qyQueryCONCEPTO.AsInteger = 4)then printBand:=false;

end;


procedure TQREdoCC.BandaDetalleAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
if qyQueryIDENTIFICADOR.AsString='FAVI'
then TotFAvig:=TotFAvig+qyQueryIMPORTE.ASFloat;
if qyQueryIDENTIFICADOR.AsString='FAVD'
then TotFAVdo:=TotFAVdo+qyQueryIMPORTE.ASFloat;
if qyQueryCONCEPTO.ASinteger=1
then
begin
   TotFAMor:=TotFAMor+qyQueryIMP_MORA.ASFloat;
   TotFAMorIVA:=TotFAMorIVA+qyQueryIMP_IVA_MORA.ASFloat;   
end;

if qyQueryIDENTIFICADOR.AsString='INVI'
then
  Begin
  TotIntvig:=TotIntvig+qyQueryIMPORTE.ASFloat;
  TotIvaIntVig:=TotIvaIntVig+qyQueryIVA.ASFloat;
  end;
if qyQueryIDENTIFICADOR.AsString='INVD'
then
  Begin
  TotIntVdo:=TotIntVdo+qyQueryIMPORTE.ASFloat;
  TotIvaIntVdo:=TotIvaIntVdo+qyQueryIVA.ASFloat;
  End;
if qyQueryCONCEPTO.ASinteger=2
then TotIntMor:=TotIntMor+qyQueryIMP_MORA.ASFloat;

if qyQueryIDENTIFICADOR.AsString='CAVI'
then TotCapvig:=TotCapvig+qyQueryIMPORTE.ASFloat;
if qyQueryIDENTIFICADOR.AsString='CAVD'
then TotCapVdo:=TotCapVdo+qyQueryIMPORTE.ASFloat;
if qyQueryCONCEPTO.ASinteger=3
then
begin
   TotCapMor:=TotCapMor+qyQueryIMP_MORA.ASFloat;
   TotCapMorIVA:=TotCapMorIVA+qyQueryIMP_IVA_MORA.ASFloat;
end;

if qyQueryIDENTIFICADOR.AsString='COPA'
then
Begin
TotCOPag:=TotCOPag+qyQueryIMPORTE.ASFloat;
TotIvaCoPag:=TotIvaCoPag+qyQueryIVA.ASFloat;
TotCoMoraPag:=TotCoMoraPag+qyQueryIMP_MORA.ASFloat;
TotCoIvaMoraPag:=TotCoIvaMoraPag+qyQueryIMP_iVA_MORA.ASFloat;
end;
if qyQueryIDENTIFICADOR.AsString='COVI'
then
Begin
  TotCOvig:=TotCOvig+qyQueryIMPORTE.ASFloat;
  TotIvaCoVig:=TotIvaCoVig+qyQueryIVA.ASFloat;
  TotCoMoraVig:=TotCoMoraVig+qyQueryIMP_MORA.ASFloat;
  TotCoIvaMoraVig:=TotCoIvaMoraVig+qyQueryIMP_iVA_MORA.ASFloat;

end;
if qyQueryIDENTIFICADOR.AsString='COVD'
then
Begin
   TotCOVdo:=TotCOVdo+qyQueryIMPORTE.ASFloat;
   TotIvaCoVdo:=TotIvaCoVdo+qyQueryIVA.ASFloat;
   TotCoMoraVdo:=TotCoMoraVdo+qyQueryIMP_MORA.ASFloat;
   TotCoIvaMoravdo:=TotCoIvaMoraVdo+qyQueryIMP_iVA_MORA.ASFloat;
end;
if qyQueryCONCEPTO.ASinteger=4
then
Begin
   TotCOMor:=TotCOMor+qyQueryIMP_MORA.ASFloat;
   TotCoIvaMor:=TotCoIvaMor+qyQueryIMP_iVA_MORA.ASFloat;
end;

end;

procedure TQREdoCC.bandadetalle2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
//PrintBand:=false;
//if qyQueryESTATUS.ASinteger=0 then PrintBand:=true


end;

procedure TQREdoCC.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
if (qyQueryESTATUS.ASinteger=0)
then PrintBand:=true
else PrintBand:=false;

end;

procedure TQREdoCC.GrpContratoBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
if  trim(vgFFirmoContrato) <> ''
then qrlFechaFirma.Caption  :=vgFFirmoContrato
else qrlFechaFirma.Caption  :=FormatDateTime('dd "de" mmmm "de" yyyy',qyQueryF_AUT_COMITE.AsDateTime);

if trim(vgImpCredConced) <> ''
then  qrlImportConcedido.caption:=vgImpCredConced
else  qrlImportConcedido.caption:=FormatFloat('$###,###,##0.00',qyQueryIMP_AUTORIZADO.AsFloat);

if trim(vgIntOrdPact) <> ''
then qrlIntOrdPact.Caption  :=vgIntOrdPact
else qrlIntOrdPact.Caption  :='TASA '+trim(qyQueryCVE_TASA_REFER.AsString)+' '+trim(qyQueryOPERADOR_STASA.AsString)+' '+trim(qyQuerySOBRETASACONT.AsString)+' PUNTOS PORCENTUALES';

if trim(vgIntMoraPact) <> ''
then qrlFactorMoras.Caption :=vgIntMoraPact
else qrlFactorMoras.Caption :=qyQueryFACT_MORAS.AsString+ ' VECES LA TASA PORCENTUAL';

if trim(vgFecVenCont)  <> ''
THEN qrlFechaVenc.Caption   :=vgFecVenCont
ELSE qrlFechaVenc.Caption   :=FormatDateTime('dd "de" mmmm "de" yyyy',qyQueryF_VEN_CONT.AsDateTime);

lbTitulo5.Caption:='TASA '+qyQueryCVE_TASA_REFER.AsString;
lbTitulo7.Caption:='TASA '+trim(qyQueryCVE_TASA_REFER.AsString)+' '+trim(qyQueryOPERADOR_STASA.AsString)+' '+trim(qyQuerySOBRETASACONT.AsString);
qrlabel49.Caption:='TASA '+trim(qyQueryCVE_TASA_REFER.AsString);
qrlabel51.Caption:='TASA '+trim(qyQueryCVE_TASA_REFER.AsString)+' '+trim(qyQueryOPERADOR_STASA.AsString)+' '+trim(qyQuerySOBRETASACONT.AsString);
end;

procedure TQREdoCC.ChildBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
PrintBand:=false;
if qyQueryESTATUS.AsInteger = 0 then printBand:=true;
end;

procedure TQREdoCC.ChildBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
PrintBand:=false;
if qyQueryESTATUS.AsInteger = 6 then printBand:=true;
    qrlCapVig.Caption:=FormatFloat('###,###,###,##0.00',TotCapvig);
    qrlCapVdo.Caption:=FormatFloat('###,###,###,##0.00',totCapVdo);
    qrlCapMor.Caption:=FormatFloat('###,###,###,##0.00',TotCapMor);
    qrlCapMorIVA.Caption:=FormatFloat('###,###,###,##0.00',TotCapMorIVA);
    qrlFAVig.Caption:=FormatFloat('###,###,###,##0.00',TotFaVig);
    qrlFAVdo.Caption:=FormatFloat('###,###,###,##0.00',TotFaVdo);
    qrlFAMor.Caption:=FormatFloat('###,###,###,##0.00',totFaMor);
    qrlFAMorIVA.Caption:=FormatFloat('###,###,###,##0.00',totFaMorIVA);

    qrlINTVig.Caption:=FormatFloat('###,###,###,##0.00',totIntVig);
    qrlINTVigIva.Caption:=FormatFloat('###,###,###,##0.00',TotIvaIntVig);    
    qrlIntVdo.Caption:=FormatFloat('###,###,###,##0.00',TotIntVdo);
    qrlIntVdoIVA.Caption:=FormatFloat('###,###,###,##0.00',TotIvaIntVdo);
//    qrlIntMor.Caption:=FormatFloat('###,###,###,##0.00',TotIntMor);
    qrlConVig.Caption:=FormatFloat('###,###,###,##0.00',TotCoVig);
    qrlConVigIVA.Caption:=FormatFloat('###,###,###,##0.00',totIvaCoVig);
    qrlConVdo.Caption:=FormatFloat('###,###,###,##0.00',TotCoVdo);
    qrlConVdoIVA.Caption:=FormatFloat('###,###,###,##0.00',totIvaCoVdo);
    qrlConMor.Caption:=FormatFloat('###,###,###,##0.00',TotCoMor);
    qrlConMorIVA.Caption:=FormatFloat('###,###,###,##0.00',TotCoIvaMor);
    qrTotalAdeudo.Caption:=FormatFloat('###,###,###,##0.00',TotCapvig +totCapVdo+TotCapMor+TotCapMorIVA+TotFaVig+TotFaVdo+totFaMor+totFaMorIVA+totIntVig+TotIvaIntVig+
                                                            TotIntVdo+TotIvaIntVdo+ TotCoVig+totIvaCoVig+TotCoVdo+totIvaCoVdo+TotCoMor+TotCoIvaMor);

end;

procedure TQREdoCC.ChildBand5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
PrintBand:=false;
if qyQueryESTATUS.AsInteger = 5 then printBand:=true;
end;

procedure TQREdoCC.ChildBand6BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
PrintBand:=false;
qrlCapDispuesto.Caption:=FormatFloat('###,###,###,##0.00',TotCapDisp);
if qyQueryESTATUS.AsInteger = 0 then printBand:=true;
end;

procedure TQREdoCC.ChildBand7BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
PrintBand:=false;
qrlTotCapital.Caption:=FormatFloat('###,###,###,##0.00',TotCapital);
qrlTotFinadic.Caption:=FormatFloat('###,###,###,##0.00',TotFinadic);
qrlTotIntereses.Caption:=FormatFloat('###,###,###,##0.00',TotIntereses);
qrlTotConceptos.Caption:=FormatFloat('###,###,###,##0.00',TotConceptos);
qrlTotMoratorios.Caption:=FormatFloat('###,###,###,##0.00',TotMoratorios);
qrlTotIvas.Caption:=FormatFloat('###,###,###,##0.00',Totivas);

if qyQueryESTATUS.AsInteger = 5 then printBand:=true;

end;

procedure TQREdoCC.ChildBand3AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
   TotCapDisp:=totCapdisp+qyQueryIMPORTE.AsFloat;
end;

procedure TQREdoCC.ChildBand5AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
TotCapital:=TotCapital+qyQUERYCAPITAL.AsFloat;
TotFinadic:=TotFinadic+qyQUERYFINADIC.AsFloat;
TotIntereses:=TotIntereses+qyQUERYINTERES.AsFloat;
TotConceptos:=TotConceptos+qyQUERYCONCEPTOS.AsFloat;
TotMoratorios:=totMoratorios+qyQUERYMORATORIOS.AsFloat;
TotIVas     :=TotIvas+qyQUERYIVAS.AsFloat;
end;

procedure TQREdoCC.ChildBand8BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
PrintBand:=false;
if qyQueryCONCEPTO.AsInteger = 4 then printBand:=true;
end;

procedure TQREdoCC.ChildBand9BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
PrintBand:=false;
if qyQueryCONCEPTO.AsInteger = 4 then printBand:=true;
 case qyQueryESTATUS.AsInteger OF
     1:qrlConceptos.Caption:='CONCEPTOS PAGADOS';
     2:qrlConceptos.Caption:='CONCEPTOS VENCIDOS';
     3:qrlConceptos.Caption:='CONCEPTOS VIGENTES';
     END;
end;

procedure TQREdoCC.ChildBand10BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
PrintBand:=false;
if qyQueryCONCEPTO.AsInteger = 4
then
Begin
    case qyQueryESTATUS.AsInteger of
    1:Begin
       qrlTotConcepto.Caption:=FormatFloat('###,###,###,##0.00',TotCoPag);
       qrlTotIvaCo.Caption:=FormatFloat('###,###,###,##0.00',TotIvaCoPag);
       qrlTotMoraCon.Caption:=FormatFloat('###,###,###,##0.00',TotCoMoraPag);
       qrlTotMorIvaCon.Caption:=FormatFloat('###,###,###,##0.00',TotCoIvaMoraPag);
      end;
    2:Begin
       qrlTotConcepto.Caption:=FormatFloat('###,###,###,##0.00',TotCoVdo);
       qrlTotIvaCo.Caption:=FormatFloat('###,###,###,##0.00',TotIvaCoVdo);
       qrlTotMoraCon.Caption:=FormatFloat('###,###,###,##0.00',TotCoMoraVdo);
       qrlTotMorIvaCon.Caption:=FormatFloat('###,###,###,##0.00',TotCoIvaMoraVdo);
      end;
    3: Begin
       qrlTotConcepto.Caption:=FormatFloat('###,###,###,##0.00',TotCOVig);
       qrlTotIvaCo.Caption:=FormatFloat('###,###,###,##0.00',TotIvaCoVig);       
       qrlTotMoraCon.Caption:=FormatFloat('###,###,###,##0.00',TotCoMoraVig);
       qrlTotMorIvaCon.Caption:=FormatFloat('###,###,###,##0.00',TotCoIvaMoraVig);

       end;
    end;
    printBand:=true;
end;

end;

procedure TQREdoCC.ChildBand12BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
PrintBand:=false;
if qyQueryESTATUS.AsInteger = 6 then printBand:=true;
end;



procedure TQREdoCC.ChildBand13BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var vlTotalletra:string;
      function Convierteletras(Numero:real;Moneda:integer):String;
      var stpTotConLetra : TStoredProc;
      Begin
       Try
         stpTotConLetra:=TStoredProc.Create(Nil);
         stpTotConLetra.DatabaseName:=Apli.DataBaseName;
         stpTotConLetra.SessionName:=Apli.SessionName;
         stpTotConLetra.StoredProcName:='STPNUMEROATEXTO';
         stpTotConLetra.Params.Clear;

         stpTotConLetra.Params.CreateParam(ftFloat,'pNumero',ptInput);
         stpTotConLetra.Params.CreateParam(ftInteger,'pIdMoneda',ptInput);
         stpTotConLetra.Params.CreateParam(ftString,'pResultado',ptOutput);
         stpTotConLetra.Prepare;
         stpTotConLetra.ParamByName('pNumero').AsFloat := TotAdeudo;
         stpTotConLetra.ParamByName('pIdMoneda').asInteger:= moneda;
         stpTotConLetra.ExecProc;
         Result:=stpTotConLetra.ParamByName('pResultado').asstring;
      Finally
         If  stpTotConLetra <> Nil Then Begin
             stpTotConLetra.UnPrepare;
             stpTotConLetra.Free;
         End;
      End;
  end;
begin

PrintBand:=false;



// OJO HACERLO PROCEDIMIENTO

if qyQueryCONCEPTO.AsInteger = 6
then
Begin
PrintBand:=true;
qrlTotCapAd.Caption:=FormatFloat('###,###,###,##0.00',TotCapAD);
qrlTotFinadicAd.Caption:=FormatFloat('###,###,###,##0.00',TotFinadicAD);
qrlTotInteresAd.Caption:=FormatFloat('###,###,###,##0.00',TotInteresAD);
qrlTotConceptosAd.Caption:=FormatFloat('###,###,###,##0.00',TotConceptosAD);
qrlTotMoratoriosAd.Caption:=FormatFloat('###,###,###,##0.00',TotMoratoriosAD);
qrlTotIvaAD.caption:=FormatFloat('###,###,###,##0.00',TotIvaAD);
qrtTotAdeudo.Caption:=FormatFloat('###,###,###,##0.00',Totadeudo);
vlTotalLetra:=Convierteletras(TotAdeudo,qyQuerymoneda_ad.AsInteger );
qrlTotConLetra.Caption:='('+vlTotalLetra+')';
end;
end;

procedure TQREdoCC.ChildBand12AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  TotCapAD:=TotCapAD+qyQUERYCAPITAL_AD.AsFloat;
  TotFINADICAD:=TotFINADICAD+qyQUERYFINADIC_AD.AsFloat;+
  TotInteresad:=TotInteresad+qyQUERYINTERES_AD.AsFloat;
  TotConceptosAd:=TotConceptosAd+qyQUERYCONCEPTOS_AD.AsFloat;
  TotMoratoriosAd:=TotMoratoriosAd+qyQUERYMORATORIOS_AD.AsFloat;
  TotIvaAd:=TotIvaAd+qyQUERYIVAS_AD.AsFloat;
  TotAdeudo:=TotCapAD+TotFINADICAD+TotInteresad+TotConceptosAd+ TotMoratoriosAd + TotIvaAd;
end;

end.
