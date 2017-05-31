Unit IntQrConAdeTot;

Interface              

Uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, IntGenCre,UnSQL2, QRExport, Dialogs,StrUtils;
Type
  TQrConAdeTot = Class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    QRLabel17: TQRLabel;
    QRSHPTMonto: TQRShape;
    QRLabel18: TQRLabel;
    QRBDetalle: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    QRSHPTChequera: TQRShape;
    QRLabel13: TQRLabel;
    QRFooterAcreditado: TQRBand;
    QRLabel23: TQRLabel;
    QRDBText24: TQRDBText;
    QRBand2: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    qrgrpFooterMoneda: TQRBand;
    QRLabel28: TQRLabel;
    qrgrpFooterGpoEconomico: TQRBand;
    QRLabel36: TQRLabel;
    QRGroupContador: TQRGroup;
    QRGMoneda: TQRGroup;
    QRGGrpEconomico: TQRGroup;
    QRGAcreditado: TQRGroup;
    QRSHPOrigen: TQRShape;
    SummaryBand1: TQRBand;
    QRSHPSector: TQRShape;
    QRLabel52: TQRLabel;
    QRDBText38: TQRDBText;
    QRSHPMoneda: TQRShape;
    QRLabel46: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText32: TQRDBText;
    QRExprAcreditado_Suma_CapVigVig: TQRExpr;
    QRExprAcreditado_Suma_CapVigImp: TQRExpr;
    QRExpAcreditado_Suma_CapVenExi: TQRExpr;
    QRExpAcreditado_Suma_CapVenNoExi: TQRExpr;
    QRExpAcreditado_Suma_IntVenOrd: TQRExpr;
    QRExpAcreditado_Suma_IntVenExi: TQRExpr;
    QRExpAcreditado_Suma_IntVigImp: TQRExpr;
    QRExpAcreditado_Suma_IntVigDev: TQRExpr;
    QRExpAcreditado_Suma_AdeudoTot: TQRExpr;
    QRExpAcreditado_Suma_ImporteDisp: TQRExpr;
    QRExpEconomico_Suma_ImporteDisp: TQRExpr;
    QRExpEconomico_Suma_AdeudoTot: TQRExpr;
    QRExpEconomico_Suma_IntVenExi: TQRExpr;
    QRExpEconomico_Suma_IntVigImp: TQRExpr;
    QRExpEconomico_Suma_IntVigDev: TQRExpr;
    QRExpEconomico_Suma_CapVenNoExi: TQRExpr;
    QRExpEconomico_Suma_CapVenExi: TQRExpr;
    QRExpEconomico_Suma_CapVigImp: TQRExpr;
    QRExpEconomico_Suma_CapVigVig: TQRExpr;
    QRExpMoneda_Suma_ImporteDisp: TQRExpr;
    QRExpMoneda_Suma_AdeudoTot: TQRExpr;
    QRExpMoneda_Suma_IntVenExi: TQRExpr;
    QRExpMoneda_Suma_IntVigImp: TQRExpr;
    QRExpMoneda_Suma_IntVigDev: TQRExpr;
    QRExpMoneda_Suma_CapVenNoExi: TQRExpr;
    QRExpMoneda_Suma_CapVenExi: TQRExpr;
    QRExpMoneda_Suma_CapVigImp: TQRExpr;
    QRExpMoneda_Suma_CapVigVig: TQRExpr;
    QRLabel8: TQRLabel;
    QRLabel1: TQRLabel;
    QRShape10: TQRShape;
    QRLabel11: TQRLabel;
    QRShape11: TQRShape;
    QRLabel12: TQRLabel;
    QRShape12: TQRShape;
    QRLabel14: TQRLabel;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape15: TQRShape;
    QRLabel19: TQRLabel;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel29: TQRLabel;
    QRExpEconomico_Suma_IntVenOrd: TQRExpr;
    QRExpMoneda_Suma_IntVenOrd: TQRExpr;
    QRLabel37: TQRLabel;
    QRDBText34: TQRDBText;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape20: TQRShape;
    QRShape1: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText7: TQRDBText;
    QRShape2: TQRShape;
    QRShape5GVL: TQRShape;
    QRShape5: TQRShape;
    QRShape3: TQRShape;
    QRDBText5: TQRDBText;
    QRLabel6: TQRLabel;
    QRShape4: TQRShape;
    QRExpAcreditado_Suma_Contingente: TQRExpr;
    QRExpEconomico_Suma_Contingente: TQRExpr;
    QRExpMoneda_Suma_Contingente: TQRExpr;
    QRExprSumTotAcreditado: TQRExpr;
    QRExpSumToTGrpEconomico: TQRExpr;
    QRESumTotMoneda: TQRExpr;
    QRExpAcreRiesgoAcum: TQRExpr;
    QRExpAcreditado_Suma_RiesgoAcum: TQRExpr;
    QRExpEconomico_Suma_RiesgoAcum: TQRExpr;
    QRExpMoneda_Suma_RiesgoAcum: TQRExpr;
    QRDBText6: TQRDBText;
    qyConsAdeudo: TQuery;
    FloatField1: TFloatField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    FloatField13: TFloatField;
    FloatField14: TFloatField;
    qyConsAdeudoIMP_CONTINGENTE: TFloatField;
    QRLTot_ImpAut: TQRLabel;
    QRLTot_CapViVi: TQRLabel;
    QRLTot_CapViIm: TQRLabel;
    QRLTot_CapVeEx: TQRLabel;
    QRLTot_CapVeNEx: TQRLabel;
    QRLTot_IntViDe: TQRLabel;
    QRLTot_IntViIm: TQRLabel;
    QRLTot_IntVeEx: TQRLabel;
    QRLTot_IntVeOr: TQRLabel;
    QRLTot_AdTo: TQRLabel;
    QRLTot_LiDi: TQRLabel;
    QRLTot_RiAc: TQRLabel;
    QRLTot_ImCo: TQRLabel;
    QRLTipoCambio: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape6: TQRShape;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    qyConsAdeudoF_VENCIMIENTO: TDateTimeField;
    procedure QRBDetalleBeforePrint             (Sender:TQRCustomBand  ;var PrintBand:  Boolean);
    procedure QRFooterAcreditadoBeforePrint     (Sender:TQRCustomBand  ;var PrintBand:  Boolean);
    procedure qrgrpFooterMonedaBeforePrint      (Sender:TQRCustomBand  ;var PrintBand:  Boolean);
    procedure qrgrpFooterGpoEconomicoBeforePrint(Sender:TQRCustomBand  ;var PrintBand:  Boolean);
    procedure SummaryBand1BeforePrint           (Sender:TQRCustomBand  ;var PrintBand:  Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure QRGMonedaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);

  Private
  Public
    vgFechaMesAnt  : TDate;
    vgTCambioMesAnt: Double;
    vgTCambioUDIS  : Double;
    tc             : Double;
    Function FormaQuery(sMoneda, sGpoEconomico, sAcreditado: String; dFecha: TDateTime ): String;
    Function SQLFechaInicio(fecha :TdateTime):String ;

  end;             

