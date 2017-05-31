unit IntMQrRepInff;
interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, unSQL2;
  
Const
   coCRLF      = #13#10;
type
  TQrRepInff = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    qyRepInff: TQuery;
    qrbDETALLE: TQRBand;
    QRDBText23: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText20: TQRDBText;
    QRLabel23: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText8: TQRDBText;
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
    QRShape18: TQRShape;
    QRDBText18: TQRDBText;
    QRLabel26: TQRLabel;
    QRDBText19: TQRDBText;
    QRShape19: TQRShape;
    QRLabel27: TQRLabel;
    QRDBText21: TQRDBText;
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
    QRFooterLinea: TQRBand;
    QRExpr21: TQRExpr;
    QRShape11: TQRShape;
    QRLabel25: TQRLabel;
    QRExpr22: TQRExpr;
    QRExpr23: TQRExpr;
    QRExpr24: TQRExpr;
    QRExpr25: TQRExpr;
    QRExpr26: TQRExpr;
    QRExpr27: TQRExpr;
    QRExpr28: TQRExpr;
    QRExpr29: TQRExpr;
    QRFooterMon: TQRBand;
    QRExpr11: TQRExpr;
    QRShape10: TQRShape;
    QRLabel29: TQRLabel;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr16: TQRExpr;
    QRExpr17: TQRExpr;
    QRExpr18: TQRExpr;
    QRExpr19: TQRExpr;
    QRExpr20: TQRExpr;
    QRLabel30: TQRLabel;
    QRShape20: TQRShape;
    QRLabel31: TQRLabel;
    QRShape21: TQRShape;
    QRLabel32: TQRLabel;
    qyRepInffANIOMES: TStringField;
    qyRepInffID_CREDITO: TFloatField;
    qyRepInffCVE_MONEDA: TFloatField;
    qyRepInffID_CONTRATO: TFloatField;
    qyRepInffID_TITULAR: TFloatField;
    qyRepInffACREDITADO: TStringField;
    qyRepInffF_INICIO: TDateTimeField;
    qyRepInffF_VENCIMIENTO: TDateTimeField;
    qyRepInffIMP_CREDITO: TFloatField;
    qyRepInffSOBRETASA: TFloatField;
    qyRepInffTASA_APLICADA: TFloatField;
    qyRepInffPAGO_CP: TFloatField;
    qyRepInffPAGO_CP_AN: TFloatField;
    qyRepInffIN_GENERADO: TFloatField;
    qyRepInffPAGO_IN: TFloatField;
    qyRepInffPAGO_IN_AN: TFloatField;
    qyRepInffPAGO_IN_FN: TFloatField;
    qyRepInffPAGO_FN: TFloatField;
    qyRepInffPAGO_FN_AN: TFloatField;
    qyRepInffSIT_CREDITO: TStringField;
    qyRepInffINT_EX: TStringField;
    QRLabel33: TQRLabel;
    QRDBText9: TQRDBText;
    qyRepInffIMPINTEX: TFloatField;
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
    procedure QRGroupCredBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFooterLineaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFooterLineaAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRFooterAcredBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFooterAcredAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRFooterMonBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFooterMonAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private

  public

    Function FormaQuery(sF_Al, sGpoProd, sAcreditado, sNOMBRE_ACRED,
                        sContrato,sDESC_C_PRODUCTO, sCesion,sID_PROMOTOR,sNOM_PROMOTOR,sID_PROM,sNOM_PROM,sSitCred : String):String;


  end;

