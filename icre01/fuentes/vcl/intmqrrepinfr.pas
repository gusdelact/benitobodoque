unit IntMQrRepInfr;
interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, unSQL2;
  
Const
   coCRLF      = #13#10;
type
  TQrRepInfr = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    qyRepInfr: TQuery;
    qrbDETALLE: TQRBand;
    QRDBText23: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText20: TQRDBText;
    QRLabel23: TQRLabel;
    QRExpr15: TQRExpr;
    ColumnHeaderBand1: TQRBand;
    QRShape17: TQRShape;
    QRLabel20: TQRLabel;
    QRShape16: TQRShape;
    QRLabel19: TQRLabel;
    QRShape15: TQRShape;
    QRLabel18: TQRLabel;
    QRShape1: TQRShape;
    QRLabel17: TQRLabel;
    QRShape13: TQRShape;
    QRLabel16: TQRLabel;
    QRShape12: TQRShape;
    QRLabel15: TQRLabel;
    QRShape6: TQRShape;
    QRLabel3: TQRLabel;
    QRShape9: TQRShape;
    QRLabel21: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText11: TQRDBText;
    QRFooterDisp: TQRBand;
    QRExpr2: TQRExpr;
    QRShape2: TQRShape;
    QRLabel5: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRLabel6: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRLabel13: TQRLabel;
    QRShape4: TQRShape;
    QRLabel14: TQRLabel;
    QRShape5: TQRShape;
    QRLabel22: TQRLabel;
    QRShape7: TQRShape;
    QRLabel2: TQRLabel;
    QRShape3: TQRShape;
    QRLabel11: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText7: TQRDBText;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRShape8: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel24: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRFooterMon: TQRBand;
    QRExpr11: TQRExpr;
    QRShape10: TQRShape;
    QRLabel25: TQRLabel;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr16: TQRExpr;
    QRExpr17: TQRExpr;
    QRExpr18: TQRExpr;
    QRExpr19: TQRExpr;
    QRExpr20: TQRExpr;
    QRLabel27: TQRLabel;
    QRDBText19: TQRDBText;
    QRFooterLinea: TQRBand;
    QRExpr21: TQRExpr;
    QRShape11: TQRShape;
    QRLabel26: TQRLabel;
    QRExpr22: TQRExpr;
    QRExpr23: TQRExpr;
    QRExpr24: TQRExpr;
    QRExpr25: TQRExpr;
    QRExpr26: TQRExpr;
    QRExpr27: TQRExpr;
    QRExpr28: TQRExpr;
    QRExpr29: TQRExpr;
    QRDBText8: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText18: TQRDBText;
    QRFooterAcred: TQRBand;
    QRExpr30: TQRExpr;
    QRShape14: TQRShape;
    QRLabel28: TQRLabel;
    QRExpr31: TQRExpr;
    QRExpr32: TQRExpr;
    QRExpr33: TQRExpr;
    QRExpr34: TQRExpr;
    QRExpr35: TQRExpr;
    QRExpr36: TQRExpr;
    QRExpr37: TQRExpr;
    QRExpr38: TQRExpr;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRLabel29: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel31: TQRLabel;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    qyRepInfrANIOMES: TStringField;
    qyRepInfrF_OPERACION: TDateTimeField;
    qyRepInfrID_CREDITO: TFloatField;
    qyRepInfrCVE_MONEDA: TFloatField;
    qyRepInfrID_CONTRATO: TFloatField;
    qyRepInfrID_TITULAR: TFloatField;
    qyRepInfrACREDITADO: TStringField;
    qyRepInfrF_INICIO: TDateTimeField;
    qyRepInfrF_VENCIMIENTO: TDateTimeField;
    qyRepInfrIMP_CREDITO: TFloatField;
    qyRepInfrSIT_CREDITO: TStringField;
    qyRepInfrSOBRETASA: TFloatField;
    qyRepInfrTASA_APLICADA: TFloatField;
    qyRepInfrTASA_TIIE: TFloatField;
    qyRepInfrPAGO_CP: TFloatField;
    qyRepInfrPAGO_CP_AN: TFloatField;
    qyRepInfrIN_GENERADO: TFloatField;
    qyRepInfrPAGO_IN: TFloatField;
    qyRepInfrPAGO_IN_AN: TFloatField;
    qyRepInfrPAGO_IN_FN: TFloatField;
    qyRepInfrPAGO_FN: TFloatField;
    qyRepInfrPAGO_FN_AN: TFloatField;
    qyRepInfrINT_EX: TStringField;
    QRShape21: TQRShape;
    QRLabel30: TQRLabel;
    QRShape22: TQRShape;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    qyRepInfrIMPINTEX: TFloatField;
    QRDBText24: TQRDBText;
    QRExpr10: TQRExpr;
    QRExpr39: TQRExpr;
    QRExpr40: TQRExpr;
    QRExpr41: TQRExpr;
    procedure SummaryBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbDETALLEBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbDETALLEAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRFooterDispAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRFooterDispBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroupMonBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFooterLineaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFooterLineaAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRFooterAcredAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRFooterAcredBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFooterMonBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFooterMonAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRGroupCredBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

    Function FormaQuery(sF_Al, sGpoProd, sAcreditado, sNOMBRE_ACRED,
                        sContrato,sDESC_C_PRODUCTO, sCesion,sID_PROMOTOR,sNOM_PROMOTOR,sID_PROM,sNOM_PROM,sSitCred : String):String;


  end;

var
  QrRepInfr: TQrRepInfr;
  bGenArch: Boolean;
  F: TextFile;
  sArchivo : String;
  vlNumCred : Integer;
  vlNumCrPr : Integer;
  vlIdCred  : Integer;
  vgFechaAl : String ;


  Procedure  RepInfr(sF_Al, sGpoProd, sAcreditado, sNOMBRE_ACRED,
                     sContrato,sDESC_C_PRODUCTO, sCesion,sID_PROMOTOR,sNOM_PROMOTOR,sID_PROM,sNOM_PROM,sTipRep,sSitCred,sNbrArch :String;
                     pAPli : TInterApli;
                     pPreview : Boolean);

var

   vgImpCred     : Currency;
   vgSdoFinal    : Currency;
   vgSdoFinalEx  : Currency;
   vgtextxls     : Currency;
   vgtextxlSDisp : Currency;
   vgtextxlSLin  : Currency;
   vgtextxlSAcre : Currency;
   vgtextxlSMone : Currency;
   vgImpIntEx    : Currency;
   vlcreditant   : String;
   TipRep        : String;

Implementation
{$R *.DFM}

Procedure RepInfr(sF_Al, sGpoProd, sAcreditado, sNOMBRE_ACRED,
                  sContrato,sDESC_C_PRODUCTO, sCesion,sID_PROMOTOR,sNOM_PROMOTOR,sID_PROM,sNOM_PROM,sTipRep,sSitCred,sNbrArch :String;
                  pAPli : TInterApli;
                  pPreview : Boolean);
Var
   QrRepInfr : TQrRepInfr;
   Preview   : TIntQRPreview;
   VLTitulo  : String;