Var
  QrConAdeTot : TQrConAdeTot;

  Apli        : TInterApli;
  sArchivo    : String;
  bGenArch    : Boolean;
  F           : TextFile;
  vlFecha     : TDateTime;
  vSumPesos_ImpAut,
  vSumPesos_CapVigVig,
  vSumPesos_CapVigImp,
  vSumPesos_CapVenExi,
  vSumPesos_CapVenNoExi,
  vSumPesos_IntVigDev,
  vSumPesos_IntVigImp,
  vSumPesos_IntVenExi,
  vSumPesos_IntVenOrd,
  vSumPesos_AdeudoTot,
  vSumPesos_ImporteDisp,
  vSumPesos_RiesgoAcum,
  vSumPesos_ImpContinge:Double;

Procedure RepConsolidAdeudo(sMoneda,sGpoEconomico,sAcreditado,sNbrArch:String;dFecha:TDateTime;pAPli:TInterApli;pPreview:Boolean);

Implementation
uses IntCnsadto;
{$R *.DFM}

Procedure RepConsolidAdeudo(sMoneda,sGpoEconomico,sAcreditado,sNbrArch:String;dFecha:TDateTime;pAPli:TInterApli;pPreview:Boolean);
Var
   QrConAdeTot : TQrConAdeTot;
   Preview     : TIntQRPreview;