var
  QrRepInff: TQrRepInff;
  bGenArch: Boolean;
  F: TextFile;
  sArchivo : String;
  vlNumCred : Integer;
  vlNumCrPr : Integer;
  vlIdCred  : Integer;
  vgFechaAl : String ;


  Procedure  RepInff(sF_Al, sGpoProd, sAcreditado, sNOMBRE_ACRED,
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

Procedure RepInff(sF_Al, sGpoProd, sAcreditado, sNOMBRE_ACRED,
                  sContrato,sDESC_C_PRODUCTO, sCesion,sID_PROMOTOR,sNOM_PROMOTOR,sID_PROM,sNOM_PROM,sTipRep,sSitCred,sNbrArch :String;
                  pAPli : TInterApli;
                  pPreview : Boolean);
Var
   QrRepInff : TQrRepInff;
   Preview   : TIntQRPreview;
   VLTitulo  : String;

Begin
   QrRepInff:=TQrRepInff.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QrRepInff);
   Try
      VLTitulo := '';
      vgSdoFinal  := 0.00;
      vgImpCred   := 0.00;
      vlcreditant := '0';


      TipRep := sTipRep;

      bGenArch:= False;
      sArchivo:= sNbrArch;
      QrRepInff.QRInterEncabezado1.Apli:=pApli;
      QrRepInff.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
      QrRepInff.QRInterEncabezado1.NomReporte:='IntMQrRepInff';
      QrRepInff.QRInterEncabezado1.Titulo1:='Reporte de Infraestructura con fecha de corte al: '+sF_Al;

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


      QrRepInff.QRInterEncabezado1.Titulo2:='DETALLE '+ VLTitulo;

      QrRepInff.qyRepInff.DatabaseName := pApli.DataBaseName;
      QrRepInff.qyRepInff.SessionName := pApli.SessionName;

      QrRepInff.qyRepInff.Active:=False;
      QrRepInff.qyRepInff.SQL.Text:= QrRepInff.FormaQuery(sF_Al, sGpoProd, sAcreditado, sNOMBRE_ACRED,
                                                          sContrato,sDESC_C_PRODUCTO, sCesion,sID_PROMOTOR,sNOM_PROMOTOR,sID_PROM,sNOM_PROM,sSitCred) ;
      vgFechaAl:= sF_Al ;
      QrRepInff.qyRepInff.SQL.SaveToFile('C:\RepInff.sql');
      QrRepInff.qyRepInff.Active:=True;

      If Trim(sArchivo)<>'' Then Begin
         AssignFile(F, sArchivo);
         Rewrite(F);
         Writeln(F, 'BANCO INTERACCIONES, S.A.' + #09 );
         Writeln(F, 'Reporte de Infraestructura' + #09 );
         Writeln(F, 'Fecha al: ' + sF_Al + #09);
         Writeln(F, 'DETALLE '+ VLTitulo);         
         Writeln(F,  #09 );

      Writeln(F, 'AÑOMES' + #09 +
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
         QrRepInff.Preview
      Else
         QrRepInff.Print;
   Finally
      If Trim(sArchivo)<>'' Then Begin
         bGenArch:= True;
         CloseFile(F);
      End;
      QrRepInff.free;                              
      If Assigned(Preview) Then Preview.Free;
   End;
End;

Function TQrRepInff.FormaQuery(sF_Al, sGpoProd, sAcreditado, sNOMBRE_ACRED,
                               sContrato,sDESC_C_PRODUCTO, sCesion,sID_PROMOTOR,sNOM_PROMOTOR,sID_PROM,sNOM_PROM,sSitCred: String ):String;
Var
    sSQL:String;
Begin
    sSQL:= '    SELECT fech.aniomes, fech.id_credito, fech.cve_moneda, fech.id_contrato, fech.id_titular,' +coCRLF+
           '           fech.acreditado, fech.f_inicio, fech.f_vencimiento, fech.imp_credito,' +coCRLF+
           '           fech.sobretasa,' +coCRLF+
           '           (select tasa_aplicada from cre_prov_diaria' +coCRLF+
           '             where id_credito = fech.id_credito' +coCRLF+
           '               and TO_CHAR (f_provision, ''YYYY/MM'') = fech.aniomes' +coCRLF+
           '               and f_provision = (select max(f_provision) -1 from cre_prov_diaria where id_credito = fech.id_credito and TO_CHAR (f_provision, ''YYYY/MM'') = fech.aniomes)' +coCRLF+
           '           ) tasa_aplicada,' +coCRLF+
           '           trans.pago_cp, trans.pago_cp_an,' +coCRLF+
           '           in_generado, trans.pago_in, trans.pago_in_an, trans.pago_in_fn,' +coCRLF+
           '           trans.pago_fn, trans.pago_fn_an, fech.sit_credito,' +coCRLF+
           ///////////INICIO NUEVA COLUMNA PARA INTERES EXIGIBLE
           '           CAST(PKGCRCOMUN.FUN_EXIGIBLE(fech.id_credito, fech.aniomes,'+SQLFecha(StrToDate(sF_Al))+', PAGO_IN_AN) AS VARCHAR2(5)) INT_EX, ' +coCRLF+
           '           NVL(intex.imp_interes,0) AS IMPINTEX ' +coCRLF+
           '      FROM (' +coCRLF+
           '             SELECT crh.id_credito, crh.cve_moneda, TO_CHAR (crh.f_cierre, ''YYYY/MM'') AS aniomes,' +coCRLF+
           '                   SUM (crh.imp_interes_dia) + SUM (crh.imp_interes_fv) + SUM (crh.imp_ajuste_in) AS in_generado,' +coCRLF+
           '                   crh.id_contrato, crh.id_titular,' +coCRLF+
           '                   CAST(pkgcrconsolidado.fun_nom_tit_cred (crh.id_titular) AS VARCHAR2 (100)) acreditado,' +coCRLF+
           '                   crh.f_inicio, crh.f_vencimiento, crh.sobretasa,' +coCRLF+
           '                   crh.imp_credito, crh.sit_credito' +coCRLF+
           '             FROM (' +coCRLF+
           '                 SELECT crc.id_credito, crc.id_contrato, crc.f_inicio, ' +coCRLF+
           '                        crc.f_vencimiento, crc.sobretasa, crc.imp_credito, ' +coCRLF+
//           '                        crc.sit_credito, crc.f_liquidacion, cnt.id_titular, ' +coCRLF+      // RABA SE CAMBIA LA FORMA DE OBTENER LA SITUACIÓN DEL CREDITO
           '                        case when crc.sit_credito = ''LQ'' and crc.f_liquidacion > '+SQLFecha(StrToDate(sF_Al))+ ' then ''AC'' ' +coCRLF+
           '                             else crc.sit_credito end as sit_credito, ' +coCRLF+
           '                        crc.f_liquidacion, cnt.id_titular, ' +coCRLF+
//           '                        cnt.id_empresa, cnt.cve_moneda, cri.f_cierre + 1 f_cierre,' +coCRLF+  // RABA SE QUITA +1
           '                        cnt.id_empresa, cnt.cve_moneda, cri.f_cierre, ' +coCRLF+
           '                        cri.imp_interes_dia, cri.imp_interes_fv, cri.imp_ajuste_in ' +coCRLF+
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
//           '                        cnt.id_empresa, cnt.cve_moneda, cre.f_provision + 1 f_cierre,' +coCRLF+  // RABA AGO 2014 SE QUITA +1
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
           '                  ) crh' +coCRLF+
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
           '                                   crh.id_contrato,' +coCRLF+
           '                   crh.id_titular,crh.f_inicio, crh.f_vencimiento, crh.sobretasa, crh.imp_credito, crh.sit_credito' +coCRLF+
           '                            ) fech,' +coCRLF+
           '           (SELECT  ct.id_credito, cr.cve_moneda,' +coCRLF+
           '                    TO_CHAR (ct.f_operacion, ''YYYY/MM'') AS aniomes,' +coCRLF+
//           '                    SUM(CASE WHEN OPE.CVE_ACCESORIO = ''CP'' AND CT.CVE_TIPO_MOVTO <> ''AN'' THEN (CASE WHEN OPE.CVE_AFECTA_SDO = ''I'' THEN DE.IMP_CONCEPTO ELSE DE.IMP_CONCEPTO*-1 END) ELSE 0 END) PAGO_CP,' +coCRLF+
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
//           '                    SUM(CASE WHEN OPE.CVE_ACCESORIO = ''CP'' AND CT.CVE_TIPO_MOVTO = ''AN''  THEN (CASE WHEN OPE.CVE_AFECTA_SDO = ''I'' THEN DE.IMP_CONCEPTO ELSE DE.IMP_CONCEPTO*-1 END) ELSE 0 END) PAGO_CP_AN,' +coCRLF+
           '                    SUM(CASE' +coCRLF+
           '                              WHEN OPE.CVE_ACCESORIO = ''CP''' +coCRLF+
           '                               AND OPE.CVE_OPERACION NOT IN (''PGDMCP'')' +coCRLF+
           '                               AND CT.CVE_TIPO_MOVTO = ''AN'' THEN (CASE' +coCRLF+
	   '		       				                     WHEN OPE.CVE_AFECTA_SDO = ''I''' +coCRLF+
	   '		       						     THEN DE.IMP_CONCEPTO' +coCRLF+
	   '		       						     ELSE DE.IMP_CONCEPTO*-1' +coCRLF+
	   '		         						END)' +coCRLF+
	   '		         	    WHEN OPE.CVE_ACCESORIO = ''CP''' +coCRLF+
	   '		         	     AND OPE.CVE_OPERACION IN (''PGDMCP'')' +coCRLF+
	   '		         	     AND CT.CVE_TIPO_MOVTO = ''AN'' THEN (CASE' +coCRLF+
	   '		         				                      WHEN OPE.CVE_AFECTA_SDO = ''D'' THEN DE.IMP_CONCEPTO' +coCRLF+
	   '		         						      ELSE DE.IMP_CONCEPTO*-1' +coCRLF+
	   '		         						       END)' +coCRLF+
           '                     	     ELSE 0' +coCRLF+
	   '		         END) PAGO_CP_AN,' +coCRLF+
           '                    SUM(CASE WHEN OPE.CVE_ACCESORIO = ''IN'' AND CT.CVE_TIPO_MOVTO <> ''AN'' AND OPE.CVE_OPERACION NOT IN (''PAINFA'',''RPAINF'') THEN (CASE WHEN OPE.CVE_AFECTA_SDO = ''I'' THEN DE.IMP_CONCEPTO ELSE DE.IMP_CONCEPTO*-1 END) ELSE 0 END) PAGO_IN,' +coCRLF+
           '                    SUM(CASE WHEN OPE.CVE_ACCESORIO = ''IN'' AND CT.CVE_TIPO_MOVTO = ''AN''  AND OPE.CVE_OPERACION NOT IN (''PAINFA'',''RPAINF'') THEN (CASE WHEN OPE.CVE_AFECTA_SDO = ''I'' THEN DE.IMP_CONCEPTO ELSE DE.IMP_CONCEPTO*-1 END) ELSE 0 END) PAGO_IN_AN,' +coCRLF+
           '                    SUM(CASE WHEN OPE.CVE_ACCESORIO = ''IN'' AND OPE.CVE_OPERACION IN (''PAINFA'',''RPAINF'') THEN (CASE WHEN OPE.CVE_AFECTA_SDO = ''I'' THEN DE.IMP_CONCEPTO ELSE DE.IMP_CONCEPTO*-1 END) ELSE 0 END) PAGO_IN_FN,' +coCRLF+
           '                    SUM(CASE WHEN OPE.CVE_ACCESORIO = ''FN'' AND CT.CVE_TIPO_MOVTO <> ''AN'' THEN (CASE WHEN OPE.CVE_AFECTA_SDO = ''I'' THEN DE.IMP_CONCEPTO ELSE DE.IMP_CONCEPTO*-1 END) ELSE 0 END) PAGO_FN,' +coCRLF+
           '                    SUM(CASE WHEN OPE.CVE_ACCESORIO = ''FN'' AND CT.CVE_TIPO_MOVTO = ''AN''  THEN (CASE WHEN OPE.CVE_AFECTA_SDO = ''I'' THEN DE.IMP_CONCEPTO ELSE DE.IMP_CONCEPTO*-1 END) ELSE 0 END) PAGO_FN_AN' +coCRLF+
           '               FROM cr_transaccion ct,' +coCRLF+
           '                    cr_det_transac de,' +coCRLF+
           '                    (SELECT cp.cve_operacion, crca.cve_concepto,' +coCRLF+
           '                            crca.cve_tipo_movto, cp.cve_accesorio,' +coCRLF+
           '                            crca.cve_afecta_sdo' +coCRLF+
           '                       FROM cr_rel_con_afec crca, cr_operacion cp' +coCRLF+
//           '                      WHERE crca.cve_afectacion IN (''CAIMPA'', ''FNIMPA'', ''CIIMPA'')' +coCRLF+
           '                   WHERE (' +coCRLF+
	   '			       (crca.cve_afectacion IN (''CAIMPA'', ''FNIMPA'', ''CIIMPA'') )' +coCRLF+
	   '			      or' +coCRLF+
	   '			       ((crca.cve_operacion IN (''PGDMCP'') AND (crca.cve_afectacion IN (''CAIMCA'')) ))' +coCRLF+
	   '			      )' +coCRLF+
           '                        AND crca.cve_concepto = ''IMPBRU''' +coCRLF+
           '                        AND crca.cve_operacion = cp.cve_operacion) ope,' +coCRLF+
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
           '              GROUP BY ct.id_credito, cr.cve_moneda, TO_CHAR (ct.f_operacion, ''YYYY/MM'')' +coCRLF+
           '                          ) trans, ' +coCRLF+
           // RABA AGO 2014 SE ADICIONA IMPORTE DE LA CUOTA DE INTERES COMO INTERES EXIGIBLE EN EL MES
           '                 (SELECT crc.ID_CREDITO, TO_CHAR (CRI.F_VENCIMIENTO, ''YYYY/MM'') AS ANIOMES, SUM(CRI.IMP_INTERES) IMP_INTERES ' +coCRLF+
           '                   FROM cr_credito crc, ' +coCRLF+
           '                        cr_contrato cto, ' +coCRLF+
           '                        cr_producto crp, ' +coCRLF+
           '                        contrato cnt, ' +coCRLF+
           '                        cr_interes cri ' +coCRLF+
           '                  WHERE 1 = 1 ' +coCRLF+
           '                    AND cto.id_contrato = crc.id_contrato ' +coCRLF+
           '                    AND crc.id_credito = cri.id_credito ' +coCRLF+
           '                    AND crp.cve_producto_cre = cto.cve_producto_cre ' +coCRLF+
           '                    AND cnt.id_contrato = crc.id_contrato ' +coCRLF+
           '                    AND cri.sit_interes not in (''PA'', ''CA'') ' +coCRLF+
           '                    AND cri.f_vencimiento <= ' +SQLFecha(StrToDate(sF_Al))+ coCRLF;
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
           '                 GROUP BY crc.ID_CREDITO, TO_CHAR (CRI.F_VENCIMIENTO, ''YYYY/MM'') ' +coCRLF+
           '                  ) intex ' +coCRLF+
           '        WHERE 1 = 1' +coCRLF+
           '          AND trans.aniomes (+)    = fech.aniomes' +coCRLF+
           '          AND trans.id_credito (+) = fech.id_credito' +coCRLF+
           '          AND intex.id_credito(+)  = fech.id_credito ' +coCRLF+
           '          AND intex.aniomes(+)     = fech.aniomes ' +coCRLF+
           // FIN RABA
           '     ORDER BY fech.cve_moneda, fech.sit_credito desc, fech.id_titular, fech.id_contrato, fech.id_credito, fech.aniomes' +coCRLF;

    Result:= sSQL;
End;
                  
procedure TQrRepInff.qrbDETALLEBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var vlcredit : String;
    vltotcobr, vltiie : Currency;
begin
       vltotcobr := 0;
       vlcredit := qyRepInff.FieldByName('ID_CREDITO').AsString;
       vgImpCred := qyRepInff.FieldByName('IMP_CREDITO').AsFloat;
       {
       if vlcredit <> vlcreditant then
       begin
       vgSdoFinal := vgImpCred - qyRepInff.FieldByName('PAGO_CP').AsFloat - qyRepInff.FieldByName('PAGO_CP_AN').AsFloat + qyRepInff.FieldByName('IN_GENERADO').AsFloat - qyRepInff.FieldByName('PAGO_IN').AsFloat - qyRepInff.FieldByName('PAGO_IN_AN').AsFloat - qyRepInff.FieldByName('PAGO_FN').AsFloat - qyRepInff.FieldByName('PAGO_FN_AN').AsFloat;
       end
       else
       vgSdoFinal := vgSdoFinal - qyRepInff.FieldByName('PAGO_CP').AsFloat - qyRepInff.FieldByName('PAGO_CP_AN').AsFloat + qyRepInff.FieldByName('IN_GENERADO').AsFloat - qyRepInff.FieldByName('PAGO_IN').AsFloat - qyRepInff.FieldByName('PAGO_IN_AN').AsFloat - qyRepInff.FieldByName('PAGO_FN').AsFloat - qyRepInff.FieldByName('PAGO_FN_AN').AsFloat;
       }
       if vlcredit <> vlcreditant then
       begin
          vgSdoFinalEx := 0.00;
          // RABA AGO 2014
          //vgSdoFinal := vgImpCred - qyRepInff.FieldByName('PAGO_CP').AsFloat - qyRepInff.FieldByName('PAGO_CP_AN').AsFloat + qyRepInff.FieldByName('IN_GENERADO').AsFloat - qyRepInff.FieldByName('PAGO_IN').AsFloat - qyRepInff.FieldByName('PAGO_IN_AN').AsFloat - qyRepInff.FieldByName('PAGO_FN').AsFloat - qyRepInff.FieldByName('PAGO_FN_AN').AsFloat;
          vgSdoFinal := vgImpCred + qyRepInff.FieldByName('PAGO_IN_FN').AsFloat - qyRepInff.FieldByName('PAGO_CP').AsFloat - qyRepInff.FieldByName('PAGO_CP_AN').AsFloat - qyRepInff.FieldByName('PAGO_FN').AsFloat - qyRepInff.FieldByName('PAGO_FN_AN').AsFloat + (qyRepInff.FieldByName('IN_GENERADO').AsFloat-qyRepInff.FieldByName('IMPINTEX').AsFloat);
          vgImpIntEx := vgImpIntEx + qyRepInff.FieldByName('IMPINTEX').AsFloat;
          // RABA AGO 2014
          //vgSdoFinalEx := vgImpCred - qyRepInff.FieldByName('PAGO_CP').AsFloat - qyRepInff.FieldByName('PAGO_CP_AN').AsFloat - qyRepInff.FieldByName('PAGO_IN').AsFloat - qyRepInff.FieldByName('PAGO_IN_AN').AsFloat - qyRepInff.FieldByName('PAGO_FN').AsFloat - qyRepInff.FieldByName('PAGO_FN_AN').AsFloat;
          vgSdoFinalEx := vgImpCred + qyRepInff.FieldByName('PAGO_IN_FN').AsFloat - qyRepInff.FieldByName('PAGO_CP').AsFloat - qyRepInff.FieldByName('PAGO_CP_AN').AsFloat - qyRepInff.FieldByName('PAGO_FN').AsFloat - qyRepInff.FieldByName('PAGO_FN_AN').AsFloat;
          // FIN RABA
       end
       else begin
          // RABA AGO 2014
          //vgSdoFinal := vgSdoFinal - qyRepInff.FieldByName('PAGO_CP').AsFloat - qyRepInff.FieldByName('PAGO_CP_AN').AsFloat + qyRepInff.FieldByName('IN_GENERADO').AsFloat - qyRepInff.FieldByName('PAGO_IN').AsFloat - qyRepInff.FieldByName('PAGO_IN_AN').AsFloat - qyRepInff.FieldByName('PAGO_FN').AsFloat - qyRepInff.FieldByName('PAGO_FN_AN').AsFloat;
          vgSdoFinal := vgSdoFinal + qyRepInff.FieldByName('PAGO_IN_FN').AsFloat - qyRepInff.FieldByName('PAGO_CP').AsFloat - qyRepInff.FieldByName('PAGO_CP_AN').AsFloat - qyRepInff.FieldByName('PAGO_FN').AsFloat - qyRepInff.FieldByName('PAGO_FN_AN').AsFloat + (qyRepInff.FieldByName('IN_GENERADO').AsFloat-qyRepInff.FieldByName('IMPINTEX').AsFloat);
          // FIN RABA
          vgImpIntEx := vgImpIntEx + qyRepInff.FieldByName('IMPINTEX').AsFloat;
          // RABA AGO 2014
          //vgSdoFinalEx := vgSdoFinalEx - qyRepInff.FieldByName('PAGO_CP').AsFloat - qyRepInff.FieldByName('PAGO_CP_AN').AsFloat - qyRepInff.FieldByName('PAGO_IN').AsFloat - qyRepInff.FieldByName('PAGO_IN_AN').AsFloat - qyRepInff.FieldByName('PAGO_FN').AsFloat - qyRepInff.FieldByName('PAGO_FN_AN').AsFloat;
          vgSdoFinalEx := vgSdoFinalEx + qyRepInff.FieldByName('PAGO_IN_FN').AsFloat - qyRepInff.FieldByName('PAGO_CP').AsFloat - qyRepInff.FieldByName('PAGO_CP_AN').AsFloat - qyRepInff.FieldByName('PAGO_FN').AsFloat - qyRepInff.FieldByName('PAGO_FN_AN').AsFloat;
          // FIN RABA
       end;

       if (qyRepInff.FieldByName('INT_EX').AsString = 'EX') then
       begin
//       QRLabel34.Caption := FormatFloat('###,###,###,##0.00',vgImpIntEx);
       vgtextxls := vgImpIntEx;
       vgtextxlSdisp := vgtextxlSdisp + vgImpIntEx;
       vgtextxlSLin  := vgtextxlSLin + vgImpIntEx;
       vgtextxlSAcre := vgtextxlSAcre + vgImpIntEx;
       vgtextxlSMone := vgtextxlSMone + vgImpIntEx;
// RABA AGO 2014
//       vgSdoFinalEx := vgSdoFinalEx + vgImpIntEx;
// FIN RABA
       vgImpIntEx := 0.00;
       end
       else
       begin
       vgtextxls := 0;
//       QRLabel34.Caption := FormatFloat('###,###,###,##0.00',vgtextxls);
       end;


       QRLabel24.Caption := FormatFloat('###,###,###,##0.00',vgSdoFinal);
       QRLabel33.Caption := FormatFloat('###,###,###,##0.00',vgSdoFinalEx);

       vltotcobr := qyRepInff.FieldByName('PAGO_CP').AsFloat + qyRepInff.FieldByName('PAGO_CP_AN').AsFloat + qyRepInff.FieldByName('PAGO_IN').AsFloat + qyRepInff.FieldByName('PAGO_IN_AN').AsFloat + qyRepInff.FieldByName('PAGO_IN_FN').AsFloat + qyRepInff.FieldByName('PAGO_FN').AsFloat + qyRepInff.FieldByName('PAGO_FN_AN').AsFloat;

       vltiie := qyRepInff.FieldByName('TASA_APLICADA').AsFloat - qyRepInff.FieldByName('SOBRETASA').AsFloat;

       if vltiie < 0 then
       begin
       vltiie := 0;
       QRLabel30.Caption := FormatFloat('###,###,###,##0.00000',(vltiie));
       end
       else
       QRLabel30.Caption := FormatFloat('###,###,###,##0.00000',(vltiie));



   If (sArchivo <>'') then//and (qyRepInff.Active) then
      Writeln(F, qyRepInff.FieldByName('ANIOMES').AsString + #09 +
                 qyRepInff.FieldByName('ID_CREDITO').AsString + #09 +
                 qyRepInff.FieldByName('CVE_MONEDA').AsString + #09 +
                 qyRepInff.FieldByName('SIT_CREDITO').AsString + #09 +
                 qyRepInff.FieldByName('ID_CONTRATO').AsString + #09 +
                 qyRepInff.FieldByName('ID_TITULAR').AsString + #09 +
                 qyRepInff.FieldByName('ACREDITADO').AsString + #09 +
                 FormatDateTime('DD/MM/YYYY',qyRepInff.FieldByName('F_INICIO').AsDateTime) + #09 +
                 FormatDateTime('DD/MM/YYYY',qyRepInff.FieldByName('F_VENCIMIENTO').AsDateTime) + #09 +
                 FormatFloat('###,###,###,##0.00',qyRepInff.FieldByName('IMP_CREDITO').AsFloat) + #09+
                 FormatFloat('###,###,###,##0.00000',qyRepInff.FieldByName('SOBRETASA').AsFloat) + #09+
                 FormatFloat('###,###,###,##0.00000',vltiie)+ #09+
                 FormatFloat('###,###,###,##0.00000',qyRepInff.FieldByName('TASA_APLICADA').AsFloat) + #09+
                 FormatFloat('###,###,###,##0.00000',qyRepInff.FieldByName('PAGO_CP').AsFloat) + #09+
                 FormatFloat('###,###,###,##0.00000',qyRepInff.FieldByName('PAGO_CP_AN').AsFloat) + #09+
                 // RABA AGO 2014
                 FormatFloat('###,###,###,##0.00000',qyRepInff.FieldByName('IN_GENERADO').AsFloat) + #09+
                 FormatFloat('###,###,###,##0.00000',qyRepInff.FieldByName('IMPINTEX').AsFloat) + #09+
//                 FormatFloat('###,###,###,##0.00',vgtextxls)+ #09+
                 // FIN RABA
                 FormatFloat('###,###,###,##0.00000',qyRepInff.FieldByName('PAGO_IN').AsFloat) + #09+
                 FormatFloat('###,###,###,##0.00000',qyRepInff.FieldByName('PAGO_IN_AN').AsFloat) + #09+
                 FormatFloat('###,###,###,##0.00000',qyRepInff.FieldByName('PAGO_IN_FN').AsFloat) + #09+
                 FormatFloat('###,###,###,##0.00000',qyRepInff.FieldByName('PAGO_FN').AsFloat) + #09+
                 FormatFloat('###,###,###,##0.00000',qyRepInff.FieldByName('PAGO_FN_AN').AsFloat) + #09+
                 FormatFloat('###,###,###,##0.00',vltotcobr)+ #09+
                 FormatFloat('###,###,###,##0.00',vgSdoFinal)+ #09 +
                 FormatFloat('###,###,###,##0.00',vgSdoFinalEx)+ #09
//                 FloatToStr(vgSdoFinal)+ #09+
               );
end;

procedure TQrRepInff.SummaryBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If qyRepInff.Eof Then Begin
      If Trim(sArchivo)<>'' Then
      Begin
         sArchivo:='';
         bGenArch:= True;
         CloseFile(F);
      End;
   End;
end;

procedure TQrRepInff.qrbDETALLEAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
     vlcreditant := qyRepInff.FieldByName('ID_CREDITO').AsString;
end;

procedure TQrRepInff.QRFooterDispAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  vlcreditant := '0';
  vgtextxlSdisp := 0.00;
end;

procedure TQrRepInff.QRFooterDispBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If (sArchivo <>'') then//and (qyRepInff.Active) then
       Writeln(F,  #09+#09 );

//       QRLabel35.Caption := FormatFloat('###,###,###,##0.00',vgtextxlSdisp);
       QRLabel29.Caption := 'Total x '+ QRLabel12.Caption+' :';
end;

procedure TQrRepInff.QRGroupMonBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   if qyRepInff.FieldByName('CVE_MONEDA').AsString = '484' then
      QRLabel12.Caption := 'PESO MEXICANO'
   else
      QRLabel12.Caption := 'DÓLAR AMERICANO'

end;

procedure TQrRepInff.QRGroupCredBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
     vgImpIntEx := 0.00;
end;

procedure TQrRepInff.QRFooterLineaBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
//     QRLabel36.Caption := FormatFloat('###,###,###,##0.00',vgtextxlSLin);
end;

procedure TQrRepInff.QRFooterLineaAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
vgtextxlSLin := 0.00;
end;

procedure TQrRepInff.QRFooterAcredBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
//QRLabel37.Caption := FormatFloat('###,###,###,##0.00',vgtextxlSAcre);
end;

procedure TQrRepInff.QRFooterAcredAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
vgtextxlSAcre := 0.00;
end;

procedure TQrRepInff.QRFooterMonBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
//QRLabel38.Caption := FormatFloat('###,###,###,##0.00',vgtextxlSMone);
end;

procedure TQrRepInff.QRFooterMonAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
   vgtextxlSMone := 0.00;
end;

End.