Begin
   QrRepInfr:=TQrRepInfr.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QrRepInfr);
   Try
      VLTitulo := '';
      vgSdoFinal   := 0.00;
      vgSdoFinalEx := 0.00;
      vgImpCred    := 0.00;
      vgImpIntEx   := 0.00;
      vlcreditant  := '0';


      TipRep := sTipRep;

      bGenArch:= False;
      sArchivo:= sNbrArch;
      QrRepInfr.QRInterEncabezado1.Apli:=pApli;
      QrRepInfr.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
      QrRepInfr.QRInterEncabezado1.NomReporte:='IntMQrRepInfr';
      QrRepInfr.QRInterEncabezado1.Titulo1:='Reporte de Infraestructura con fecha de corte al: '+sF_Al;

        If (Trim(sGpoProd)<>'') Then
            VLTitulo := VLTitulo + ' Por Grupo Producto';

        If (Trim(sAcreditado)<>'') Then
            VLTitulo := VLTitulo + ' Por Acreditado '+sAcreditado+' - '+sNOMBRE_ACRED;

        If (Trim(sContrato)<>'') Then
            VLTitulo := VLTitulo + ' Por Línea '+ sContrato + ' - '+sDESC_C_PRODUCTO;

        If (Trim(sCesion)<>'') Then
            VLTitulo := VLTitulo + ' Por Disposición';

        If (Trim(sId_Promotor)<>'') Then
            VLTitulo := VLTitulo + ' Por Promotor Asoc. '+sId_Promotor +' - '+sNOM_PROMOTOR;

        If (Trim(sId_Prom)<>'') Then
            VLTitulo := VLTitulo + ' Por Promotor Admin. '+sId_Prom+' - '+sNOM_PROM;


      QrRepInfr.QRInterEncabezado1.Titulo2:='DETALLE '+ VLTitulo;

      QrRepInfr.qyRepInfr.DatabaseName := pApli.DataBaseName;
      QrRepInfr.qyRepInfr.SessionName := pApli.SessionName;

      QrRepInfr.qyRepInfr.Active:=False;
      QrRepInfr.qyRepInfr.SQL.Text:= QrRepInfr.FormaQuery(sF_Al, sGpoProd, sAcreditado, sNOMBRE_ACRED,
                                                          sContrato,sDESC_C_PRODUCTO, sCesion,sID_PROMOTOR,sNOM_PROMOTOR,sID_PROM,sNOM_PROM,sSitCred) ;
      vgFechaAl:= sF_Al ;
      QrRepInfr.qyRepInfr.SQL.SaveToFile('C:\RepInfr.sql');
      QrRepInfr.qyRepInfr.Active:=True;

      If Trim(sArchivo)<>'' Then Begin
         AssignFile(F, sArchivo);
         Rewrite(F);
         Writeln(F, 'BANCO INTERACCIONES, S.A.' + #09 );
         Writeln(F, 'Reporte de Infraestructura' + #09 );
         Writeln(F, 'Fecha al: ' + sF_Al + #09);
         Writeln(F, 'DETALLE '+ VLTitulo);         
         Writeln(F,  #09 );

      Writeln(F, 'AÑOMES' + #09 +
                 'F OPERACION' + #09 +
                 'CREDITO' + #09 +
                 'MONEDA'+ #09 +
                 'SITUACION' + #09 +
                 'CHEQUERA' + #09 +
                 'TITULAR' + #09 +
                 'NOM TITULAR' + #09 +
                 'F INICIO' + #09 +
                 'F VENCIM' + #09 +
                 'SDO INICIAL' + #09 +
                 'SOBRETASA' + #09 +
                 'TIIE' + #09 +
                 'TIIE + SOBT' + #09 +
                 'PAGO CP' + #09 +
                 'PAGO CP ANT' + #09 +
                 'INTERES GEN' + #09 +
                 'INTERÉS EX' + #09 +
                 'PAGO INT' + #09 +
                 'PAGO INT ANT' + #09 +
                 'PAGO INT FN' + #09 +
                 'PAGO FN' + #09 +
                 'PAGO FN ANT' + #09 +
                 'TOT. COB x MES'+ #09 +
                 'SDO INSOL NE'+ #09 +
                 'SDO INSOL EX'
                 );
                 
         Writeln(F, '');
      End;

      If pPreview Then
         QrRepInfr.Preview
      Else
         QrRepInfr.Print;
   Finally
      If Trim(sArchivo)<>'' Then Begin
         bGenArch:= True;
         CloseFile(F);
      End;
      QrRepInfr.free;                              
      If Assigned(Preview) Then Preview.Free;
   End;
End;

Function TQrRepInfr.FormaQuery(sF_Al, sGpoProd, sAcreditado, sNOMBRE_ACRED,
                               sContrato,sDESC_C_PRODUCTO, sCesion,sID_PROMOTOR,sNOM_PROMOTOR,sID_PROM,sNOM_PROM,sSitCred: String ):String;
Var
    sSQL:String;
Begin

    sSQL:= ' select aniomes, f_operacion, id_credito, cve_moneda, id_contrato, id_titular, acreditado, f_inicio, f_vencimiento,' +coCRLF+
           '        imp_credito, sit_credito, sobretasa,  tasa_aplicada,' +coCRLF+
           '        (CASE WHEN tasa_aplicada <> 0 THEN tasa_aplicada - sobretasa else 0 end) as tasa_tiie,' +coCRLF+
           '        PAGO_CP,PAGO_CP_AN,in_generado, IMPINTEX, PAGO_IN,PAGO_IN_AN,PAGO_IN_FN,PAGO_FN,PAGO_FN_AN,' +coCRLF+
           '        CAST(PKGCRCOMUN.FUN_EXIGIBLE(base.id_credito, aniomes,'+SQLFecha(StrToDate(sF_Al))+', PAGO_IN_AN) AS VARCHAR2(5)) INT_EX' +coCRLF+
           '  from' +coCRLF+
           '   (' +coCRLF+
           '     select fech.aniomes, null as f_operacion, fech.id_credito, cve_moneda, id_contrato, id_titular, acreditado, f_inicio, f_vencimiento, imp_credito, sit_credito, sobretasa,' +coCRLF+
           '            (select tasa_aplicada from cre_prov_diaria' +coCRLF+
           '                where id_credito = fech.id_credito' +coCRLF+
           '                  and TO_CHAR (f_provision, ''YYYY/MM'') = fech.aniomes' +coCRLF+
           '                  and f_provision = (select max(f_provision) -1 from cre_prov_diaria where id_credito = fech.id_credito and TO_CHAR (f_provision, ''YYYY/MM'') = fech.aniomes)' +coCRLF+
           '              ) tasa_aplicada,' +coCRLF+
           '                    0 as PAGO_CP,0 as PAGO_CP_AN,in_generado, ' +coCRLF+
           '                    NVL(intex.imp_interes,0) AS IMPINTEX, ' +coCRLF+           //RABA AGO 2014
           '                    0 as PAGO_IN,0 as PAGO_IN_AN,0 as PAGO_IN_FN,0 as PAGO_FN,0 as PAGO_FN_AN' +coCRLF+
           '       from' +coCRLF+
           '               (SELECT crh.id_credito, crh.cve_moneda, TO_CHAR (crh.f_cierre, ''YYYY/MM'') AS aniomes,' +coCRLF+
           '                      SUM (crh.imp_interes_dia) + SUM (crh.imp_interes_fv) + SUM (crh.imp_ajuste_in) AS in_generado,' +coCRLF+
           '                      crh.id_contrato, crh.id_titular,' +coCRLF+
           '                      CAST(pkgcrconsolidado.fun_nom_tit_cred (crh.id_titular) AS VARCHAR2 (100)) acreditado,' +coCRLF+
           '                      crh.f_inicio, crh.f_vencimiento, crh.sobretasa,' +coCRLF+
           '                      crh.imp_credito, crh.sit_credito' +coCRLF+
           '                FROM (' +coCRLF+
           '                 SELECT crc.id_credito, crc.id_contrato, crc.f_inicio,' +coCRLF+
           '                        crc.f_vencimiento, crc.sobretasa, crc.imp_credito,' +coCRLF+
//           '                        crc.sit_credito, crc.f_liquidacion, cnt.id_titular,' +coCRLF+      // RABA SE CAMBIA LA FORMA DE OBTENER LA SITUACIÓN DEL CREDITO
           '                        case when crc.sit_credito = ''LQ'' and crc.f_liquidacion > '+SQLFecha(StrToDate(sF_Al))+ ' then ''AC'' ' +coCRLF+
           '                             else crc.sit_credito end as sit_credito, ' +coCRLF+
           '                        crc.f_liquidacion, cnt.id_titular, ' +coCRLF+
//           '                        cnt.id_empresa, cnt.cve_moneda, cri.f_cierre + 1 f_cierre,' +coCRLF+    // RABA SE QUITA +1
           '                        cnt.id_empresa, cnt.cve_moneda, cri.f_cierre,' +coCRLF+
           '                        cri.imp_interes_dia, cri.imp_interes_fv, cri.imp_ajuste_in' +coCRLF+
           '                   FROM cr_credito crc,' +coCRLF+
           '                        cr_contrato cto,' +coCRLF+
           '                        cr_producto crp,' +coCRLF+
           '                        contrato cnt,' +coCRLF+
           '                        cr_histo_interes cri' +coCRLF+
           '                  WHERE 1 = 1' +coCRLF+
           '                    AND cto.id_contrato = crc.id_contrato' +coCRLF+
           '                    AND crc.id_credito = cri.id_credito' +coCRLF+
           '                    AND crp.cve_producto_cre = cto.cve_producto_cre' +coCRLF+
           '                    AND cnt.id_contrato = crc.id_contrato' +coCRLF;
           If Trim(sSitCred) <> '' then
              if Trim(sSitCred) = 'AC' then
              begin
                 sSQL:= sSQL + '                    AND ( (crc.sit_credito = ''AC'') or ' +coCRLF;
                 sSQL:= sSQL + '                          (crc.sit_credito = ''LQ'' and crc.f_liquidacion > '+SQLFecha(StrToDate(sF_Al))+ ') ) '+coCRLF;
              end
              else
                sSQL:= sSQL + '                    AND crc.sit_credito = '+sSitCred+' ' +coCRLF
           else
                sSQL:= sSQL + '                    AND crc.sit_credito <> ''CA'' '+coCRLF;
           if Trim(sCesion) <> '' then
           sSQL:= sSQL + '                    AND crc.id_credito = '+sCesion+''+coCRLF;
           if Trim(sContrato) <> '' then
           sSQL:= sSQL + '                    AND crc.id_contrato = '+sContrato+''+coCRLF;
           if Trim(sAcreditado) <> '' then
           sSQL:= sSQL + '                    AND cnt.id_titular = '+sAcreditado+''+coCRLF;
           if Trim(sId_Promotor) <> '' then
           sSQL:= sSQL + '                    AND cnt.ID_PERS_ASOCIAD = '+sId_Promotor+''+coCRLF;
           if Trim(sId_Prom) <> '' then
           sSQL:= sSQL + '                    AND crc.ID_PROM_ADM = '+sId_Prom+''+coCRLF;
           if Trim(sGpoProd) <> '' then
           sSQL:= sSQL + '                    AND crp.cve_producto_gpo in '+sGpoProd+coCRLF;

           sSQL:= sSQL +
           '            UNION ALL' +coCRLF+

           '                 SELECT crc.id_credito, crc.id_contrato, crc.f_inicio,' +coCRLF+
           '                        crc.f_vencimiento, crc.sobretasa, crc.imp_credito,' +coCRLF+
//           '                        crc.sit_credito, crc.f_liquidacion, cnt.id_titular,' +coCRLF+      // RABA SE CAMBIA LA FORMA DE OBTENER LA SITUACIÓN DEL CREDITO
           '                        case when crc.sit_credito = ''LQ'' and crc.f_liquidacion > '+SQLFecha(StrToDate(sF_Al))+ ' then ''AC'' ' +coCRLF+
           '                             else crc.sit_credito end as sit_credito, ' +coCRLF+
           '                        crc.f_liquidacion, cnt.id_titular, ' +coCRLF+
//           '                        cnt.id_empresa, cnt.cve_moneda, cre.f_provision + 1 f_cierre,' +coCRLF+   // RABA AGO 2013 SE QUITA +1
           '                        cnt.id_empresa, cnt.cve_moneda, cre.f_provision f_cierre,' +coCRLF+
           '                        cre.imp_interes_dia, 0 imp_interes_fv, 0 imp_ajuste_in' +coCRLF+
           '                   FROM cr_credito crc,' +coCRLF+
           '                        cr_contrato cto,' +coCRLF+
           '                        cr_producto crp,' +coCRLF+
           '                        contrato cnt,' +coCRLF+
// RABA AGO 2014 SE AGREGAN 3 CRÉDITOS A LOS QUE LES FALTA EL INTERES DEVENGADO POR LA COLOCACIÓN FECHA VALOR
//           '                        cre_prov_diaria cre' +coCRLF+
           '                        (select id_credito, f_provision, imp_interes_dia from cre_prov_diaria where  f_provision < TO_DATE (''01/01/2011'', ''dd/mm/yyyy'') ' +coCRLF+
           '                         union  ' +coCRLF+
           '                         select 47464 as id_credito, to_date(''02/03/2009'',''dd/mm/yyyy'') f_provision, 439157.99 imp_interes_dia from dual  ' +coCRLF+
           '                         union  ' +coCRLF+
           '                         select 47824 as id_credito, to_date(''01/07/2009'',''dd/mm/yyyy'') f_provision, 537846.36 imp_interes_dia from dual  ' +coCRLF+
           '                         union  ' +coCRLF+
           '                         select 47829 as id_credito, to_date(''01/07/2009'',''dd/mm/yyyy'') f_provision, 7163.75 imp_interes_dia from dual  ' +coCRLF+
           '                         )cre  ' +coCRLF+
           '                  WHERE 1 = 1' +coCRLF+
//           '                    AND f_provision < TO_DATE (''01/01/2011'', ''dd/mm/yyyy'')' +coCRLF+
// FIN RABA
           '                    AND cto.id_contrato = crc.id_contrato' +coCRLF+
           '                    AND crc.id_credito = cre.id_credito' +coCRLF+
           '                    AND crp.cve_producto_cre = cto.cve_producto_cre' +coCRLF+
           '                    AND cnt.id_contrato = crc.id_contrato' +coCRLF;
           If Trim(sSitCred) <> '' then
              if Trim(sSitCred) = 'AC' then
              begin
                 sSQL:= sSQL + '                    AND ( (crc.sit_credito = ''AC'') or ' +coCRLF;
                 sSQL:= sSQL + '                          (crc.sit_credito = ''LQ'' and crc.f_liquidacion > '+SQLFecha(StrToDate(sF_Al))+ ') ) '+coCRLF;
              end
              else
                sSQL:= sSQL + '                    AND crc.sit_credito = '+sSitCred+' ' +coCRLF
           else
                sSQL:= sSQL + '                    AND crc.sit_credito <> ''CA'' '+coCRLF;
           if Trim(sCesion) <> '' then
           sSQL:= sSQL + '                    AND crc.id_credito = '+sCesion+''+coCRLF;
           if Trim(sContrato) <> '' then
           sSQL:= sSQL + '                    AND crc.id_contrato = '+sContrato+''+coCRLF;
           if Trim(sAcreditado) <> '' then
           sSQL:= sSQL + '                    AND cnt.id_titular = '+sAcreditado+''+coCRLF;
           if Trim(sId_Promotor) <> '' then
           sSQL:= sSQL + '                    AND cnt.ID_PERS_ASOCIAD = '+sId_Promotor+''+coCRLF;
           if Trim(sId_Prom) <> '' then
           sSQL:= sSQL + '                    AND crc.ID_PROM_ADM = '+sId_Prom+''+coCRLF;
           if Trim(sGpoProd) <> '' then
           sSQL:= sSQL + '                    AND crp.cve_producto_gpo in '+sGpoProd+coCRLF;

           sSQL:= sSQL +
           '            UNION ALL' +coCRLF+

           '                 SELECT crc.id_credito, crc.id_contrato, crc.f_inicio,' +coCRLF+
           '                        crc.f_vencimiento, crc.sobretasa, crc.imp_credito,' +coCRLF+
//           '                        crc.sit_credito, crc.f_liquidacion, cnt.id_titular,' +coCRLF+      // RABA SE CAMBIA LA FORMA DE OBTENER LA SITUACIÓN DEL CREDITO
           '                        case when crc.sit_credito = ''LQ'' and crc.f_liquidacion > '+SQLFecha(StrToDate(sF_Al))+ ' then ''AC'' ' +coCRLF+
           '                             else crc.sit_credito end as sit_credito, ' +coCRLF+
           '                        crc.f_liquidacion, cnt.id_titular, ' +coCRLF+
           '                        cnt.id_empresa, cnt.cve_moneda, f_operacion AS f_cierre,' +coCRLF+
           '                        0 imp_interes_dia, 0 imp_interes_fv,' +coCRLF+
           '                        imp_concepto AS imp_ajuste_in' +coCRLF+
           '                   FROM cr_credito crc,' +coCRLF+
           '                        cr_contrato cto,' +coCRLF+
           '                        cr_producto crp,' +coCRLF+
           '                        contrato cnt,' +coCRLF+
           '                        cr_det_transac cd,' +coCRLF+
           '                        cr_transaccion crt' +coCRLF+
           '                  WHERE 1 = 1' +coCRLF+
           '                    AND cto.id_contrato = crc.id_contrato' +coCRLF+
           '                    AND crp.cve_producto_cre = cto.cve_producto_cre' +coCRLF+
           '                    AND cnt.id_contrato = crc.id_contrato' +coCRLF+
           '                    AND crt.id_credito = crc.id_credito' +coCRLF+
           '                    AND crt.id_transaccion = cd.id_transaccion' +coCRLF+
           '                    AND crt.cve_operacion = ''AJFVIN''' +coCRLF+
           '                    AND crt.f_operacion < TO_DATE (''01/01/2011'', ''dd/mm/yyyy'')' +coCRLF+
           '                    AND cd.cve_concepto = ''IMPBRU''' +coCRLF;
           If Trim(sSitCred) <> '' then
              if Trim(sSitCred) = 'AC' then
              begin
                 sSQL:= sSQL + '                    AND ( (crc.sit_credito = ''AC'') or ' +coCRLF;
                 sSQL:= sSQL + '                          (crc.sit_credito = ''LQ'' and crc.f_liquidacion > '+SQLFecha(StrToDate(sF_Al))+ ') ) '+coCRLF;
              end
              else
                sSQL:= sSQL + '                    AND crc.sit_credito = '+sSitCred+' ' +coCRLF
           else
                sSQL:= sSQL + '                    AND crc.sit_credito <> ''CA'' '+coCRLF;
           if Trim(sCesion) <> '' then
           sSQL:= sSQL + '                    AND crc.id_credito = '+sCesion+''+coCRLF;
           if Trim(sContrato) <> '' then
           sSQL:= sSQL + '                    AND crc.id_contrato = '+sContrato+''+coCRLF;
           if Trim(sAcreditado) <> '' then
           sSQL:= sSQL + '                    AND cnt.id_titular = '+sAcreditado+''+coCRLF;
           if Trim(sId_Promotor) <> '' then
           sSQL:= sSQL + '                    AND cnt.ID_PERS_ASOCIAD = '+sId_Promotor+''+coCRLF;
           if Trim(sId_Prom) <> '' then
           sSQL:= sSQL + '                    AND crc.ID_PROM_ADM = '+sId_Prom+''+coCRLF;
           if Trim(sGpoProd) <> '' then
           sSQL:= sSQL + '                    AND crp.cve_producto_gpo in '+sGpoProd+coCRLF;

           sSQL:= sSQL +
           '                     ) crh' +coCRLF+
           '             WHERE 1 = 1' +coCRLF+
           '               AND crh.f_cierre <=' +coCRLF+ //cambio de condicion <=
           '                               CASE' +coCRLF+
           '                                  WHEN crh.f_liquidacion IS NULL' +coCRLF+
           '                                     THEN ' +SQLFecha(StrToDate(sF_Al))+coCRLF+
           '                                  ELSE (CASE' +coCRLF+
           '                                           WHEN crh.f_liquidacion IS NOT NULL' +coCRLF+
           '                                           AND crh.f_liquidacion > ' +SQLFecha(StrToDate(sF_Al))+coCRLF+
           '                                              THEN  ' +SQLFecha(StrToDate(sF_Al))+' - 1' +coCRLF+
           '                                           ELSE crh.f_liquidacion' +coCRLF+
           '                                        END' +coCRLF+
           '                                       )' +coCRLF+
           '                               END' +coCRLF+
           '          GROUP BY crh.id_credito, crh.cve_moneda,' +coCRLF+
           '                   TO_CHAR (crh.f_cierre, ''YYYY/MM''),' +coCRLF+
           '                   crh.id_contrato,' +coCRLF+
           '                   crh.id_titular,crh.f_inicio, crh.f_vencimiento, crh.sobretasa, crh.imp_credito, crh.sit_credito' +coCRLF+
           '        ) fech, ' +coCRLF+
           // RABA AGO 2014 SE ADICIONA EL IMPORTE DE INTERES DE LA CUOTA PARA OBTENER EL INTERES EXIGIBLE POR MES
           '        (SELECT crc.ID_CREDITO, TO_CHAR (CRI.F_VENCIMIENTO, ''YYYY/MM'') AS ANIOMES, sum(CRI.IMP_INTERES) imp_interes ' +coCRLF+
           '         FROM cr_credito crc, ' +coCRLF+
           '              cr_contrato cto, ' +coCRLF+
           '              cr_producto crp, ' +coCRLF+
           '              contrato cnt, ' +coCRLF+
           '              cr_interes cri ' +coCRLF+
           '         WHERE 1 = 1 ' +coCRLF+
           '           AND cto.id_contrato = crc.id_contrato ' +coCRLF+
           '           AND crc.id_credito = cri.id_credito ' +coCRLF+
           '           AND crp.cve_producto_cre = cto.cve_producto_cre ' +coCRLF+
           '           AND cnt.id_contrato = crc.id_contrato ' +coCRLF+
           '           AND cri.sit_interes not in (''PA'', ''CA'') ' +coCRLF+
           '           AND cri.f_vencimiento <= '+SQLFecha(StrToDate(sF_Al));
           If Trim(sSitCred) <> '' then
              if Trim(sSitCred) = 'AC' then
              begin
                 sSQL:= sSQL + '                    AND ( (crc.sit_credito = ''AC'') or ' +coCRLF;
                 sSQL:= sSQL + '                          (crc.sit_credito = ''LQ'' and crc.f_liquidacion > '+SQLFecha(StrToDate(sF_Al))+ ') ) '+coCRLF;
              end
              else
                sSQL:= sSQL + '                    AND crc.sit_credito = '+sSitCred+' ' +coCRLF
           else
                sSQL:= sSQL + '                    AND crc.sit_credito <> ''CA'' '+coCRLF;
           if Trim(sCesion) <> '' then
           sSQL:= sSQL + '                    AND crc.id_credito = '+sCesion+''+coCRLF;
           if Trim(sContrato) <> '' then
           sSQL:= sSQL + '                    AND crc.id_contrato = '+sContrato+''+coCRLF;
           if Trim(sAcreditado) <> '' then
           sSQL:= sSQL + '                    AND cnt.id_titular = '+sAcreditado+''+coCRLF;
           if Trim(sId_Promotor) <> '' then
           sSQL:= sSQL + '                    AND cnt.ID_PERS_ASOCIAD = '+sId_Promotor+''+coCRLF;
           if Trim(sId_Prom) <> '' then
           sSQL:= sSQL + '                    AND crc.ID_PROM_ADM = '+sId_Prom+''+coCRLF;
           if Trim(sGpoProd) <> '' then
           sSQL:= sSQL + '                    AND crp.cve_producto_gpo in '+sGpoProd+coCRLF;

           sSQL:= sSQL +
           '         GROUP BY crc.ID_CREDITO, TO_CHAR (CRI.F_VENCIMIENTO, ''YYYY/MM'') ' +coCRLF+
           '         ) intex ' +coCRLF+
           '     where intex.id_credito(+)  = fech.id_credito ' +coCRLF+
           '       AND intex.aniomes(+)     = fech.aniomes ' +coCRLF+
           // FIN RABA
           '------------------------------------------------------------------------------ ' +coCRLF+
           '  union all' +coCRLF+
           '  select  TO_CHAR (f_operacion, ''YYYY/MM''), f_operacion, id_credito, cve_moneda, id_contrato, id_titular, CAST(pkgcrconsolidado.fun_nom_tit_cred (id_titular) AS VARCHAR2 (100)) acreditado,' +coCRLF+
           '          f_inicio, f_vencimiento, imp_credito, sit_credito,sobretasa,' +coCRLF+
  	   '          0 as tasa_aplicada,' +coCRLF+
  	   '	      PAGO_CP, PAGO_CP_AN, 0 as in_generado, 0 as IMPINTEX, PAGO_IN, PAGO_IN_AN, PAGO_IN_FN, PAGO_FN, PAGO_FN_AN' +coCRLF+
           '     from' +coCRLF+
           '      (SELECT  ct.id_credito, cr.cve_moneda,' +coCRLF+
           '               ct.f_operacion,' +coCRLF+
//           '               SUM(CASE WHEN OPE.CVE_ACCESORIO = ''CP'' AND CT.CVE_TIPO_MOVTO <> ''AN'' THEN (CASE WHEN OPE.CVE_AFECTA_SDO = ''I'' THEN DE.IMP_CONCEPTO ELSE DE.IMP_CONCEPTO*-1 END) ELSE 0 END) PAGO_CP,' +coCRLF+
	   '		   SUM(CASE' +coCRLF+// se realiza cambio para considerar la cve de operacion PGDMCP
           '                        WHEN OPE.CVE_ACCESORIO = ''CP''' +coCRLF+
           '                         AND OPE.CVE_OPERACION NOT IN (''PGDMCP'')' +coCRLF+
           '                         AND CT.CVE_TIPO_MOVTO <> ''AN'' THEN (CASE' +coCRLF+
           '                                                                    WHEN OPE.CVE_AFECTA_SDO = ''I''' +coCRLF+
           '                                                                  THEN DE.IMP_CONCEPTO' +coCRLF+
           '                                                                  ELSE DE.IMP_CONCEPTO*-1' +coCRLF+
           '                                                               END)' +coCRLF+
           '                           WHEN OPE.CVE_ACCESORIO = ''CP''' +coCRLF+
           '                            AND OPE.CVE_OPERACION IN (''PGDMCP'')' +coCRLF+
           '                            AND CT.CVE_TIPO_MOVTO <> ''AN'' THEN (CASE' +coCRLF+
           '                                                                     WHEN OPE.CVE_AFECTA_SDO = ''D'' THEN DE.IMP_CONCEPTO' +coCRLF+
           '                                                                     ELSE DE.IMP_CONCEPTO*-1' +coCRLF+
           '                                                                      END)' +coCRLF+
           '                    ELSE 0' +coCRLF+
           '                  END) PAGO_CP,' +coCRLF+
//           '               SUM(CASE WHEN OPE.CVE_ACCESORIO = ''CP'' AND CT.CVE_TIPO_MOVTO = ''AN''  THEN (CASE WHEN OPE.CVE_AFECTA_SDO = ''I'' THEN DE.IMP_CONCEPTO ELSE DE.IMP_CONCEPTO*-1 END) ELSE 0 END) PAGO_CP_AN,' +coCRLF+
           '               SUM(CASE' +coCRLF+    // se realiza cambio para considerar la cve de operacion PGDMCP
           '                         WHEN OPE.CVE_ACCESORIO = ''CP''' +coCRLF+
           '                          AND OPE.CVE_OPERACION NOT IN (''PGDMCP'')' +coCRLF+
           '                          AND CT.CVE_TIPO_MOVTO = ''AN'' THEN (CASE' +coCRLF+
	   '						                     WHEN OPE.CVE_AFECTA_SDO = ''I''' +coCRLF+
	   '								   THEN DE.IMP_CONCEPTO' +coCRLF+
	   '								   ELSE DE.IMP_CONCEPTO*-1' +coCRLF+
	   '								END)' +coCRLF+
	   '			    WHEN OPE.CVE_ACCESORIO = ''CP''' +coCRLF+
	   '			     AND OPE.CVE_OPERACION IN (''PGDMCP'')' +coCRLF+
	   '			     AND CT.CVE_TIPO_MOVTO = ''AN'' THEN (CASE' +coCRLF+
	   '						                      WHEN OPE.CVE_AFECTA_SDO = ''D'' THEN DE.IMP_CONCEPTO' +coCRLF+
	   '								      ELSE DE.IMP_CONCEPTO*-1' +coCRLF+
	   '								       END)' +coCRLF+
           '            	     ELSE 0' +coCRLF+
	   '		   END) PAGO_CP_AN,' +coCRLF+
           '               SUM(CASE WHEN OPE.CVE_ACCESORIO = ''IN'' AND CT.CVE_TIPO_MOVTO <> ''AN'' AND OPE.CVE_OPERACION NOT IN (''PAINFA'',''RPAINF'') THEN (CASE WHEN OPE.CVE_AFECTA_SDO = ''I'' THEN DE.IMP_CONCEPTO ELSE DE.IMP_CONCEPTO*-1 END) ELSE 0 END) PAGO_IN,' +coCRLF+
           '               SUM(CASE WHEN OPE.CVE_ACCESORIO = ''IN'' AND CT.CVE_TIPO_MOVTO = ''AN''  AND OPE.CVE_OPERACION NOT IN (''PAINFA'',''RPAINF'') THEN (CASE WHEN OPE.CVE_AFECTA_SDO = ''I'' THEN DE.IMP_CONCEPTO ELSE DE.IMP_CONCEPTO*-1 END) ELSE 0 END) PAGO_IN_AN,' +coCRLF+
           '               SUM(CASE WHEN OPE.CVE_ACCESORIO = ''IN'' AND OPE.CVE_OPERACION IN (''PAINFA'',''RPAINF'') THEN (CASE WHEN OPE.CVE_AFECTA_SDO = ''I'' THEN DE.IMP_CONCEPTO ELSE DE.IMP_CONCEPTO*-1 END) ELSE 0 END) PAGO_IN_FN,' +coCRLF+
           '               SUM(CASE WHEN OPE.CVE_ACCESORIO = ''FN'' AND CT.CVE_TIPO_MOVTO <> ''AN'' THEN (CASE WHEN OPE.CVE_AFECTA_SDO = ''I'' THEN DE.IMP_CONCEPTO ELSE DE.IMP_CONCEPTO*-1 END) ELSE 0 END) PAGO_FN,' +coCRLF+
           '               SUM(CASE WHEN OPE.CVE_ACCESORIO = ''FN'' AND CT.CVE_TIPO_MOVTO = ''AN''  THEN (CASE WHEN OPE.CVE_AFECTA_SDO = ''I'' THEN DE.IMP_CONCEPTO ELSE DE.IMP_CONCEPTO*-1 END) ELSE 0 END) PAGO_FN_AN,' +coCRLF+
           '               cr.id_contrato, id_titular, cr.f_inicio, cr.f_vencimiento, imp_credito, sit_credito, cr.sobretasa' +coCRLF+
           '          FROM cr_transaccion ct,' +coCRLF+
           '               cr_det_transac de,' +coCRLF+
           '               (SELECT cp.cve_operacion, crca.cve_concepto,' +coCRLF+
           '                       crca.cve_tipo_movto, cp.cve_accesorio,' +coCRLF+
           '                       crca.cve_afecta_sdo' +coCRLF+
           '                  FROM cr_rel_con_afec crca, cr_operacion cp' +coCRLF+
//           '                 WHERE crca.cve_afectacion IN (''CAIMPA'', ''FNIMPA'', ''CIIMPA'')' +coCRLF+
           '                   WHERE (' +coCRLF+
	   '			       (crca.cve_afectacion IN (''CAIMPA'', ''FNIMPA'', ''CIIMPA'') )' +coCRLF+
	   '			      or' +coCRLF+
	   '			       ((crca.cve_operacion IN (''PGDMCP'') AND (crca.cve_afectacion IN (''CAIMCA'')) ))' +coCRLF+
 	   '			      )' +coCRLF+
           '                   AND crca.cve_concepto = ''IMPBRU''' +coCRLF+
           '                   AND crca.cve_operacion = cp.cve_operacion) ope,' +coCRLF+
           '                    (SELECT CRC.*, cnt.id_titular, cnt.id_empresa, cnt.cve_moneda' +coCRLF+
           '                     FROM cr_credito crc, cr_contrato cto, cr_producto crp, contrato cnt' +coCRLF+
           '                     WHERE 1 = 1' +coCRLF+
           '                       AND cto.id_contrato = crc.id_contrato' +coCRLF+
           '                       AND crp.cve_producto_cre = cto.cve_producto_cre' +coCRLF+
           '                       AND cnt.id_contrato = crc.id_contrato' +coCRLF;
//           '                       AND cnt.id_empresa = 2' +coCRLF;

           If Trim(sSitCred) <> '' then
              if Trim(sSitCred) = 'AC' then
              begin
                 sSQL:= sSQL + '                    AND ( (crc.sit_credito = ''AC'') or ' +coCRLF;
                 sSQL:= sSQL + '                          (crc.sit_credito = ''LQ'' and crc.f_liquidacion > '+SQLFecha(StrToDate(sF_Al))+ ') ) '+coCRLF;
              end
              else
                sSQL:= sSQL + '                    AND crc.sit_credito = '+sSitCred+' ' +coCRLF
           else
                sSQL:= sSQL + '                    AND crc.sit_credito <> ''CA'' '+coCRLF;
       if Trim(sCesion) <> '' then
       sSQL:= sSQL + '                      AND crc.id_credito = '+sCesion+''+coCRLF;
       if Trim(sContrato) <> '' then
       sSQL:= sSQL + '                      AND crc.id_contrato = '+sContrato+''+coCRLF;
       if Trim(sAcreditado) <> '' then
       sSQL:= sSQL + '                      AND cnt.id_titular = '+sAcreditado+''+coCRLF;
       if Trim(sId_Promotor) <> '' then
       sSQL:= sSQL + '                      AND cnt.ID_PERS_ASOCIAD = '+sId_Promotor+''+coCRLF;
       if Trim(sId_Prom) <> '' then
       sSQL:= sSQL + '                      AND crc.ID_PROM_ADM = '+sId_Prom+''+coCRLF;
       if Trim(sGpoProd) <> '' then
       sSQL:= sSQL + '                      AND crp.cve_producto_gpo in '+sGpoProd+coCRLF;


       sSQL:= sSQL +
           '                     ) cr' +coCRLF+
           '               WHERE 1 = 1' +coCRLF+
           '                 AND ct.id_credito = cr.id_credito' +coCRLF+
           '                 AND ct.id_transaccion = de.id_transaccion' +coCRLF+
           '                 AND ope.cve_operacion = ct.cve_operacion' +coCRLF+
           '                 AND ope.cve_concepto = de.cve_concepto' +coCRLF+
           '                 AND ope.cve_tipo_movto = ct.cve_tipo_movto' +coCRLF+
           '                 AND de.cve_concepto = ''IMPBRU''' +coCRLF+
           '                 AND ct.sit_transaccion = ''AC''' +coCRLF+
           '                 AND ct.f_operacion <=' +coCRLF+
           '                                     CASE' +coCRLF+
           '                                        WHEN cr.f_liquidacion IS NULL' +coCRLF+
           '                                           THEN ' +SQLFecha(StrToDate(sF_Al))+coCRLF+
           '                                        ELSE (CASE' +coCRLF+
           '                                                 WHEN cr.f_liquidacion IS NOT NULL' +coCRLF+
           '                                                 AND cr.f_liquidacion > ' +SQLFecha(StrToDate(sF_Al))+coCRLF+
           '                                                    THEN ' +SQLFecha(StrToDate(sF_Al))+coCRLF+
           '                                                 ELSE cr.f_liquidacion' +coCRLF+
           '                                              END' +coCRLF+
           '                                             )' +coCRLF+
           '                                 END' +coCRLF+
           '    GROUP BY ct.id_credito, cr.cve_moneda, ct.f_operacion,cr.id_contrato, id_titular, cr.f_inicio, cr.f_vencimiento, imp_credito, sit_credito,cr.sobretasa' +coCRLF+
           '                   ) TRANS' +coCRLF+
           '     ) BASE ' +coCRLF+
           '    ORDER BY cve_moneda, sit_credito desc, id_titular, id_contrato, id_credito, aniomes, f_operacion nulls first'; // condición para

    Result:= sSQL;
End;


procedure TQrRepInfr.qrbDETALLEBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var vlcredit, vlfechoper : String;
    vltotcobr : Currency;
begin

       vltotcobr := 0;
       vlcredit := qyRepInfr.FieldByName('ID_CREDITO').AsString;
       vgImpCred := qyRepInfr.FieldByName('IMP_CREDITO').AsFloat;

       if vlcredit <> vlcreditant then
       begin
          vgSdoFinalEx := 0.00;
          // RABA AGO 2014
          //vgSdoFinal := vgImpCred - qyRepInfr.FieldByName('PAGO_CP').AsFloat - qyRepInfr.FieldByName('PAGO_CP_AN').AsFloat + qyRepInfr.FieldByName('IN_GENERADO').AsFloat - qyRepInfr.FieldByName('PAGO_IN').AsFloat - qyRepInfr.FieldByName('PAGO_IN_AN').AsFloat - qyRepInfr.FieldByName('PAGO_FN').AsFloat - qyRepInfr.FieldByName('PAGO_FN_AN').AsFloat;
          vgSdoFinal := vgImpCred + qyRepInfr.FieldByName('PAGO_IN_FN').AsFloat - qyRepInfr.FieldByName('PAGO_CP').AsFloat - qyRepInfr.FieldByName('PAGO_CP_AN').AsFloat - qyRepInfr.FieldByName('PAGO_FN').AsFloat - qyRepInfr.FieldByName('PAGO_FN_AN').AsFloat +(qyRepInfr.FieldByName('IN_GENERADO').AsFloat-qyRepInfr.FieldByName('IMPINTEX').AsFloat);
          // FIN RABA

          // RABA AGO 2014
          //vgImpIntEx := vgImpIntEx + qyRepInfr.FieldByName('IN_GENERADO').AsFloat;
          vgImpIntEx := vgImpIntEx + qyRepInfr.FieldByName('IMPINTEX').AsFloat;
          //vgSdoFinalEx := vgImpCred - qyRepInfr.FieldByName('PAGO_CP').AsFloat - qyRepInfr.FieldByName('PAGO_CP_AN').AsFloat - qyRepInfr.FieldByName('PAGO_IN').AsFloat - qyRepInfr.FieldByName('PAGO_IN_AN').AsFloat - qyRepInfr.FieldByName('PAGO_FN').AsFloat - qyRepInfr.FieldByName('PAGO_FN_AN').AsFloat;
          vgSdoFinalEx := vgImpCred + qyRepInfr.FieldByName('PAGO_IN_FN').AsFloat - qyRepInfr.FieldByName('PAGO_CP').AsFloat - qyRepInfr.FieldByName('PAGO_CP_AN').AsFloat - qyRepInfr.FieldByName('PAGO_FN').AsFloat - qyRepInfr.FieldByName('PAGO_FN_AN').AsFloat;
       end
       else begin
          // RABA AGO 2014
          //vgSdoFinal := vgSdoFinal - qyRepInfr.FieldByName('PAGO_CP').AsFloat - qyRepInfr.FieldByName('PAGO_CP_AN').AsFloat + qyRepInfr.FieldByName('IN_GENERADO').AsFloat - qyRepInfr.FieldByName('PAGO_IN').AsFloat - qyRepInfr.FieldByName('PAGO_IN_AN').AsFloat - qyRepInfr.FieldByName('PAGO_FN').AsFloat - qyRepInfr.FieldByName('PAGO_FN_AN').AsFloat;
          vgSdoFinal := vgSdoFinal + qyRepInfr.FieldByName('PAGO_IN_FN').AsFloat - qyRepInfr.FieldByName('PAGO_CP').AsFloat - qyRepInfr.FieldByName('PAGO_CP_AN').AsFloat - qyRepInfr.FieldByName('PAGO_FN').AsFloat - qyRepInfr.FieldByName('PAGO_FN_AN').AsFloat +(qyRepInfr.FieldByName('IN_GENERADO').AsFloat-qyRepInfr.FieldByName('IMPINTEX').AsFloat);

          //vgImpIntEx := vgImpIntEx + qyRepInfr.FieldByName('IN_GENERADO').AsFloat;
          vgImpIntEx := vgImpIntEx + qyRepInfr.FieldByName('IMPINTEX').AsFloat;
          //vgSdoFinalEx := vgSdoFinalEx - qyRepInfr.FieldByName('PAGO_CP').AsFloat - qyRepInfr.FieldByName('PAGO_CP_AN').AsFloat - qyRepInfr.FieldByName('PAGO_IN').AsFloat - qyRepInfr.FieldByName('PAGO_IN_AN').AsFloat - qyRepInfr.FieldByName('PAGO_FN').AsFloat - qyRepInfr.FieldByName('PAGO_FN_AN').AsFloat;
          vgSdoFinalEx := vgSdoFinalEx + qyRepInfr.FieldByName('PAGO_IN_FN').AsFloat - qyRepInfr.FieldByName('PAGO_CP').AsFloat - qyRepInfr.FieldByName('PAGO_CP_AN').AsFloat - qyRepInfr.FieldByName('PAGO_FN').AsFloat - qyRepInfr.FieldByName('PAGO_FN_AN').AsFloat;
          // FIN RABA
       end;


       if (qyRepInfr.FieldByName('INT_EX').AsString = 'EX') and ((qyRepInfr.FieldByName('F_OPERACION').AsString = '') or (qyRepInfr.FieldByName('PAGO_IN_AN').AsFloat > 0)) then
       begin
//       QRLabel32.Caption := FormatFloat('###,###,###,##0.00',vgImpIntEx);  //RABA AGO 2014
       vgtextxls := vgImpIntEx;
       vgtextxlSdisp := vgtextxlSdisp + vgImpIntEx;
       vgtextxlSLin  := vgtextxlSLin + vgImpIntEx;
       vgtextxlSAcre := vgtextxlSAcre + vgImpIntEx;
       vgtextxlSMone := vgtextxlSMone + vgImpIntEx;
//       vgSdoFinalEx := vgSdoFinalEx + vgImpIntEx;   //RABA AGO 2014
       vgImpIntEx := 0.00;
       end
       else
       begin
       vgtextxls := 0;
//       QRLabel32.Caption := FormatFloat('###,###,###,##0.00',vgtextxls);    //RABA AGO 2014
       end;


       QRLabel24.Caption := FormatFloat('###,###,###,##0.00',vgSdoFinal);
       QRLabel34.Caption := FormatFloat('###,###,###,##0.00',vgSdoFinalEx);


       vltotcobr := qyRepInfr.FieldByName('PAGO_CP').AsFloat + qyRepInfr.FieldByName('PAGO_CP_AN').AsFloat + qyRepInfr.FieldByName('PAGO_IN').AsFloat + qyRepInfr.FieldByName('PAGO_IN_AN').AsFloat + qyRepInfr.FieldByName('PAGO_IN_FN').AsFloat + qyRepInfr.FieldByName('PAGO_FN').AsFloat + qyRepInfr.FieldByName('PAGO_FN_AN').AsFloat;

       If qyRepInfr.FieldByName('F_OPERACION').asString <> '' Then
       begin
       vlfechoper:= FormatDateTime('dd/mm/yyyy', qyRepInfr.FieldByName('F_OPERACION').AsDateTime);
       end
       else
       vlfechoper := '';


   If (sArchivo <>'') then//and (qyRepInfr.Active) then
      Writeln(F, qyRepInfr.FieldByName('ANIOMES').AsString + #09 +
                 vlfechoper+ #09 +
                 qyRepInfr.FieldByName('ID_CREDITO').AsString + #09 +
                 qyRepInfr.FieldByName('CVE_MONEDA').AsString + #09 +
                 qyRepInfr.FieldByName('SIT_CREDITO').AsString + #09 +
                 qyRepInfr.FieldByName('ID_CONTRATO').AsString + #09 +
                 qyRepInfr.FieldByName('ID_TITULAR').AsString + #09 +
                 qyRepInfr.FieldByName('ACREDITADO').AsString + #09 +
                 FormatDateTime('DD/MM/YYYY',qyRepInfr.FieldByName('F_INICIO').AsDateTime) + #09 +
                 FormatDateTime('DD/MM/YYYY',qyRepInfr.FieldByName('F_VENCIMIENTO').AsDateTime) + #09 +
                 FormatFloat('###,###,###,##0.00',qyRepInfr.FieldByName('IMP_CREDITO').AsFloat) + #09+
                 FormatFloat('###,###,###,##0.00000',qyRepInfr.FieldByName('SOBRETASA').AsFloat) + #09+
                 FormatFloat('###,###,###,##0.00000',qyRepInfr.FieldByName('TASA_TIIE').AsFloat) + #09+
                 FormatFloat('###,###,###,##0.00000',qyRepInfr.FieldByName('TASA_APLICADA').AsFloat) + #09+
                 FormatFloat('###,###,###,##0.00',qyRepInfr.FieldByName('PAGO_CP').AsFloat) + #09+
                 FormatFloat('###,###,###,##0.00',qyRepInfr.FieldByName('PAGO_CP_AN').AsFloat) + #09+
                 FormatFloat('###,###,###,##0.00',qyRepInfr.FieldByName('IN_GENERADO').AsFloat) + #09+
                 // RABA AGO 2014. SE CAMBIA LA COLUMAN IN_GENERARO POR IMP_INTERES DE LA CUOTA
                 //FormatFloat('###,###,###,##0.00',vgtextxls)+ #09+
                 FormatFloat('###,###,###,##0.00',qyRepInfr.FieldByName('IMPINTEX').AsFloat) + #09+
                 // FIN RABA
                 FormatFloat('###,###,###,##0.00',qyRepInfr.FieldByName('PAGO_IN').AsFloat) + #09+
                 FormatFloat('###,###,###,##0.00',qyRepInfr.FieldByName('PAGO_IN_AN').AsFloat) + #09+
                 FormatFloat('###,###,###,##0.00',qyRepInfr.FieldByName('PAGO_IN_FN').AsFloat) + #09+
                 FormatFloat('###,###,###,##0.00',qyRepInfr.FieldByName('PAGO_FN').AsFloat) + #09+
                 FormatFloat('###,###,###,##0.00',qyRepInfr.FieldByName('PAGO_FN_AN').AsFloat) + #09+
                 FormatFloat('###,###,###,##0.00',vltotcobr)+ #09+
                 FormatFloat('###,###,###,##0.00',vgSdoFinal)+ #09+
                 FormatFloat('###,###,###,##0.00',vgSdoFinalEx)+ #09
//                 FloatToStr(vgSdoFinal)+ #09+
               );


end;

procedure TQrRepInfr.SummaryBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If qyRepInfr.Eof Then Begin
      If Trim(sArchivo)<>'' Then
      Begin
         sArchivo:='';
         bGenArch:= True;
         CloseFile(F);
      End;
   End;
end;

procedure TQrRepInfr.qrbDETALLEAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
     vlcreditant := qyRepInfr.FieldByName('ID_CREDITO').AsString;
end;

procedure TQrRepInfr.QRFooterDispAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  vlcreditant := '0';
  vgtextxlSdisp := 0.00;
end;

procedure TQrRepInfr.QRFooterDispBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If (sArchivo <>'') then//and (qyRepInfr.Active) then
       Writeln(F,  #09+#09 );

//       QRLabel35.Caption := FormatFloat('###,###,###,##0.00',vgtextxlSdisp);      //RABA AGO 2014
       QRLabel25.Caption := 'Total x '+ QRLabel12.Caption;

end;

procedure TQrRepInfr.QRGroupMonBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   if qyRepInfr.FieldByName('CVE_MONEDA').AsString = '484' then
      QRLabel12.Caption := 'PESO MEXICANO:'
   else
      QRLabel12.Caption := 'DÓLAR AMERICANO:'

end;

procedure TQrRepInfr.QRFooterLineaBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
//      QRLabel36.Caption := FormatFloat('###,###,###,##0.00',vgtextxlSLin);        //RABA AGO 2014
end;

procedure TQrRepInfr.QRFooterLineaAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
   vgtextxlSLin := 0.00;
end;

procedure TQrRepInfr.QRFooterAcredAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
   vgtextxlSAcre := 0.00;
end;

procedure TQrRepInfr.QRFooterAcredBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
//      QRLabel37.Caption := FormatFloat('###,###,###,##0.00',vgtextxlSAcre);       //RABA AGO 2014
end;

procedure TQrRepInfr.QRFooterMonBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
//     QRLabel38.Caption := FormatFloat('###,###,###,##0.00',vgtextxlSMone);        //RABA AGO 2014
end;

procedure TQrRepInfr.QRFooterMonAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
    vgtextxlSMone := 0.00;
end;

procedure TQrRepInfr.QRGroupCredBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
     vgImpIntEx := 0.00;
end;

End.