Begin
   QrConAdeTot:=TQrConAdeTot.Create(Nil);
   Preview    :=TIntQRPreview.CreatePreview(Application,QrConAdeTot);
   Try

      vlFecha:=dFecha; //Asignacion de la fecha de la interfase INTCNSADTO.

      bGenArch:= False;
      sArchivo:= sNbrArch;
      Apli    := pApli;
      QrConAdeTot.QRInterEncabezado1.Apli      :=pApli;
      QrConAdeTot.QRInterEncabezado1.IdEmpresa :=pAPli.IdEmpresa;
      QrConAdeTot.QRInterEncabezado1.NomReporte:='IntMQrConAdeTot';
      QrConAdeTot.QRInterEncabezado1.Titulo1   :='Reporte de Consolidado de Adeudos Totales';
      QrConAdeTot.QRInterEncabezado1.Titulo2   :=' Al ' + DateToStr(dFecha);

      QrConAdeTot.qyConsAdeudo.DatabaseName := pApli.DataBaseName;
      QrConAdeTot.qyConsAdeudo.SessionName  := pApli.SessionName;
      QrConAdeTot.qyConsAdeudo.Active       :=False;
      QrConAdeTot.qyConsAdeudo.SQL.Text     := QrConAdeTot.FormaQuery(sMoneda, sGpoEconomico, sAcreditado, dFecha);
      QrConAdeTot.qyConsAdeudo.SQL.SaveToFile('c:\CONS_ADEU_TOT.txt');
      QrConAdeTot.qyConsAdeudo.Active       :=True;

      If Trim(sArchivo)<>'' Then Begin
         AssignFile(F, sArchivo);
         Rewrite(F);
         Writeln(F, QrConAdeTot.QRInterEncabezado1.Titulo1 + #09 );
         Writeln(F, QrConAdeTot.QRInterEncabezado1.Titulo2+ #09 );
         Writeln(F,  #09 );
         Writeln(F, #09#09#09#09#09#09#09#09#09#09#09#09#09 + 'CAPITAL'+ #09#09#09#09 +'INTERES'+ #09);
         Writeln(F,
             'Mon'+ #09 +
             'Moneda'+ #09 +
             'Cve. Gpo. Eco.'+ #09 +
             'Grupo Económico'+ #09 +
             'Num. Acreditado'+ #09 +
             'Acreditado'+ #09 +
             'Autorización'+ #09 +
             'Tipo de Producto '+ #09+'Descripción de Producto ' +#09 +
             'Importe Autorización' +#09 +
             'Vigente'+ #09 +
             'Impagado' +  #09+
             'Exigible' +  #09 +
             'No exigible' +  #09 +
             'Vigente'+ #09 +
             'Impagado' +  #09+
             'Exigible' +  #09 +
             'Ctas Ord' +  #09 +
             'Riesgo Ejercido' +  #09 +
             'Riesgo Contingente (CCI)'  + #09 +
             'Importe Disponible (Linea)' + #09 +
             'Riesgo Acumulado' + #09 +
             'Fecha Vencimiento'
           );
      End;

      If pPreview Then
         QrConAdeTot.Preview
      Else
         QrConAdeTot.Print;
   Finally
      If Trim(sArchivo)<>'' Then Begin
         bGenArch:= True;
         CloseFile(F);
      End;
      QrConAdeTot.free;
      If Assigned(Preview) Then Preview.Free;
   End;
End;

Function TQrConAdeTot.FormaQuery(sMoneda, sGpoEconomico, sAcreditado: String;dFecha: TDateTime ): String;
Var sSQL,cad: String;
Begin

    sSQL :='SELECT cve_moneda, desc_moneda, cve_grupo, desc_gpo, titular, contrato, '+ coCRLF +
          '       cve_producto, desc_producto,F_VENCIMIENTO, nombre, imp_autorizado, vigente_cp, '+ coCRLF +
          '       impagado_cp, exigible_cp, noexigible_cp, vigente_in, impagado_in, '+ coCRLF +
          '       exigible_in, cta_ord_in, tot_adeudo, '+ coCRLF +
//          '       (pkgcrsaldos.stpobtdisponibleaut (contrato, 1) - imp_contingente ) disp_linea, '+ coCRLF +
          '       (pkgcrsaldos.stpobtdisponibleaut (contrato, 1) - imp_total_cci ) disp_linea, '+ coCRLF +
          '       imp_contingente, '+ coCRLF +
          '       imp_total_cci '+ coCRLF +
          '  FROM (SELECT   cve_moneda, desc_moneda, cve_grupo, desc_gpo, titular, '+ coCRLF +
          '                 contrato, cve_producto, desc_producto, F_VENCIMIENTO,nombre, '+ coCRLF +
          '                 imp_autorizado, SUM (vigente_cp) AS vigente_cp, '+ coCRLF +
          '                 SUM (impagado_cp) AS impagado_cp, '+ coCRLF +
          '                 SUM (exigible_cp) AS exigible_cp, '+ coCRLF +
          '                 SUM (noexigible_cp) AS noexigible_cp, '+ coCRLF +
          '                 SUM (vigente_in) AS vigente_in, '+ coCRLF +
          '                 SUM (impagado_in) AS impagado_in, '+ coCRLF +
          '                 SUM (exigible_in) AS exigible_in, '+ coCRLF +
          '                 SUM (cta_ord_in) AS cta_ord_in, '+ coCRLF +
          '                 SUM (tot_adeudo) AS tot_adeudo, '+ coCRLF +
          '--    0                  as DISP_LINEA, '+ coCRLF +
          '                 SUM (imp_contingente) AS imp_contingente, '+ coCRLF +
          '                 SUM (imp_total_cci) AS imp_total_cci '+ coCRLF +
          '            FROM ( '+ coCRLF +
          '--  //INTERCREDITOS - INTERCREDITOS - INTERCREDITOS - INTERCREDITOS - INTERCREDITOS - INTERCREDITOS - INTERCREDITOS '+ coCRLF +
          '                  SELECT ccto.id_contrato AS contrato, '+ coCRLF +
          '                         SUBSTR (csb.cve_sub_tip_bco, 1, 6) AS cve_producto, '+ coCRLF +
          '                         SUBSTR (csb.desc_sub_tipo, 1, 40) AS desc_producto, '+ coCRLF +
          '                         ccto.F_AUT_CREDITO + ccto.DIAS_PLAZO as f_vencimiento, '+ coCRLF +
          '                         cre.id_credito AS credito, '+ coCRLF +
          '                         ccto.imp_autorizado AS imp_autorizado, '+ coCRLF +
          '                         cto.cve_moneda AS cve_moneda, '+ coCRLF +
          '                         mon.desc_moneda AS desc_moneda, '+ coCRLF +
          '                         NVL (cac.cve_grupo, '''') AS cve_grupo, '+ coCRLF +
          '                         NVL (cge.desc_grupo, '+ coCRLF +
          '                              ''SIN GRUPO ECONOMICO'' '+ coCRLF +
          '                             ) AS desc_gpo, '+ coCRLF +
          '                         cto.id_titular AS titular, '+ coCRLF +
          '                         SUBSTR '+ coCRLF +
          '                            (pkgcrconsolidado.fun_nom_tit_cred (cto.id_titular), '+ coCRLF +
          '                             1, '+ coCRLF +
          '                             80 '+ coCRLF +
          '                            ) AS nombre, '+ coCRLF +
          '                         cas.imp_cap_vig AS vigente_cp, '+ coCRLF +
          '                         cas.imp_cap_vdo_ne AS noexigible_cp, '+ coCRLF +
          '                         cas.imp_cap_imp AS impagado_cp, '+ coCRLF +
          '                         cas.imp_cap_vdo_ex AS exigible_cp, '+ coCRLF +
          '                         cas.imp_int_vig AS vigente_in, '+ coCRLF +
          '                         cas.imp_int_imp AS impagado_in, '+ coCRLF +
          '                         cas.imp_int_vdo_ex AS exigible_in, '+ coCRLF +
          '                         cas.imp_ctas_ord AS cta_ord_in, '+ coCRLF +
          '                         (  cas.imp_cap_vig '+ coCRLF +
          '                          + cas.imp_cap_vdo_ne '+ coCRLF +
          '                          + cas.imp_cap_imp '+ coCRLF +
          '                          + cas.imp_cap_vdo_ex '+ coCRLF +
          '                          + cas.imp_int_vig '+ coCRLF +
          '                          + cas.imp_int_imp '+ coCRLF +
          '                          + cas.imp_int_vdo_ex '+ coCRLF +
          '                          + cas.imp_ctas_ord '+ coCRLF +
          '                         ) AS tot_adeudo, '+ coCRLF +
          '                         0 AS imp_contingente, '+ coCRLF +
          '                         0 AS imp_total_cci '+ coCRLF +
          '                    FROM cr_con_adeudo_sdo cas, '+ coCRLF +
          '                         cre_credito cre, '+ coCRLF +
          '                         contrato cto, '+ coCRLF +
          '                         cre_cliente cac, '+ coCRLF +
          '                         moneda mon, '+ coCRLF +
          '                         cre_grupo_empr cge, '+ coCRLF +
          '                         cre_sub_tip_bco csb, '+ coCRLF +
          '                         --cre_contrato ccto    --RABA B-6 SE CAMBIA A HISTORICOS'+ coCRLF +
// RABA JUL 2015 B-6
// SE CAMBIA LA TABLA CRE_CONTRATO POR UNA CONSULTA HISTÓRICA
//           '             CRE_CONTRATO        CCTO,' + coCRLF +
           '                       Table (PKGCRBitacoraViews.VW_CRE_Contrato_CveSubTipoBco ('+SQLFecha(dFecha)+')) CCTO '+coCRLF+
// FIN RABA JUL 2015 B-6
          '                   WHERE cto.id_empresa = 2 '+ coCRLF +
          '                     AND cas.f_cierre = '+SQLFecha(dfecha)+ coCRLF +
          '                     AND (   (    csb.f_traspaso_icre IS NOT NULL '+ coCRLF +
          '                              AND cre.sit_credito NOT IN (''TA'') '+ coCRLF +
          '                             ) '+ coCRLF +
          '                          OR csb.f_traspaso_icre IS NULL '+ coCRLF +
          '                         ) '+ coCRLF +
          '                     AND cre.id_credito = cas.id_credito '+ coCRLF +
          '                     AND ccto.id_contrato = cre.id_contrato '+ coCRLF +
          '                     AND csb.cve_sub_tip_bco = ccto.cve_sub_tip_bco_old '+ coCRLF +  //RABA B-6 HISTORICOS
          '                     AND mon.cve_moneda = cto.cve_moneda '+ coCRLF +
          '                     AND cto.id_contrato = ccto.id_contrato '+ coCRLF +
          '                     AND cac.id_persona = cto.id_titular '+ coCRLF +
          '                     AND cge.cve_grupo(+) = cac.cve_grupo '+ coCRLF +
          '                     AND cre.sit_credito NOT IN (''TA'') '+ coCRLF +
          '                  UNION ALL '+ coCRLF +
          '--rac  //ICRE01 - ICRE01 - ICRE01 - ICRE01 - ICRE01 - ICRE01 - ICRE01 - ICRE01 - ICRE01 - ICRE01 - ICRE01 - ICRE01 - ICRE01 '+ coCRLF +
          '                  SELECT ccto.id_contrato AS contrato, '+ coCRLF +
          '                         ccto.cve_producto_OLD AS cve_producto, '+ coCRLF +  //RABA JUL 2015 HISTORICOS
          '                         cpr.desc_c_producto AS desc_producto, '+ coCRLF +
          '                         ccto.F_VENCIMIENTO AS F_VENCIMIENTO, '+ coCRLF +
          '                         cre.id_credito AS credito, ccto.imp_autorizado, '+ coCRLF +
          '                         ccto.cve_moneda AS cve_moneda, '+ coCRLF +
          '                         mon.desc_moneda AS desc_moneda, '+ coCRLF +
          '                         NVL (cac.cve_grupo_eco, '''') AS cve_grupo, '+ coCRLF +
          '                         NVL (cge.desc_grupo_eco, '+ coCRLF +
          '                              ''SIN GRUPO ECONOMICO'' '+ coCRLF +
          '                             ) AS desc_gpo, '+ coCRLF +
          '                         cto.id_titular AS titular, '+ coCRLF +
          '                         SUBSTR '+ coCRLF +
          '                            (pkgcrconsolidado.fun_nom_tit_cred (cto.id_titular), '+ coCRLF +
          '                             1, '+ coCRLF +
          '                             80 '+ coCRLF +
          '                            ) nombre, '+ coCRLF +
          '                         cas.imp_cap_vig AS vigente_cp, '+ coCRLF +
          '                         cas.imp_cap_vdo_ne AS noexigible_cp, '+ coCRLF +
          '                         cas.imp_cap_imp AS impagado_cp, '+ coCRLF +
          '                         cas.imp_cap_vdo_ex AS exigible_cp, '+ coCRLF +
          '                         cas.imp_int_vig AS vigente_in, '+ coCRLF +
          '                         cas.imp_int_imp AS impagado_in, '+ coCRLF +
          '                         cas.imp_int_vdo_ex AS exigible_in, '+ coCRLF +
          '                         cas.imp_ctas_ord AS cta_ord_in, '+ coCRLF +
          '                           cas.imp_cap_vig '+ coCRLF +
          '                         + cas.imp_cap_vdo_ne '+ coCRLF +
          '                         + cas.imp_cap_imp '+ coCRLF +
          '                         + cas.imp_cap_vdo_ex '+ coCRLF +
          '                         + cas.imp_int_vig '+ coCRLF +
          '                         + cas.imp_int_imp '+ coCRLF +
          '                         + cas.imp_int_vdo_ex '+ coCRLF +
          '                         + cas.imp_ctas_ord AS tot_adeudo, '+ coCRLF +
          '                         0 AS imp_contingente, '+ coCRLF +
          '                         0 AS imp_total_cci '+ coCRLF +
          '                    FROM cr_con_adeudo_sdo cas, '+ coCRLF +
          '                         cr_credito cre, '+ coCRLF +
          '                         --cr_contrato ccto,    --RABA JUL 2015 B-6 SE SUSTITUYE POR HISTORICOS'+ coCRLF +
          '                         --cr_producto cpr,     --RABA JUL 2015 B-6 SE SUSTITUYE POR HISTORICOS'+ coCRLF +
// RABA JUL 2015 B-6
// SE CAMBIAN LAS TABLAS CR_CONTRATO Y CR_PRODUCTO POR CONSULTAS QUE OBTIENEN DATOS MODIFICADOS HISTORICOS
//           '             CR_CONTRATO         CCTO, ' + coCRLF +
//           '             CR_PRODUCTO         CPR, ' + coCRLF +
           '                        Table (PKGCRBitacoraViews.VW_CR_Contrato_Prod ('+SQLFecha(dFecha)+')) CCTO, '+coCRLF+
           '                        Table (PKGCRBitacoraViews.VW_CR_Producto_Cat_Min ('+SQLFecha(dFecha)+')) CPR, ' + coCRLF +
// FIN RABA JUL 2015 B-6
          '                         cr_fnd_credito cfn, '+ coCRLF +
          '                         contrato cto, '+ coCRLF +
          '                         cr_acreditado cac, '+ coCRLF +
          '                         moneda mon, '+ coCRLF +
          '                         cr_grupo_eco cge, '+ coCRLF +
          '                         cre_presupuesto crp '+ coCRLF +
          '                   WHERE cto.id_empresa = 2 '+ coCRLF +
          '                     AND cas.f_cierre = '+SQLFecha(dFecha) + coCRLF +
          '                     AND cre.id_credito = cas.id_credito '+ coCRLF +
          '                     AND ccto.id_contrato = cre.id_contrato '+ coCRLF +
          '                     AND cpr.cve_producto_cre = ccto.cve_producto_OLD '+ coCRLF +   //RABA JUL 2015 B-6 HISTORICOS
          '                     AND cfn.id_credito(+) = cre.id_credito '+ coCRLF +
          '                     AND mon.cve_moneda = ccto.cve_moneda '+ coCRLF +
          '                     AND cto.id_contrato = ccto.id_contrato '+ coCRLF +
          '                     AND cac.id_acreditado = cto.id_titular '+ coCRLF +
          '                     AND cge.cve_grupo_eco(+) = cac.cve_grupo_eco '+ coCRLF +
          '                     AND crp.cve_presupuesto = cpr.cve_presupuesto '+ coCRLF +
          '                  UNION '+ coCRLF +
          '                  --LINEAS SIN UTILIZAR '+ coCRLF +
          '                  SELECT ccto.id_contrato AS contrato, '+ coCRLF +
          '                         ccto.cve_producto_OLD AS cve_producto, '+ coCRLF +  //RABA JUL 2015 B-6 HISTORICOS
          '                         cpr.desc_c_producto AS desc_producto, '+ coCRLF +
          '                         ccto.f_vencimiento aS f_vencimiento, '+ coCRLF +
          '                         0 AS credito, '+ coCRLF +
          '                         ccto.imp_autorizado, ccto.cve_moneda AS cve_moneda, '+ coCRLF +
          '                         mon.desc_moneda AS desc_moneda, '+ coCRLF +
          '                         NVL (cac.cve_grupo_eco, '''') AS cve_grupo, '+ coCRLF +
          '                         NVL (cge.desc_grupo_eco,''SIN GRUPO ECONOMICO'') AS desc_gpo, '+ coCRLF +
          '                         cto.id_titular AS titular, '+ coCRLF +
          '                         SUBSTR '+ coCRLF +
          '                            (pkgcrconsolidado.fun_nom_tit_cred (cto.id_titular), '+ coCRLF +
          '                             1, '+ coCRLF +
          '                             80 '+ coCRLF +
          '                            ) nombre, '+ coCRLF +
          '                         0 AS vigente_cp, 0 AS noexigible_cp, '+ coCRLF +
          '                         0 AS impagado_cp, 0 AS exigible_cp, 0 AS vigente_in, '+ coCRLF +
          '                         0 AS impagado_in, 0 AS exigible_in, 0 AS cta_ord_in, '+ coCRLF +
          '                         0 AS tot_adeudo, 0 AS imp_contingente, '+ coCRLF +
          '                         0 AS imp_total_cci '+ coCRLF +
          '                    FROM --cr_contrato ccto,    --RABA JUL 2015 B-6 HISTORICOS'+ coCRLF +
          '                         --cr_producto cpr,     --RABA JUL 2015 B-6 HISTORICOS'+ coCRLF +
// RABA JUL 2015 B-6
// SE CAMBIAN LAS TABLAS CR_CONTRATO Y CR_PRODUCTO POR CONSULTAS QUE OBTIENEN DATOS MODIFICADOS HISTORICOS
//           '             CR_CONTRATO         CCTO, ' + coCRLF +
//           '             CR_PRODUCTO         CPR, ' + coCRLF +
           '                        Table (PKGCRBitacoraViews.VW_CR_Contrato_Prod ('+SQLFecha(dFecha)+')) CCTO, '+coCRLF+
           '                        Table (PKGCRBitacoraViews.VW_CR_Producto_Cat_Min ('+SQLFecha(dFecha)+')) CPR, ' + coCRLF +
// FIN RABA JUL 2015 B-6
          '                         contrato cto, '+ coCRLF +
          '                         cr_acreditado cac, '+ coCRLF +
          '                         moneda mon, '+ coCRLF +
          '                         cr_grupo_eco cge, '+ coCRLF +
          '                         cre_presupuesto crp '+ coCRLF +
          '                   WHERE 1 = 1 '+ coCRLF +
          '                     AND ccto.f_aut_comite <= '+SQLFecha(dFecha) + coCRLF +
          '                     AND ccto.f_vencimiento >= '+SQLFecha(dFecha)+ coCRLF +
          '                     AND ccto.sit_linea IN (''AU'') '+ coCRLF +
          '                     AND ccto.id_contrato NOT IN (SELECT id_contrato '+ coCRLF +
          '                                                    FROM cr_credito '+ coCRLF +
          '                                                   WHERE sit_credito = ''AC'') '+ coCRLF +
          '                     AND pkgcrsaldos.stpobtdisponibleaut (ccto.id_contrato, 1) > '+ coCRLF +
          '                                                                             0 '+ coCRLF +
          '                     AND cto.id_empresa = 2 '+ coCRLF +
          '                     AND cpr.cve_producto_cre = ccto.cve_producto_OLD '+ coCRLF +  //RABA JUL 2015 B-6 HISTORICOS
          '                     AND mon.cve_moneda = ccto.cve_moneda '+ coCRLF +
          '                     AND cto.id_contrato = ccto.id_contrato '+ coCRLF +
          '                     AND cac.id_acreditado = cto.id_titular '+ coCRLF +
          '                     AND cge.cve_grupo_eco(+) = cac.cve_grupo_eco '+ coCRLF +
          '                     AND crp.cve_presupuesto = cpr.cve_presupuesto '+ coCRLF +
          '                     and ccto.F_REESTRUCTURA is null  '+ coCRLF +      //RABA JUL 2015 B-6 PARA NO CONSIDERAR LAS LÍNEAS REESTRUCTURADAS
          '                  -- '+ coCRLF +
          '                  UNION ALL '+ coCRLF +
          '                  --  C A R T A S       D E     C R E D I T O '+ coCRLF +
          '                  SELECT RESULT.id_contrato AS contrato, '+ coCRLF +
          '                         crcont.cve_producto_OLD AS cve_producto, '+ coCRLF +   //RABA JUL 2015 B-6 HISTORICOS
          '                         cpr.desc_c_producto AS desc_producto, '+ coCRLF +
          '                         crcont.f_vencimiento as f_vencimiento, '+ coCRLF +
          '                         RESULT.id_credito AS credito, '+ coCRLF +
          '                         (SELECT imp_autorizado '+ coCRLF +
          '                            FROM cr_contrato '+ coCRLF +
          '                           WHERE id_contrato = '+ coCRLF +
          '                                         RESULT.id_contrato) '+ coCRLF +
          '                                                            AS imp_autorizado, '+ coCRLF +
          '                         RESULT.cve_moneda, m.desc_moneda, '+ coCRLF +
          '                         NVL (ca.cve_grupo_eco, '''') AS cve_grupo, '+ coCRLF +
          '                         NVL (cge.desc_grupo_eco, '+ coCRLF +
          '                              ''SIN GRUPO ECONOMICO'' '+ coCRLF +
          '                             ) AS desc_gpo, '+ coCRLF +
          '                         RESULT.id_titular AS titular, '+ coCRLF +
          '                         SUBSTR '+ coCRLF +
          '                            (pkgcrconsolidado.fun_nom_tit_cred '+ coCRLF +
          '                                                            (RESULT.id_titular), '+ coCRLF +
          '                             1, '+ coCRLF +
          '                             80 '+ coCRLF +
          '                            ) AS nombre, '+ coCRLF +
          '                         0 AS vigente_cp, 0 AS noexigible_cp, '+ coCRLF +
          '                         0 AS impagado_cp, 0 AS exigible_cp, 0 AS vigente_in, '+ coCRLF +
          '                         0 AS impagado_in, 0 AS exigible_in, 0 AS cta_ord_in, '+ coCRLF +
          '                         0 AS tot_adeudo, '+ coCRLF +
//          '                         RESULT.imp_total_cci AS imp_contingente, '+ coCRLF +
          '                         RESULT.saldo_cci AS imp_contingente, '+ coCRLF +
          '                         RESULT.imp_total_cci '+ coCRLF +
          '                    FROM (SELECT ccc1.id_contrato, cto.cve_moneda, '+ coCRLF +
          '                                 cto.id_titular, ccc1.id_credito, '+ coCRLF +
          '                                 ccc1.imp_credito, pct_adicional, '+ coCRLF +
          '                                   ccc1.imp_credito '+ coCRLF +
          '                                 + ROUND (  ccc1.imp_credito '+ coCRLF +
          '                                          * ccc1.pct_adicional '+ coCRLF +
          '                                          / 100, '+ coCRLF +
          '                                          2 '+ coCRLF +
          '                                         ) AS imp_total_cci, '+ coCRLF +
          '                                   ccc1.imp_credito '+ coCRLF +
          '                                 + ROUND (  ccc1.imp_credito '+ coCRLF +
          '                                          * ccc1.pct_adicional '+ coCRLF +
          '                                          / 100, '+ coCRLF +
          '                                          2 '+ coCRLF +
          '                                         ) '+ coCRLF +
          '                                 + NVL (cci_transac.sum_imp_concepto, 0) '+ coCRLF +
          '                                                                 AS saldo_cci '+ coCRLF +
          '                            FROM (   -- Obtiene las cartas de crédito Vigentes '+ coCRLF +
          '                                  SELECT ccc.id_contrato, ccc.id_credito, '+ coCRLF +
          '                                         ccc.imp_credito, '+ coCRLF +
          '                                         NVL '+ coCRLF +
          '                                            (ccc.pct_adicional, '+ coCRLF +
          '                                             0 '+ coCRLF +
          '                                            ) AS pct_adicional '+ coCRLF +
          '                                    FROM cr_con_reg_cci ccc '+ coCRLF +
          '                                   WHERE ccc.id_reg_vigente = 1 '+ coCRLF +
          '                                     AND (   (    ccc.f_disposicion <= '+ SQLFecha(dfecha)+coCRLF +
          '                                     AND ccc.sit_con_reg_cci = ''AC'' )'+ coCRLF +
          '                                          OR (ccc.f_liquidacion > '+SQLFecha(dfecha) +')'+ coCRLF +
          '                                          OR (ccc.f_liquidacion BETWEEN '+SQLFechaInicio(Dfecha)+' AND ' + SQLFecha(dfecha) +' ) '+ coCRLF +
          '                                         ) '+ coCRLF +
          '                                 ) ccc1, '+ coCRLF +
          '                                 ( '+ coCRLF +
          '                   -- Obtiene todas las afectaciones de las cartas de créditos '+ coCRLF +
          '                                  -- aplicadas al corte solicitado '+ coCRLF +
          '                                  SELECT   cci.id_credito, '+ coCRLF +
          '                                           SUM '+ coCRLF +
          '                                              (  NVL (cci.imp_concepto, 0) '+ coCRLF +
          '                                               * DECODE '+ coCRLF +
          '                                                       (ccconc.cve_afec_saldo, '+ coCRLF +
          '                                                        ''I'', 1, '+ coCRLF +
          '                                                        ''D'', -1, '+ coCRLF +
          '                                                        0 '+ coCRLF +
          '                                                       ) '+ coCRLF +
          '                                              ) AS sum_imp_concepto '+ coCRLF +
          '                                      FROM (SELECT ccc2.id_credito '+ coCRLF +
          '                                              FROM cr_con_reg_cci ccc2 '+ coCRLF +
          '                                             WHERE ccc2.id_reg_vigente = 1 '+ coCRLF +
          '                                               AND (   (    ccc2.f_disposicion <= '+ SQLFecha(dfecha) + coCRLF +
          '                                                        AND ccc2.sit_con_reg_cci = '+ coCRLF +
          '                                                                          ''AC'' '+ coCRLF +
          '                                                       ) '+ coCRLF +
          '                                                    OR (ccc2.f_liquidacion > '+ SQLFecha(dfecha) + ' )'+coCRLF +
          '                                                       ) '+ coCRLF +
          '                                                    OR (ccc2.f_liquidacion '+ coCRLF +
          '                                                           BETWEEN '+SQLFechaInicio(dfecha)+' AND '+ SQLFecha(dfecha) + coCRLF +
          '                                                   )) ccc3, '+ coCRLF +
          '                                           cr_cci_transac cci, '+ coCRLF +
          '                                           cr_cci_concepto ccconc '+ coCRLF +
          '                                     WHERE cci.id_credito = ccc3.id_credito '+ coCRLF +
          '                                       AND cci.f_operacion <= '+SQLFecha(dFecha) + coCRLF +
          '                                       AND cci.sit_cci_transac <> ''CA'' '+ coCRLF +
          '                                       AND ccconc.cve_cci_concepto = '+ coCRLF +
          '                                                          cci.cve_cci_concepto '+ coCRLF +
          '                                  GROUP BY cci.id_credito) cci_transac, '+ coCRLF +
          '                                 ( '+ coCRLF +
          '                   -- Obtiene todas las afectaciones de las cartas de créditos '+ coCRLF +
          '                   -- aplicadas en el MES solicitado '+ coCRLF +
          '                                  SELECT   cci.id_credito, '+ coCRLF +
          '                                           SUM '+ coCRLF +
          '                                              (  NVL (cci.imp_concepto, 0) '+ coCRLF +
          '                                               * DECODE '+ coCRLF +
          '                                                       (ccconc.cve_afec_saldo, '+ coCRLF +
          '                                                        ''I'', 1, '+ coCRLF +
          '                                                        ''D'', -1, '+ coCRLF +
          '                                                        0 '+ coCRLF +
          '                                                       ) '+ coCRLF +
          '                                              ) AS sum_imp_concepto_mes '+ coCRLF +
          '                                      FROM (SELECT ccc2.id_credito '+ coCRLF +
          '                                              FROM cr_con_reg_cci ccc2 '+ coCRLF +
          '                                             WHERE ccc2.id_reg_vigente = 1 '+ coCRLF +
          '                                               AND (   (    ccc2.f_disposicion <= '+ SQLFecha(dFecha)+' )'+coCRLF +
          '                                                        AND ccc2.sit_con_reg_cci = ''AC''' + coCRLF +
          '                                                       ) '+ coCRLF +
          '                                                    OR (ccc2.f_liquidacion > '+ SQLFecha(dfecha) +' ) '+coCRLF +
          '                                                    OR (ccc2.f_liquidacion BETWEEN '+SQLFechaInicio(dfecha) +' AND ' +SQLFecha(dfecha) + coCRLF +
          '                                                   )) ccc3, '+ coCRLF +
          '                                           cr_cci_transac cci, '+ coCRLF +
          '                                           cr_cci_concepto ccconc '+ coCRLF +
          '                                     WHERE cci.id_credito = ccc3.id_credito '+ coCRLF +
          '                                       AND cci.f_operacion BETWEEN '+SQLFechaInicio(dfecha)+' AND '+SQLFecha(dfecha) +coCRLF +
          '                                       AND cci.sit_cci_transac <> ''CA'' '+ coCRLF +
          '                                       AND ccconc.cve_cci_concepto = '+ coCRLF +
          '                                                          cci.cve_cci_concepto '+ coCRLF +
          '                                  GROUP BY cci.id_credito) cci_transac_mes, '+ coCRLF +
          '                                 contrato cto '+ coCRLF +
          '                           WHERE cto.id_contrato = ccc1.id_contrato '+ coCRLF +
          '                             AND cci_transac.id_credito(+) = ccc1.id_credito '+ coCRLF +
          '                             AND cci_transac_mes.id_credito(+) = '+ coCRLF +
          '                                                               ccc1.id_credito) RESULT, '+ coCRLF +
          '                         moneda m, '+ coCRLF +
          '                         cr_acreditado ca, '+ coCRLF +
          '                         cr_grupo_eco cge, '+ coCRLF +
          '                         --cr_contrato crcont,    --RABA JUL 2015 B-6 HISTORICOS'+ coCRLF +
          '                         --cr_producto cpr        --RABA JUL 2015 B-6 HISTORICOS'+ coCRLF +
// RABA JUL 2015 B-6
// SE CAMBIAN LAS TABLAS CR_CONTRATO Y CR_PRODUCTO POR CONSULTAS QUE OBTIENEN DATOS MODIFICADOS HISTORICOS
//           '             CR_CONTRATO         crcont, ' + coCRLF +
//           '             CR_PRODUCTO         cpr ' + coCRLF +
           '                        Table (PKGCRBitacoraViews.VW_CR_Contrato_Prod ('+SQLFecha(dFecha)+')) crcont, '+coCRLF+
           '                        Table (PKGCRBitacoraViews.VW_CR_Producto_Cat_Min ('+SQLFecha(dFecha)+')) CPR ' + coCRLF +
// FIN RABA JUL 2015 B-6
          '                   WHERE m.cve_moneda = RESULT.cve_moneda '+ coCRLF +
          '                     AND ca.id_acreditado = RESULT.id_titular '+ coCRLF +
          '                     AND cge.cve_grupo_eco(+) = ca.cve_grupo_eco '+ coCRLF +
          '                     AND crcont.id_contrato = RESULT.id_contrato '+ coCRLF +
          '                     AND cpr.cve_producto_cre = crcont.cve_producto_OLD )datos '+ coCRLF +  //RABA JUL 2015 B-6 HISTORICOS
          '                  WHERE 1=1 ';

           If (Trim(sMoneda)<>'')      Then sSQL := sSQL + '   AND DATOS.CVE_MONEDA = ' + sMoneda + coCRLF ;
           If (Trim(sGpoEconomico)<>'')Then sSQL := sSQL + '   AND DATOS.CVE_GRUPO  = ' + SQLStr(sGpoEconomico) + coCRLF;
           If (Trim(sAcreditado)<>'')  Then sSQL := sSQL + '   AND DATOS.TITULAR    = ' + sAcreditado + coCRLF;

   sSQL  := sSQL + '  GROUP BY CVE_MONEDA,DESC_MONEDA,CVE_GRUPO,DESC_GPO,TITULAR,CONTRATO,CVE_PRODUCTO,DESC_PRODUCTO,F_VENCIMIENTO,NOMBRE,IMP_AUTORIZADO '+ coCRLF +
                   '  ORDER BY CVE_MONEDA,CVE_GRUPO,TITULAR,cve_producto, CONTRATO )';
  Result:= sSQL;

End;

procedure TQrConAdeTot.QRBDetalleBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
      PrintBand := True;
      With qyConsAdeudo do begin
        vSumPesos_ImpAut     :=vSumPesos_ImpAut     +FieldByName('IMP_AUTORIZADO') .AsFloat*tc;
        vSumPesos_CapVigVig  :=vSumPesos_CapVigVig  +FieldByName('VIGENTE_CP')     .AsFloat*tc;
        vSumPesos_CapVigImp  :=vSumPesos_CapVigImp  +FieldByName('IMPAGADO_CP')    .AsFloat*tc;
        vSumPesos_CapVenExi  :=vSumPesos_CapVenExi  +FieldByName('EXIGIBLE_CP')    .AsFloat*tc;
        vSumPesos_CapVenNoExi:=vSumPesos_CapVenNoExi+FieldByName('NOEXIGIBLE_CP')  .AsFloat*tc;
        vSumPesos_IntVigDev  :=vSumPesos_IntVigDev  +FieldByName('VIGENTE_IN')     .AsFloat*tc;
        vSumPesos_IntVigImp  :=vSumPesos_IntVigImp  +FieldByName('IMPAGADO_IN')    .AsFloat*tc;
        vSumPesos_IntVenExi  :=vSumPesos_IntVenExi  +FieldByName('EXIGIBLE_IN')    .AsFloat*tc;
        vSumPesos_IntVenOrd  :=vSumPesos_IntVenOrd  +FieldByName('CTA_ORD_IN')     .AsFloat*tc;
        vSumPesos_AdeudoTot  :=vSumPesos_AdeudoTot  +FieldByName('TOT_ADEUDO')     .AsFloat*tc;
        vSumPesos_ImporteDisp:=vSumPesos_ImporteDisp+FieldByName('DISP_LINEA')     .AsFloat*tc;
        vSumPesos_ImpContinge:=vSumPesos_ImpContinge+FieldByName('IMP_CONTINGENTE').AsFloat*tc;
        vSumPesos_RiesgoAcum :=vSumPesos_RiesgoAcum +(FieldByName('TOT_ADEUDO')     .AsFloat +
                                                      FieldByName('DISP_LINEA')     .AsFloat +
                                                      FieldByName('IMP_CONTINGENTE').AsFloat)*tc;
      end;

      If sArchivo <>'' Then Begin
        with qyConsAdeudo do begin
          Writeln(F,
                   FieldByName('CVE_MONEDA')   .AsString + #09 +
                   FieldByName('DESC_MONEDA')  .AsString + #09 +
                   FieldByName('CVE_GRUPO')    .AsString + #09 +
                   FieldByName('DESC_GPO')     .AsString + #09 +
                   FieldByName('TITULAR')      .AsString + #09 +
                   FieldByName('NOMBRE')       .AsString + #09 +
                   FieldByName('CONTRATO')     .AsString + #09 +
                   FieldByName('CVE_PRODUCTO') .AsString + #09 +
                   FieldByName('DESC_PRODUCTO').AsString + #09 +
                   FormatFloat('###,###,###,###,###,##0.00',FieldByName('IMP_AUTORIZADO') .AsFloat)+ #09+
                   FormatFloat('###,###,###,###,###,##0.00',FieldByName('VIGENTE_CP')     .AsFloat)+ #09+
                   FormatFloat('###,###,###,###,###,##0.00',FieldByName('IMPAGADO_CP')    .AsFloat)+ #09+
                   FormatFloat('###,###,###,###,###,##0.00',FieldByName('EXIGIBLE_CP')    .AsFloat)+ #09+
                   FormatFloat('###,###,###,###,###,##0.00',FieldByName('NOEXIGIBLE_CP')  .AsFloat)+ #09+
                   FormatFloat('###,###,###,###,###,##0.00',FieldByName('VIGENTE_IN')     .AsFloat)+ #09+
                   FormatFloat('###,###,###,###,###,##0.00',FieldByName('IMPAGADO_IN')    .AsFloat)+ #09+
                   FormatFloat('###,###,###,###,###,##0.00',FieldByName('EXIGIBLE_IN')    .AsFloat)+ #09+
                   FormatFloat('###,###,###,###,###,##0.00',FieldByName('CTA_ORD_IN')     .AsFloat)+ #09+
                   FormatFloat('###,###,###,###,###,##0.00',FieldByName('TOT_ADEUDO')     .AsFloat)+ #09+
                   FormatFloat('###,###,###,###,###,##0.00',FieldByName('IMP_CONTINGENTE').AsFloat)+ #09+
                   FormatFloat('###,###,###,###,###,##0.00',FieldByName('DISP_LINEA')     .AsFloat)+ #09+
                   FormatFloat('###,###,###,###,###,##0.00',(   FieldByName('TOT_ADEUDO')   .AsFloat +
                                                                FieldByName('DISP_LINEA')   .AsFloat +
                                                                FieldByName('IMP_CONTINGENTE').AsFloat)    )+ #09+
                   FormatDateTime('dd/mmm/yyyy'               ,FieldByName('F_Vencimiento')      .AsDateTime)

                  );
        End;
      End;

end;

procedure TQrConAdeTot.QRFooterAcreditadoBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   If sArchivo <>'' Then Begin
      Writeln(F, #09#09#09 + 'Total por Acreditado' +#09#09#09#09#09#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExprSumTotAcreditado.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExprAcreditado_Suma_CapVigVig .Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExprAcreditado_Suma_CapVigImp .value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpAcreditado_Suma_CapVenExi  .Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpAcreditado_Suma_CapVenNoExi.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpAcreditado_Suma_IntVigDev  .Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpAcreditado_Suma_IntVigImp  .Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpAcreditado_Suma_IntVenExi  .Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpAcreditado_Suma_IntVenOrd  .Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpAcreditado_Suma_AdeudoTot  .Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpAcreditado_Suma_Contingente.value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpAcreditado_Suma_ImporteDisp.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpAcreditado_Suma_RiesgoAcum .value.dblResult)+#09
             );
   End;
end;

procedure TQrConAdeTot.qrgrpFooterMonedaBeforePrint(Sender: TQRCustomBand;var PrintBand: Boolean);
begin
   If sArchivo <>'' Then Begin
      Writeln(F, #09#09#09 + 'Total por Moneda' +#09#09#09#09#09#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRESumTotMoneda.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpMoneda_Suma_CapVigVig.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpMoneda_Suma_CapVigImp.value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpMoneda_Suma_CapVenExi.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpMoneda_Suma_CapVenNoExi.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpMoneda_Suma_IntVigDev.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpMoneda_Suma_IntVigImp.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpMoneda_Suma_IntVenExi.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpMoneda_Suma_IntVenOrd.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpMoneda_Suma_AdeudoTot.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpMoneda_Suma_Contingente.value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpMoneda_Suma_ImporteDisp.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpMoneda_Suma_RiesgoAcum.value.dblResult)+#09
             );
   End;
end;

procedure TQrConAdeTot.qrgrpFooterGpoEconomicoBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   If sArchivo <>'' Then Begin
      Writeln(F, #09#09#09 + 'Total por Grupo Economico' +#09#09#09#09#09#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpSumToTGrpEconomico.Value.dblResult)+#09 +
                  FormatFloat('###,###,###,###,###,##0.00',QRExpEconomico_Suma_CapVigVig.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpEconomico_Suma_CapVigImp.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpEconomico_Suma_CapVenExi.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpEconomico_Suma_CapVenNoExi.value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpEconomico_Suma_IntVigDev.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpEconomico_Suma_IntVigImp.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpEconomico_Suma_IntVenExi.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpEconomico_Suma_IntVenOrd.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpEconomico_Suma_AdeudoTot.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpEconomico_Suma_Contingente.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpEconomico_Suma_ImporteDisp.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpEconomico_Suma_RiesgoAcum.Value.dblResult)+#09
             );
   End;

end;

procedure TQrConAdeTot.SummaryBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin

 With qyConsAdeudo do begin
   QRLTot_ImpAut  .caption:=FormatFloat('###,###,###,###,###,##0.00',vSumPesos_ImpAut     );
   QRLTot_CapViVi .caption:=FormatFloat('###,###,###,###,###,##0.00',vSumPesos_CapVigVig  );
   QRLTot_CapViIm .caption:=FormatFloat('###,###,###,###,###,##0.00',vSumPesos_CapVigImp  );
   QRLTot_CapVeEx .caption:=FormatFloat('###,###,###,###,###,##0.00',vSumPesos_CapVenExi  );
   QRLTot_CapVeNEx.caption:=FormatFloat('###,###,###,###,###,##0.00',vSumPesos_CapVenNoExi);
   QRLTot_IntViDe .caption:=FormatFloat('###,###,###,###,###,##0.00',vSumPesos_IntVigDev  );
   QRLTot_IntViIm .caption:=FormatFloat('###,###,###,###,###,##0.00',vSumPesos_IntVigImp  );
   QRLTot_IntVeEx .caption:=FormatFloat('###,###,###,###,###,##0.00',vSumPesos_IntVenExi  );
   QRLTot_IntVeOr .caption:=FormatFloat('###,###,###,###,###,##0.00',vSumPesos_IntVenOrd  );
   QRLTot_AdTo    .caption:=FormatFloat('###,###,###,###,###,##0.00',vSumPesos_AdeudoTot  );
   QRLTot_ImCo    .caption:=FormatFloat('###,###,###,###,###,##0.00',vSumPesos_ImpContinge);
   QRLTot_LiDi    .caption:=FormatFloat('###,###,###,###,###,##0.00',vSumPesos_ImporteDisp);
   QRLTot_RiAc    .caption:=FormatFloat('###,###,###,###,###,##0.00',vSumPesos_RiesgoAcum );
 end;

  If sArchivo <>'' Then Begin
     Writeln(F, #09#09#09 + 'Total General PESOS' +#09#09#09#09#09#09+
                 FormatFloat('###,###,###,###,###,##0.00',vSumPesos_ImpAut     )+#09+
                 FormatFloat('###,###,###,###,###,##0.00',vSumPesos_CapVigVig  )+#09+
                 FormatFloat('###,###,###,###,###,##0.00',vSumPesos_CapVigImp  )+#09+
                 FormatFloat('###,###,###,###,###,##0.00',vSumPesos_CapVenExi  )+#09+
                 FormatFloat('###,###,###,###,###,##0.00',vSumPesos_CapVenNoExi)+#09+
                 FormatFloat('###,###,###,###,###,##0.00',vSumPesos_IntVigDev  )+#09+
                 FormatFloat('###,###,###,###,###,##0.00',vSumPesos_IntVigImp  )+#09+
                 FormatFloat('###,###,###,###,###,##0.00',vSumPesos_IntVenExi  )+#09+
                 FormatFloat('###,###,###,###,###,##0.00',vSumPesos_IntVenOrd  )+#09+
                 FormatFloat('###,###,###,###,###,##0.00',vSumPesos_AdeudoTot  )+#09+
                 FormatFloat('###,###,###,###,###,##0.00',vSumPesos_ImpContinge)+#09+
                 FormatFloat('###,###,###,###,###,##0.00',vSumPesos_ImporteDisp)+#09+
                 FormatFloat('###,###,###,###,###,##0.00',vSumPesos_RiesgoAcum )+#09
            );
  End;
   If qyConsAdeudo.Eof Then Begin
      If Trim(sArchivo)<>'' Then Begin
         sArchivo:='';
         bGenArch:= True;
         CloseFile(F);
      End;
   End;
end;

procedure TQrConAdeTot.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
 vSumPesos_ImpAut     :=0;
 vSumPesos_CapVigVig  :=0;
 vSumPesos_CapVigImp  :=0;
 vSumPesos_CapVenExi  :=0;
 vSumPesos_CapVenNoExi:=0;
 vSumPesos_IntVigDev  :=0;
 vSumPesos_IntVigImp  :=0;
 vSumPesos_IntVenExi  :=0;
 vSumPesos_IntVenOrd  :=0;
 vSumPesos_AdeudoTot  :=0;
 vSumPesos_ImporteDisp:=0;
 vSumPesos_RiesgoAcum :=0;
 vSumPesos_ImpContinge:=0;
end;

procedure TQrConAdeTot.QRGMonedaBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
 tc:=ObtTipoCambio( vlFecha,qyConsAdeudo.FieldByName('CVE_MONEDA').AsString,APli.DataBaseName,APli.SessionName);
 QRLTipoCambio.caption:=FormatFloat('###,##0.0000',tc);
end;

Function TQrConAdeTot.SQLFechaInicio(fecha:TdateTime):String ;
const k = char(39);
var a,m,d:word;
begin
 DecodeDate(fecha,a,m,d);
 Result :='TO_DATE ('+k+'01/'+IntToStr(m)+'/'+IntToStr(a)+k+','+k+'DD/MM/YYYY'+k+')';
end;


End.
