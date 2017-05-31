Unit IntQrConsAdeudo;

Interface                            

Uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, IntGenCre,UnSQL2, QRExport;
Type
  TQrConsAdeudo = Class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    qyConsAdeudo: TQuery;
    QRSHPTCredito: TQRShape;
    QRLabel9: TQRLabel;
    QRSHPTCliente: TQRShape;
    QRLabel17: TQRLabel;
    QRSHPTMonto: TQRShape;
    QRLabel18: TQRLabel;
    QRSHPTF_Inicio: TQRShape;
    QRSHPTPlazo: TQRShape;
    QRLabel24: TQRLabel;
    QRBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText10: TQRDBText;
    QRSHPTChequera: TQRShape;
    QRLabel13: TQRLabel;
    QRDBText12: TQRDBText;
    QRFooterAcreditado: TQRBand;
    QRLabel23: TQRLabel;
    QRSHPTProveedor: TQRShape;
    QRLabel33: TQRLabel;
    QRDBText24: TQRDBText;
    QRBand2: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    qrgrpFooterMoneda: TQRBand;
    QRLabel28: TQRLabel;
    qrgrpFooterGpoEconomico: TQRBand;
    QRLabel36: TQRLabel;
    QRGroupContador: TQRGroup;
    QRGroupMoneda: TQRGroup;
    QRGroupTipoOper: TQRGroup;
    QROrigen: TQRGroup;
    QRLabel39: TQRLabel;
    QRSHPOrigen: TQRShape;
    SummaryBand1: TQRBand;
    QRSHPSector: TQRShape;
    QRLabel52: TQRLabel;
    QRDBText38: TQRDBText;
    QRSHPMoneda: TQRShape;
    QRLabel46: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText7: TQRDBText;
    QRShape2: TQRShape;
    QRLabel44: TQRLabel;
    QRDBText30: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText8: TQRDBText;
    QRShape3: TQRShape;
    QRLabel4: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr16: TQRExpr;
    QRExpr18: TQRExpr;
    QRExpr19: TQRExpr;
    QRExpr20: TQRExpr;
    QRExpr21: TQRExpr;
    QRExpr22: TQRExpr;
    QRExpr23: TQRExpr;
    QRExpr24: TQRExpr;
    QRExpr27: TQRExpr;
    QRExpr28: TQRExpr;
    QRExpr29: TQRExpr;
    QRExpr30: TQRExpr;
    QRExpr32: TQRExpr;
    QRExpr33: TQRExpr;
    QRExpr34: TQRExpr;
    QRExpr35: TQRExpr;
    QRExpr36: TQRExpr;
    QRExpr37: TQRExpr;
    QRExpr38: TQRExpr;
    QRShape4: TQRShape;
    QRLabel3: TQRLabel;
    QRShape5: TQRShape;
    QRLabel5: TQRLabel;
    QRShape6: TQRShape;
    QRLabel6: TQRLabel;
    QRShape7: TQRShape;
    QRLabel7: TQRLabel;
    QRShape8: TQRShape;
    QRLabel8: TQRLabel;
    QRShape9: TQRShape;
    QRLabel10: TQRLabel;
    QRShape1: TQRShape;
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
    QRShape20: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRShape24: TQRShape;
    QRLabel29: TQRLabel;
    QRShape21: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRLabel32: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRShape27: TQRShape;
    QRLabel34: TQRLabel;
    QRDBText6: TQRDBText;
    QRShape28: TQRShape;
    QRLabel35: TQRLabel;
    QRDBText33: TQRDBText;
    QRExpr17: TQRExpr;
    QRExpr31: TQRExpr;
    QRLabel37: TQRLabel;
    Tot_CP_Vig: TQRLabel;
    Tot_CP_Imp: TQRLabel;
    Tot_CP_Exi: TQRLabel;
    Tot_CP_NEx: TQRLabel;
    Tot_IN_Vig: TQRLabel;
    Tot_IN_Imp: TQRLabel;
    Tot_IN_Exig: TQRLabel;
    Tot_IN_CtaOrd: TQRLabel;
    Tot_Moras: TQRLabel;
    Tot_Otros: TQRLabel;
    Total_adeudo: TQRLabel;
    Tot_Sdo_Fdeo: TQRLabel;
    lbDolares: TQRLabel;
    lbUDIS: TQRLabel;
    qrlUDIS_TC: TQRLabel;
    qrlDOLAR_TC: TQRLabel;
    qyConsAdeudoEMPRESA: TFloatField;
    qyConsAdeudoPRODUCTO_GPO: TStringField;
    qyConsAdeudoCONTRATO: TFloatField;
    qyConsAdeudoCREDITO: TFloatField;
    qyConsAdeudoPRODUCTO: TStringField;
    qyConsAdeudoDESC_PROD: TStringField;
    qyConsAdeudoCTA_ORIGEN: TStringField;
    qyConsAdeudoF_AUTORIZA: TDateTimeField;
    qyConsAdeudoF_VENCIMIENTO: TDateTimeField;
    qyConsAdeudoCVE_TASA: TStringField;
    qyConsAdeudoOPERADOR_STASA: TStringField;
    qyConsAdeudoSOBRETASA: TFloatField;
    qyConsAdeudoIMP_AUTORIZADO: TFloatField;
    qyConsAdeudoSDO_VIG_TOTAL: TFloatField;
    qyConsAdeudoCVE_FND_ENT_DES: TStringField;
    qyConsAdeudoPCT_REDESCONTADO: TFloatField;
    qyConsAdeudoOPE_STASA_FND: TStringField;
    qyConsAdeudoSOBRETASA_FND: TFloatField;
    qyConsAdeudoCAT_MINIMO: TStringField;
    qyConsAdeudoDESC_CAT_MINIMO: TStringField;
    qyConsAdeudoCVE_MONEDA: TFloatField;
    qyConsAdeudoDESC_MONEDA: TStringField;
    qyConsAdeudoCVE_GRUPO: TStringField;
    qyConsAdeudoDESC_GPO: TStringField;
    qyConsAdeudoTITULAR: TFloatField;
    qyConsAdeudoNOMBRE: TStringField;
    qyConsAdeudoSUB_TIP_BCO: TFloatField;
    qyConsAdeudoTIPO_DISP: TStringField;
    qyConsAdeudoTIPO_CTA: TFloatField;
    qyConsAdeudoID_PROM_ASOC: TFloatField;
    qyConsAdeudoPROM_ASOC: TStringField;
    qyConsAdeudoID_PROM_ADM: TFloatField;
    qyConsAdeudoPROM_ADM: TStringField;
    qyConsAdeudoCVE_MERC_OBJ: TStringField;
    qyConsAdeudoMERCADO_OBJ: TStringField;
    qyConsAdeudoVIGENTE_CP: TFloatField;
    qyConsAdeudoNOEXIGIBLE_CP: TFloatField;
    qyConsAdeudoIMPAGADO_CP: TFloatField;
    qyConsAdeudoEXIGIBLE_CP: TFloatField;
    qyConsAdeudoSDO_INSOLUTO: TFloatField;
    qyConsAdeudoVIGENTE_IN: TFloatField;
    qyConsAdeudoIMPAGADO_IN: TFloatField;
    qyConsAdeudoEXIGIBLE_IN: TFloatField;
    qyConsAdeudoCTA_ORD_IN: TFloatField;
    qyConsAdeudoMORATORIOS: TFloatField;
    qyConsAdeudoIMP_OTROS: TFloatField;
    qyConsAdeudoTOT_ADEUDO: TFloatField;
    qyConsAdeudoTASA_TOTAL: TFloatField;
    qyConsAdeudoVALOR_TASA: TFloatField;
    qyConsAdeudoTASA_FND_TOT: TFloatField;
    qrlValorTasaRefer: TQRLabel;
    qyConsAdeudoROE_BRUTA: TFloatField;
    qyConsAdeudoROE_NETA: TFloatField;
    qyConsAdeudoPCT_REQ_CAP_MER: TFloatField;
    qyConsAdeudoPCT_REQ_CAP_CRE: TFloatField;
    qyConsAdeudoPCT_CAPITALIZ: TFloatField;
    qyConsAdeudoIMP_INGRESOS_ACR: TFloatField;
    qyConsAdeudoNO_CONSUL_BURO: TFloatField;
    qyConsAdeudoF_AUT_COMITE: TDateTimeField;
    qyConsAdeudoF_VENTO_AUTO: TDateTimeField;
    qyConsAdeudoNUM_EMPLEADOS: TFloatField;
    qyConsAdeudoCVE_SENICREB: TStringField;
    qyConsAdeudoDESC_SENICREB: TStringField;
    qyConsAdeudoCVE_LOCAL_CNBV: TStringField;
    qyConsAdeudoDESC_LOCAL_CNBV: TStringField;
    QRLabel38: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    qyConsAdeudoCVE_ANALISTA_RES: TStringField;
    QRLabel43: TQRLabel;
    QRDBText19: TQRDBText;
    qyConsAdeudoCVE_FND_PROGRAMA: TStringField;
    qyConsAdeudoSTATUS: TStringField;
    QRDBText34: TQRDBText;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFooterAcreditadoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrgrpFooterMonedaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrgrpFooterGpoEconomicoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure SummaryBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);

  Private
  Public
    vgFechaMesAnt  : TDate;
    vgTCambioMesAnt: Double;
    vgTCambioUDIS  : Double;

    Function FormaQuery(sMoneda, sGpoEconomico, sAcreditado, sContrato, sProducto,
                        sDisp, sCtaOrigen,sEmpresa,sGpoProd,sTipRecu: String;
                        dFecha: TDateTime ): String;
  end;
Var
  QrConsAdeudo: TQrConsAdeudo;
  Apli        : TInterApli;
  sArchivo    : String;
  bGenArch    : Boolean;
  F           : TextFile;

  VLImpAutAc  : Double;
  VLImpAutGE  : Double;
  VLImpAutMo  : Double;
  VLImpAunTG  : Double;

  VLContrato  : Double;

  bFHabil     : Boolean;
  dFIniFinSem : TDateTime;


  vgTot_CP_Vig,  vgTot_CP_Imp, vgTot_CP_Vdo,   vgTot_CP_NEx,
  vgTot_IN_Vig,  vgTot_IN_Imp, vgTot_IN_Vdo,   vgTot_IN_Nex,
  vgTot_Moras,   vgTot_Otros,  vgTotal_adeudo, vgTot_Sdo_Fdeo : Double;

Procedure RepConsolidAdeudo(sMoneda, sGpoEconomico, sAcreditado, sContrato, sProducto,
                            sDisp, sCtaOrigen,sEmpresa, sGpoProd, sNbrArch, sTipRecu: String;
                            dFecha: TDateTime;
                            pAPli     : TInterApli;
                            pPreview  : Boolean);
Implementation
{$R *.DFM}

Procedure RepConsolidAdeudo( sMoneda, sGpoEconomico, sAcreditado, sContrato, sProducto,
                            sDisp, sCtaOrigen,sEmpresa, sGpoProd, sNbrArch,sTipRecu: String;
                            dFecha: TDateTime;
                            pAPli     : TInterApli;
                            pPreview  : Boolean);
Var
   QrConsAdeudo: TQrConsAdeudo;
   Preview     : TIntQRPreview;
   function TipoCambio(pMoneda: String; pFecha: TDateTime) : Double;
   var vlsql, vlTipoCambio : String;
   Begin
         vlsql := ' SELECT ' +
                  ' NVL( PKGCORPO.OBTTIPOCAMBIO ( pkgrptregcr.funobtfliq(''FMAC'',''D002'','+SQLFecha(pFecha)+'), ' +
                                                      pMoneda    + ' , ' + SQLStr( CVERDAD ) + ' ), 1 ) TIPO_CAMBIO' +
                  ' FROM   DUAL ' ;

         GetSQLStr(vlsql,Apli.DataBaseName,Apli.SessionName,'TIPO_CAMBIO', vlTipoCambio, False);
         if vlTipoCambio = CNULL then
            vlTipoCambio := '1';
         //end if
         Result := StrToFloat(vlTipoCambio);
   end;

Begin
   QrConsAdeudo:=TQrConsAdeudo.Create(Nil);
   Preview := TIntQRPreview.CreatePreview(Application, QrConsAdeudo);
   Try
      bGenArch:= False;
      sArchivo:= sNbrArch;
      bFHabil := False;
      Apli := pApli;
      QrConsAdeudo.QRInterEncabezado1.Apli:=pApli;
      QrConsAdeudo.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
      QrConsAdeudo.QRInterEncabezado1.NomReporte:='IntMQrConsAdeudo';
//      QrConsAdeudo.QRInterEncabezado1.Titulo1:='Reporte Contable Consolidado de Adeudos';   //RABA AGO 2015 B-6
      QrConsAdeudo.QRInterEncabezado1.Titulo1:='Reporte Consolidado de Adeudos';
      QrConsAdeudo.QRInterEncabezado1.Titulo2:=' Al ' + DateToStr(dFecha);

      //verifica si la fecha indicada es un día inhabil o no
      bFHabil := False;
      dFIniFinSem := dFecha;
      if ValidaFecha (dFecha, pApli) = 1 then Begin
         bFHabil := True;
         dFIniFinSem := ObtFIniFinSemana(dFecha, pApli);
      end;
      //
      //
      QrConsAdeudo.vgFechaMesAnt := ObtFechaMesAnt( C_FMAN, pApli );
      QrConsAdeudo.vgTCambioMesAnt := TipoCambio(IntToStr ( C_DLLS ) , dFecha);
{      ObtTipoCambio( QrConsAdeudo.vgFechaMesAnt,
                                                   IntToStr ( C_DLLS ) ,
                                                   pAPli.DataBaseName, pAPli.SessionName);
                                                   }

      QrConsAdeudo.vgTCambioUDIS := ObtTipoCambio( pAPli.DameFechaEmpresaDia('D000'),
                                                   IntToStr ( 800 ) ,
                                                   pAPli.DataBaseName, pAPli.SessionName);

      QrConsAdeudo.qrlDOLAR_TC.Caption := FormatFloat('###,##0.0000',QrConsAdeudo.vgTCambioMesAnt);
      QrConsAdeudo.qrlUDIS_TC.Caption  := FormatFloat('###,##0.0000',QrConsAdeudo.vgTCambioUDIS);

      QrConsAdeudo.qyConsAdeudo.DatabaseName := pApli.DataBaseName;
      QrConsAdeudo.qyConsAdeudo.SessionName := pApli.SessionName;

      QrConsAdeudo.qyConsAdeudo.Active:=False;
      QrConsAdeudo.qyConsAdeudo.SQL.Text:= QrConsAdeudo.FormaQuery(sMoneda, sGpoEconomico, sAcreditado, sContrato,
                                                                   sProducto, sDisp, sCtaOrigen, sEmpresa,sGpoProd, sTipRecu, dFecha);
      QrConsAdeudo.qyConsAdeudo.SQL.SaveToFile('c:\CONS_NEW.txt');
      QrConsAdeudo.qyConsAdeudo.Active:=True;

      If Trim(sArchivo)<>'' Then Begin
         AssignFile(F, sArchivo);
         Rewrite(F);
         Writeln(F, QrConsAdeudo.QRInterEncabezado1.Titulo1 + #09 );
         Writeln(F, QrConsAdeudo.QRInterEncabezado1.Titulo2+ #09 );
         Writeln(F,  #09 );
         Writeln(F, #09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09 + 'CAPITAL'+ #09#09#09#09 +'INTERES'+ #09);
         Writeln(F,
             'Mon'+ #09 +
             'Moneda'+ #09 +
             'Cve. Gpo. Eco.'+ #09 +
             'Grupo Económico'+ #09 +
             'Prom. Asoc.'+ #09 +
             'Nombre Prom. Asoc.'+ #09 +
             'Prom. Admon.'+ #09 +
             'Nombre Prom. Admon.'+ #09 +
             'Num. Acreditado'+ #09 +
             'Acreditado'+ #09 +
             'Autorización'+ #09 +
             'Disposición'+ #09 +
             'Tipo de Producto '+ #09+'Descripción de Producto ' +#09 +
             'Cuenta Origen '+#09 +
             'Fecha Apertura ' +#09 +
             'Fecha Vencimiento ' + #09 +
             'Código Tasa Base' + #09 +'Valor Tasa ' + #09+'Operador Matemático '+#09+ 'Sobretasa ' +#09 +'Tasa Total ' + #09+
             'Importe Autorización' +#09 +
             'Vigente'+ #09 +
             'Impagado' +  #09+
             'Exigible' +  #09 +
             'No exigible' +  #09 +
             'Vigente'+ #09 +
             'Impagado' +  #09+
             'Exigible' +  #09 +
             'Ctas Ord' +  #09 +
             'Moras' +  #09 +
             'Otros' +  #09 +
             'Total' +  #09 +
             'Entidad Descontadora' +  #09 +
             'Programa' +  #09 +  //HERJA 23.12.2010
             'Saldo de Fondeo' +  #09 +
             'Porcentaje de Fondeo' +  #09 +
             'Tasa Pasiva' +  #09 +
             'Cve. Cat. Minimo' +  #09 +
             'Descripción Catálogo Mínimo'+  #09 +
             'Cve. Merc. Objetivo'+  #09 +
//             'Descripción Merc. Objetivo');

{ROIM JULIO 2009 SE AGREGAN CAMPOS}
           'Descripción Merc. Objetivo'+  #09 +
           'ROE Bruta'+  #09 +
           'ROE Neta'+  #09 +
           'Porcentaje de Req de Mercado'+  #09 +
           'Porcentaje de Req de Credito'+  #09 +
           'Procentaje Capitalizacion'+  #09 +
           'Ingresos Acreditado'+  #09 +
           'No Consulta Buro'+  #09 +
           'Fecha Autoriza Comite'+  #09 +
           'Fecha Vento Contrato'+  #09 +
           'Numero de Empleados'+  #09 +
           'Clave Actividad Economica'+  #09 +            
           'Descripción Actividad Economica'

{ROIM MARZO 2010 SE AGREGAN CAMPOS}
           + #09+
           'Clave Localidad CNBV'  + #09 +
           'Localidad CNBV'
{//ROIM}
{RIRA Sep10 se agrega la clave del analista}
             + #09 + 'Analista Asignado'
{//RIRA}
             + #09 + 'Situacion del Acreditado'

           );

{//ROIM}

      End;

      vgTot_CP_Vig   := 0;
      vgTot_CP_Imp   := 0;
      vgTot_CP_Vdo   := 0;
      vgTot_CP_NEx   := 0;
      vgTot_IN_Vig   := 0;
      vgTot_IN_Imp   := 0;
      vgTot_IN_Vdo   := 0;
      vgTot_IN_Nex   := 0;
      vgTot_Moras    := 0;
      vgTot_Otros    := 0;
      vgTotal_adeudo := 0;
      vgTot_Sdo_Fdeo := 0;

      VLImpAutAc := 0;
      VLImpAutGE := 0;
      VLImpAutMo := 0;
      VLImpAunTG := 0;
      VLContrato := 0;

      If pPreview Then
         QrConsAdeudo.Preview
      Else
         QrConsAdeudo.Print;
   Finally
      If Trim(sArchivo)<>'' Then Begin
         bGenArch:= True;
         CloseFile(F);
      End;
      QrConsAdeudo.free;
      If Assigned(Preview) Then Preview.Free;
   End;
End;

Function TQrConsAdeudo.FormaQuery(sMoneda, sGpoEconomico, sAcreditado, sContrato, sProducto,
                                  sDisp, sCtaOrigen,sEmpresa,sGpoProd,sTipRecu: String;
                                  dFecha: TDateTime ): String;
Var
    sSQL: String;
    sStatus     : String;
Begin
    sStatus:='En Recuperación';
   sSQL := ' SELECT * ' + coCRLF +
           ' FROM ( ' + coCRLF +
  //INTERCREDITOS - INTERCREDITOS - INTERCREDITOS - INTERCREDITOS - INTERCREDITOS - INTERCREDITOS - INTERCREDITOS
           '        SELECT CTO.ID_EMPRESA                    AS EMPRESA, ' + coCRLF +
           '               CRP.CVE_GPO_INGRESO               AS PRODUCTO_GPO, ' + coCRLF +
           '               CCTO.ID_CONTRATO                  AS CONTRATO, ' + coCRLF +
           '               CRE.ID_CREDITO                    AS CREDITO, ' + coCRLF +
           '               SUBSTR(CSB.CVE_SUB_TIP_BCO,1,6)   AS PRODUCTO, ' + coCRLF +
           '               SUBSTR(CSB.DESC_SUB_TIPO,1,80)    AS DESC_PROD, ' + coCRLF +
           '               DECODE(CRE.TIPO_DISPOSICION, ''RN'', CTA_RENOVACION, CTC.TIPO_CUENTA||''-''||SUBSTR(CSC.CTA_CONTABLE,1,4)||''-''|| ' + coCRLF +
           '               SUBSTR(CSC.CTA_CONTABLE,5,7))     AS CTA_ORIGEN, ' + coCRLF +
           '               CRE.F_AUT_OPERACION               AS F_AUTORIZA, ' + coCRLF +
           '               CRE.F_VALOR_CRED + CRE.DIAS_PLAZO AS F_VENCIMIENTO, ' + coCRLF +
           '               CRE.CVE_TASA_REFER                AS CVE_TASA, ' + coCRLF +
           '               CRE.OPERADOR_STASA                AS OPERADOR_STASA, ' + coCRLF +
           '               CRE.SOBRETASA                     AS SOBRETASA, ' + coCRLF +
           '               CCTO.IMP_AUTORIZADO               AS IMP_AUTORIZADO, ' + coCRLF +
           '               CRE.SDO_INSOLUTO                  AS SDO_VIG_TOTAL, ' + coCRLF +
           '               '' ''                             AS CVE_FND_ENT_DES, ' + coCRLF +
           '               '' ''                             AS CVE_FND_PROGRAMA,' + coCRLF + //HERJA 23.12.2010
           '               0                                 AS PCT_REDESCONTADO, ' + coCRLF +
           '               '' ''                             AS OPE_STASA_FND, ' + coCRLF +
           '               0                                 AS SOBRETASA_FND, ' + coCRLF +
           '               CCM.CVE_CAT_MIN                   AS CAT_MINIMO, ' + coCRLF +
           '               CCM.DESC_CAT_MIN                  AS DESC_CAT_MINIMO, ' + coCRLF +
           '               CTO.CVE_MONEDA                    AS CVE_MONEDA, ' + coCRLF +
           '               MON.DESC_MONEDA                   AS DESC_MONEDA, ' + coCRLF +
           '               NVL(CAC.CVE_GRUPO,''---'')        AS CVE_GRUPO, ' + coCRLF +   //HERJA
           '               NVL(CGE.DESC_GRUPO,''SIN GRUPO ECONOMICO'') AS DESC_GPO, ' + coCRLF +  //HERJA
           '               CTO.ID_TITULAR                    AS TITULAR, ' + coCRLF +
           '               SUBSTR(PKGCRCONSOLIDADO.FUN_NOM_TIT_CRED(CTO.ID_TITULAR),1,80) AS NOMBRE, ' + coCRLF +
//           '               TIT.NOMBRE                        AS NOMBRE, ' + coCRLF +
           '               CSB.CVE_SUB_TIP_BCO               AS SUB_TIP_BCO, ' + coCRLF +
           '               CRE.TIPO_DISPOSICION              AS TIPO_DISP, ' + coCRLF +
           '               CTC.TIPO_CUENTA                   AS TIPO_CTA, ' + coCRLF +
           '               CTO.ID_PERS_ASOCIAD               AS ID_PROM_ASOC, ' + coCRLF +
           '               ASO.NOMBRE                        AS PROM_ASOC, ' + coCRLF +
           '               CRE.ID_PROM_ADM                   AS ID_PROM_ADM, ' + coCRLF +
           '               ADM.NOMBRE                        AS PROM_ADM, ' + coCRLF +
           '               CRP.CVE_PRESUPUESTO               AS CVE_MERC_OBJ, ' + coCRLF +
           '               CRP.DESC_PRESUPUESTO              AS MERCADO_OBJ, ' + coCRLF +
           '               CAS.IMP_CAP_VIG                   AS VIGENTE_CP, ' + coCRLF +
           '               CAS.IMP_CAP_VDO_NE                AS NOEXIGIBLE_CP, ' + coCRLF +
           '               CAS.IMP_CAP_IMP                   AS IMPAGADO_CP, ' + coCRLF +
           '               CAS.IMP_CAP_VDO_EX                AS EXIGIBLE_CP, ' + coCRLF +
           '               ( CAS.IMP_CAP_VIG + CAS.IMP_CAP_VDO_NE + CAS.IMP_CAP_IMP + CAS.IMP_CAP_VDO_EX ) AS SDO_INSOLUTO, ' + coCRLF +
           '               CAS.IMP_INT_VIG                   AS VIGENTE_IN, ' + coCRLF +
           '               CAS.IMP_INT_IMP                   AS IMPAGADO_IN, ' + coCRLF +
           '               CAS.IMP_INT_VDO_EX                AS EXIGIBLE_IN, ' + coCRLF +
           '               CAS.IMP_CTAS_ORD                  AS CTA_ORD_IN, ' + coCRLF +
           '               0                                 AS MORATORIOS, ' + coCRLF +
           '               0                                 AS IMP_OTROS, ' + coCRLF +
           '               ( CAS.IMP_CAP_VIG + CAS.IMP_CAP_VDO_NE + CAS.IMP_CAP_IMP + CAS.IMP_CAP_VDO_EX + ' + coCRLF +
           '                 CAS.IMP_INT_VIG + CAS.IMP_INT_IMP + CAS.IMP_INT_VDO_EX + CAS.IMP_CTAS_ORD  ) AS TOT_ADEUDO, ' + coCRLF +
           '               (SELECT TASA_APLICADA FROM CRE_INTERES WHERE ID_CREDITO = CAS.ID_CREDITO AND NUM_PERIODO = ( SELECT MAX(NUM_PERIODO) FROM CRE_INTERES WHERE ID_CREDITO =  ' + coCRLF +
           '                CAS.ID_CREDITO AND SIT_INTERES IN (''AC'', ''IM'') ) ) AS TASA_TOTAL, ' + coCRLF +
           '               0                                 AS VALOR_TASA, ' + coCRLF +
           '               0                                 AS TASA_FND_TOT ' + coCRLF +

{ROIM JULIO 2009 SE AGREGAN CAMPOS}
           '              ,CCTO.ROE_BRUTA, ' + coCRLF +
           '               CCTO.ROE_NETA, ' + coCRLF +
           '               CCTO.PCT_REQ_CAP_MER, ' + coCRLF +
           '               CCTO.PCT_REQ_CAP_CRE, ' + coCRLF +
           '               CCTO.PCT_CAPITALIZ, ' + coCRLF +
           '               CCTO.IMP_INGRESOS_ACR, ' + coCRLF +
           '               CCTO.NO_CONSUL_BURO, ' + coCRLF +
           '               CCTO.F_AUT_COMITE, ' + coCRLF +
           '              (TRUNC(CCTO.F_AUT_COMITE) + CCTO.DIAS_PLAZO) AS F_VENTO_AUTO, ' + coCRLF +
           '               CAC.NUM_EMPLEADOS, ' + coCRLF +
           '               CAC.CVE_SENICREB, ' + coCRLF +
           '               CSEN.DESC_SENICREB, ' + coCRLF +

{ROIM MARZO 2010 SE AGREGAN CAMPOS}
           '               CLC.CVE_LOCAL_CNBV, ' + coCRLF +
           '               CLC.DESC_LOCAL_CNBV ' + coCRLF +
{//ROIM}
{RIRA4281 AGO 2010 SE AGREGA CAMPO}
           '               ,NULL AS CVE_ANALISTA_RES ' + coCRLF +
           '               ,''  '' AS STATUS ' + coCRLF +
{//RIRA4281}

{//ROIM}
           '        FROM CR_CON_ADEUDO_SDO   CAS, ' + coCRLF +
           '             CRE_CREDITO         CRE, ' + coCRLF +
           '             CONTRATO            CTO, ' + coCRLF +
           '             CRE_CLIENTE         CAC, ' + coCRLF +
           '             MONEDA              MON, ' + coCRLF +
           '             CRE_GRUPO_EMPR      CGE, ' + coCRLF +
           '             CRE_TIPO_CREDITO    CTC, ' + coCRLF +
           '             CRE_CAT_MINIMO      CCM, ' + coCRLF +
// RABA JUL 2015 B-6
// SE CAMBIA LA TABLA CRE_CONTRATO POR UNA CONSULTA HISTÓRICA
//           '             CRE_CONTRATO        CCTO,' + coCRLF +
           '             Table (PKGCRBitacoraViews.VW_CRE_Contrato_CveSubTipoBco ('+SQLFecha(dFecha)+')) CCTO, '+coCRLF+
// FIN RABA JUL 2015 B-6
           '             CRE_SUB_TIP_BCO     CSB, ' + coCRLF +
           '             CRE_SUB_TIP_CNBV    CSC, ' + coCRLF +
           '             CRE_GPO_INGRESO     CPG, ' + coCRLF +
           '             CRE_PRESUPUESTO     CRP, ' + coCRLF +
           '             PERSONA             ASO, ' + coCRLF +

{ROIM JULIO 2009 SE AGREGAN CAMPOS}
           '             CRE_SENICREB        CSEN, ' + coCRLF +
{//ROIM}

{ROIM MARZO 2010 SE AGREGAN CAMPOS}
           '             CRE_LOCAL_CNBV      CLC, ' + coCRLF +
{//ROIM}
{
           '             ( SELECT *  FROM ( SELECT P.ID_PERSONA,P.CVE_PER_JURIDICA, PM.NOM_RAZON_SOCIAL NOMBRE, P.CVE_TIPO_SECTOR FROM (SELECT ID_PERSONA, NOM_RAZON_SOCIAL FROM PERSONA_MORAL) PM, '+
           '                                          PERSONA P WHERE P.ID_PERSONA = PM.ID_PERSONA'+coCRLF +
           '                           UNION ALL SELECT P.ID_PERSONA,P.CVE_PER_JURIDICA, PF.NOMBRE, P.CVE_TIPO_SECTOR FROM (SELECT ID_PERSONA, ( APELLIDO_PATERNO||'' ''||APELLIDO_MATERNO||'' ''||NOMBRE_PERSONA ) NOMBRE '+coCRLF+
           '                                     FROM PERSONA_FISICA)PF, PERSONA P WHERE P.ID_PERSONA = PF.ID_PERSONA )'+coCRLF+
           '             ) TIT,'+ coCRLF +
}
           '             PERSONA             ADM ' + coCRLF +
           '       WHERE CTO.ID_EMPRESA = ' + sEmpresa + coCRLF +
           '          AND CAS.F_CIERRE  = ' + SQLFecha(dFecha) + coCRLF;
//           If (Trim(sCtaOrigen)<>'')    Then sSQL := sSQL + '          AND CTC.TIPO_CUENTA = '+ sCtaOrigen + coCRLF;

   sSQL := sSQL +
           '         AND ( ( CSB.F_TRASPASO_ICRE IS NOT NULL AND CRE.SIT_CREDITO NOT IN ( ''TA'' ) ) ' + coCRLF +
           '              OR CSB.F_TRASPASO_ICRE IS NULL ) ' + coCRLF +
           '         AND CRE.ID_CREDITO       = CAS.ID_CREDITO ' + coCRLF +
           '         AND CCTO.ID_CONTRATO     = CRE.ID_CONTRATO ' + coCRLF +
           '         AND CSB.CVE_SUB_TIP_BCO  = CCTO.CVE_SUB_TIP_BCO_old ' + coCRLF +    //RABA JUL 2015 B-6
           '         AND CCM.CVE_CAT_MIN      = CCTO.CVE_CAT_MIN ' + coCRLF +        //RABA JUL 2015 B-6
           '         AND MON.CVE_MONEDA       = CTO.CVE_MONEDA ' + coCRLF +
           '         AND CTO.ID_CONTRATO      = CCTO.ID_CONTRATO ' + coCRLF +
           '         AND CAC.ID_PERSONA       = CTO.ID_TITULAR ' + coCRLF +
           '         AND CGE.CVE_GRUPO (+)    = CAC.CVE_GRUPO ' + coCRLF + //HERJA
           '         AND CSB.CVE_SUB_TIP_CNBV = CSC.CVE_SUB_TIP_CNBV ' + coCRLF +
           '         AND CTC.CVE_TIPO_CREDITO = CSC.CVE_TIPO_CREDITO ' + coCRLF +
           '         AND CPG.CVE_GPO_INGRESO  = CRP.CVE_GPO_INGRESO ' + coCRLF +
           '         AND CRP.CVE_PRESUPUESTO  = CRE.CVE_PRESUPUESTO ' + coCRLF +
           '         AND CTO.ID_PERS_ASOCIAD  = ASO.ID_PERSONA(+) ' + coCRLF +
           '         AND CRE.ID_PROM_ADM      = ADM.ID_PERSONA(+) ' + coCRLF +


{ROIM JULIO 2009 SE AGREGAN CAMPOS}
           '         AND CSEN.CVE_SENICREB   (+)= CAC.CVE_SENICREB ' + coCRLF +
{//ROIM}

{ROIM MARZO 2010 SE AGREGAN CAMPOS}
           '         AND CLC.CVE_LOCAL_CNBV   (+)= CAC.CVE_LOCAL_CNBV ' + coCRLF +
{//ROIM}

	   '  	     AND CRE.SIT_CREDITO NOT IN ( ''TA'' ) ' + coCRLF +  //HERJA 02.09.2010

//           '         AND TIT.ID_PERSONA       = CTO.ID_TITULAR ' + coCRLF + //QUITAR

           '  UNION ALL ' + coCRLF +
  //ICRE01 - ICRE01 - ICRE01 - ICRE01 - ICRE01 - ICRE01 - ICRE01 - ICRE01 - ICRE01 - ICRE01 - ICRE01 - ICRE01 - ICRE01

           '        SELECT CTO.ID_EMPRESA                    AS EMPRESA, ' + coCRLF +
           '               CPR.CVE_PRODUCTO_GPO              AS PRODUCTO_GPO, ' + coCRLF +
           '               CCTO.ID_CONTRATO                  AS CONTRATO, ' + coCRLF +
           '               CRE.ID_CREDITO                    AS CREDITO, ' + coCRLF +
           '               CCTO.CVE_PRODUCTO_old             AS PRODUCTO, ' + coCRLF +   //RABA JUL 2015 B-6
           '               CPR.DESC_L_PRODUCTO               AS DESC_PROD, ' + coCRLF +
           '               SUBSTR(PKGCRCONSOLIDADO.FUN_CR_CTASCONTAB( CTO.ID_EMPRESA, CCTO.CVE_MONEDA, CCTO.CVE_PRODUCTO_CRE, ''CI'' ),1,30) CTA_ORIGEN, ' + coCRLF +
//           '               NVL(TABCTA.CUENTA_VIGENTE_K,TABCTAICRE.CVE_CTA_CONT_CAREVI) CTA_ORIGEN, ' + coCRLF +
           '               CRE.F_AUTORIZA                    AS F_AUTORIZA, ' + coCRLF +
           '               CRE.F_VENCIMIENTO                 AS F_VENCIMIENTO, ' + coCRLF +
           '               CRE.CVE_TASA_REFER                AS CVE_TASA, ' + coCRLF +
           '               CRE.OPERADOR_STASA                AS OPERADOR_STASA, ' + coCRLF +
           '               CRE.SOBRETASA                     AS SOBRETASA, ' + coCRLF +

//           '               CCTO.IMP_AUTORIZADO               AS IMP_AUTORIZADO, ' + coCRLF +  //HERJA 23.12.2010
//INICIO HERJA 23.12.2010
           '              ( CASE '+coCRLF+
           '                    WHEN (SELECT NVL(MIN(TO_NUMBER(CVE_FND_ENT_DES||CVE_FND_PROGRAMA)),0) '+coCRLF+
           '  		                FROM CR_FND_CREDITO '+coCRLF+
	   '			       WHERE ID_CREDITO(+)=CRE.ID_CREDITO ) '+coCRLF+
	   '			     = NVL(TO_NUMBER(CVE_FND_ENT_DES||CVE_FND_PROGRAMA),0) THEN CCTO.IMP_AUTORIZADO '+coCRLF+
           '                ELSE 0 '+coCRLF+
           '                END '+coCRLF+
           '              ) IMP_AUTORIZADO, '+coCRLF+
//FIN HERJA 23.12.2010

           '               NVL(CFN.SDO_VIG_TOTAL,0)          AS SDO_VIG_TOTAL, ' + coCRLF +
           '               CFN.CVE_FND_ENT_DES, ' + coCRLF +
           '               CFN.CVE_FND_PROGRAMA, ' + coCRLF +  //HERJA 23.12.2010
           '               NVL(PCT_REDESCONTADO,0)           AS PCT_REDESCONTADO, ' + coCRLF +
           '               CFN.OPERADOR_STASA                AS OPE_STASA_FND, ' + coCRLF +
           '               CFN.SOBRETASA                     AS SOBRETASA_FND, ' + coCRLF +
           '               CCM.CVE_CAT_MINIMO                AS CAT_MINIMO, ' + coCRLF +
           '               CCM.DESC_CAT_MINIMO               AS DESC_CAT_MINIMO, ' + coCRLF +
           '               CCTO.CVE_MONEDA                   AS CVE_MONEDA, ' + coCRLF +
           '               MON.DESC_MONEDA                   AS DESC_MONEDA, ' + coCRLF +
           '               NVL(CAC.CVE_GRUPO_ECO,''---'')        AS CVE_GRUPO, ' + coCRLF + //HERJA
           '               NVL(CGE.DESC_GRUPO_ECO,''SIN GRUPO ECONOMICO'') AS DESC_GPO, ' + coCRLF + //HERJA
           '               CTO.ID_TITULAR                    AS TITULAR, ' + coCRLF +
           '               SUBSTR(PKGCRCONSOLIDADO.FUN_NOM_TIT_CRED(CTO.ID_TITULAR),1,80) NOMBRE, ' + coCRLF +
//           '               TIT.NOMBRE                        AS NOMBRE, ' + coCRLF +
           '               CPS.CVE_SUB_TIP_BCO               AS SUB_TIP_BCO, ' + coCRLF +
           '               CRE.TIPO_DISPOSICION              AS TIPO_DISP, ' + coCRLF +
           '               CPR.CVE_TIPO_CRED_BC              AS TIPO_CTA, ' + coCRLF +
           '               CTO.ID_PERS_ASOCIAD               AS ID_PROM_ASOC, ' + coCRLF +
           '               ASO.NOMBRE                        AS PROM_ASOC, ' + coCRLF +
           '               CRE.ID_PROM_ADM                   AS ID_PROM_ADM, ' + coCRLF +
           '               ADM.NOMBRE                        AS PROM_ADM, ' + coCRLF +
           '               CRP.CVE_PRESUPUESTO               AS CVE_MERC_OBJ, ' + coCRLF +
           '               CRP.DESC_PRESUPUESTO              AS MERCADO_OBJ, ' + coCRLF +

{  HERJA 23.12.2010
           '               CAS.IMP_CAP_VIG                   AS VIGENTE_CP, ' + coCRLF +
           '               CAS.IMP_CAP_VDO_NE                AS NOEXIGIBLE_CP, ' + coCRLF +
           '               CAS.IMP_CAP_IMP                   AS IMPAGADO_CP, ' + coCRLF +
           '               CAS.IMP_CAP_VDO_EX                AS EXIGIBLE_CP, ' + coCRLF +
           '               ( CAS.IMP_CAP_VIG + CAS.IMP_CAP_VDO_NE + CAS.IMP_CAP_IMP + CAS.IMP_CAP_VDO_EX ) AS SDO_INSOLUTO, ' + coCRLF +
           '               CAS.IMP_INT_VIG                   AS VIGENTE_IN, ' + coCRLF +
           '               CAS.IMP_INT_IMP                   AS IMPAGADO_IN, ' + coCRLF +
           '               CAS.IMP_INT_VDO_EX                AS EXIGIBLE_IN, ' + coCRLF +
           '               CAS.IMP_CTAS_ORD                  AS CTA_ORD_IN, ' + coCRLF +
           '               0                                 AS MORATORIOS, ' + coCRLF +
           '               0                                 AS IMP_OTROS, ' + coCRLF +
           '               ( CAS.IMP_CAP_VIG + CAS.IMP_CAP_VDO_NE + CAS.IMP_CAP_IMP + CAS.IMP_CAP_VDO_EX + ' + coCRLF +
           '                 CAS.IMP_INT_VIG + CAS.IMP_INT_IMP + CAS.IMP_INT_VDO_EX + CAS.IMP_CTAS_ORD  ) AS TOT_ADEUDO, ' + coCRLF +
FIN HERJA 23.12.2010}


//INICIO HERJA 23.12.2010
           '              ( CASE '+coCRLF+
           '                    WHEN (SELECT NVL(MIN(TO_NUMBER(CVE_FND_ENT_DES||CVE_FND_PROGRAMA)),0) '+coCRLF+
           '  		                FROM CR_FND_CREDITO '+coCRLF+
	   '			       WHERE ID_CREDITO(+)=CRE.ID_CREDITO ) '+coCRLF+
	   '			     = NVL(TO_NUMBER(CVE_FND_ENT_DES||CVE_FND_PROGRAMA),0) THEN CAS.IMP_CAP_VIG '+coCRLF+
           '                ELSE 0 '+coCRLF+
           '                END '+coCRLF+
           '               ) VIGENTE_CP, '+coCRLF+

           '              ( CASE '+coCRLF+
           '                    WHEN (SELECT NVL(MIN(TO_NUMBER(CVE_FND_ENT_DES||CVE_FND_PROGRAMA)),0) '+coCRLF+
           '  		                FROM CR_FND_CREDITO '+coCRLF+
	   '			       WHERE ID_CREDITO(+)=CRE.ID_CREDITO ) '+coCRLF+
	   '			     = NVL(TO_NUMBER(CVE_FND_ENT_DES||CVE_FND_PROGRAMA),0) THEN CAS.IMP_CAP_VDO_NE '+coCRLF+
           '                ELSE 0 '+coCRLF+
           '                END '+coCRLF+
           '               ) NOEXIGIBLE_CP, '+coCRLF+

           '              ( CASE '+coCRLF+
           '                    WHEN (SELECT NVL(MIN(TO_NUMBER(CVE_FND_ENT_DES||CVE_FND_PROGRAMA)),0) '+coCRLF+
           '  		                FROM CR_FND_CREDITO '+coCRLF+
	   '			       WHERE ID_CREDITO(+)=CRE.ID_CREDITO ) '+coCRLF+
	   '			     = NVL(TO_NUMBER(CVE_FND_ENT_DES||CVE_FND_PROGRAMA),0) THEN CAS.IMP_CAP_IMP '+coCRLF+
           '                ELSE 0 '+coCRLF+
           '                END '+coCRLF+
           '               ) IMPAGADO_CP, '+coCRLF+

           '              ( CASE '+coCRLF+
           '                    WHEN (SELECT NVL(MIN(TO_NUMBER(CVE_FND_ENT_DES||CVE_FND_PROGRAMA)),0) '+coCRLF+
           '  		                FROM CR_FND_CREDITO '+coCRLF+
	   '			       WHERE ID_CREDITO(+)=CRE.ID_CREDITO ) '+coCRLF+
	   '			     = NVL(TO_NUMBER(CVE_FND_ENT_DES||CVE_FND_PROGRAMA),0) THEN CAS.IMP_CAP_VDO_EX '+coCRLF+
           '                ELSE 0 '+coCRLF+
           '                END '+coCRLF+
           '               ) EXIGIBLE_CP, '+coCRLF+

           '              ( CASE '+coCRLF+
           '                    WHEN (SELECT NVL(MIN(TO_NUMBER(CVE_FND_ENT_DES||CVE_FND_PROGRAMA)),0) '+coCRLF+
           '  		                FROM CR_FND_CREDITO '+coCRLF+
	   '			       WHERE ID_CREDITO(+)=CRE.ID_CREDITO ) '+coCRLF+
	   '			     = NVL(TO_NUMBER(CVE_FND_ENT_DES||CVE_FND_PROGRAMA),0) THEN CAS.IMP_CAP_VIG + CAS.IMP_CAP_VDO_NE + CAS.IMP_CAP_IMP + CAS.IMP_CAP_VDO_EX '+coCRLF+
           '                ELSE 0 '+coCRLF+
           '                END '+coCRLF+
           '               ) SDO_INSOLUTO, '+coCRLF+

           '              ( CASE '+coCRLF+
           '                    WHEN (SELECT NVL(MIN(TO_NUMBER(CVE_FND_ENT_DES||CVE_FND_PROGRAMA)),0) '+coCRLF+
           '  		                FROM CR_FND_CREDITO '+coCRLF+
	   '			       WHERE ID_CREDITO(+)=CRE.ID_CREDITO ) '+coCRLF+
	   '			     = NVL(TO_NUMBER(CVE_FND_ENT_DES||CVE_FND_PROGRAMA),0) THEN CAS.IMP_INT_VIG '+coCRLF+
           '                ELSE 0 '+coCRLF+
           '                END '+coCRLF+
           '               ) VIGENTE_IN, '+coCRLF+

           '              ( CASE '+coCRLF+
           '                    WHEN (SELECT NVL(MIN(TO_NUMBER(CVE_FND_ENT_DES||CVE_FND_PROGRAMA)),0) '+coCRLF+
           '  		                FROM CR_FND_CREDITO '+coCRLF+
	   '			       WHERE ID_CREDITO(+)=CRE.ID_CREDITO ) '+coCRLF+
	   '			     = NVL(TO_NUMBER(CVE_FND_ENT_DES||CVE_FND_PROGRAMA),0) THEN CAS.IMP_INT_IMP '+coCRLF+
           '                ELSE 0 '+coCRLF+
           '                END '+coCRLF+
           '               ) IMPAGADO_IN, '+coCRLF+

           '              ( CASE '+coCRLF+
           '                    WHEN (SELECT NVL(MIN(TO_NUMBER(CVE_FND_ENT_DES||CVE_FND_PROGRAMA)),0) '+coCRLF+
           '  		                FROM CR_FND_CREDITO '+coCRLF+
	   '			       WHERE ID_CREDITO(+)=CRE.ID_CREDITO ) '+coCRLF+
	   '			     = NVL(TO_NUMBER(CVE_FND_ENT_DES||CVE_FND_PROGRAMA),0) THEN CAS.IMP_INT_VDO_EX '+coCRLF+
           '                ELSE 0 '+coCRLF+
           '                END '+coCRLF+
           '               ) EXIGIBLE_IN, '+coCRLF+

           '              ( CASE '+coCRLF+
           '                    WHEN (SELECT NVL(MIN(TO_NUMBER(CVE_FND_ENT_DES||CVE_FND_PROGRAMA)),0) '+coCRLF+
           '  		                FROM CR_FND_CREDITO '+coCRLF+
	   '			       WHERE ID_CREDITO(+)=CRE.ID_CREDITO ) '+coCRLF+
	   '			     = NVL(TO_NUMBER(CVE_FND_ENT_DES||CVE_FND_PROGRAMA),0) THEN CAS.IMP_CTAS_ORD '+coCRLF+
           '                ELSE 0 '+coCRLF+
           '                END '+coCRLF+
           '               ) CTA_ORD_IN, '+coCRLF+

           '               0                                 AS MORATORIOS, ' + coCRLF +
           '               0                                 AS IMP_OTROS, ' + coCRLF +

           '              ( CASE '+coCRLF+
           '                    WHEN (SELECT NVL(MIN(TO_NUMBER(CVE_FND_ENT_DES||CVE_FND_PROGRAMA)),0) '+coCRLF+
           '  		                FROM CR_FND_CREDITO '+coCRLF+
	   '			       WHERE ID_CREDITO(+)=CRE.ID_CREDITO ) '+coCRLF+
	   '			     = NVL(TO_NUMBER(CVE_FND_ENT_DES||CVE_FND_PROGRAMA),0) THEN CAS.IMP_CAP_VIG + CAS.IMP_CAP_VDO_NE + CAS.IMP_CAP_IMP + CAS.IMP_CAP_VDO_EX + CAS.IMP_INT_VIG + CAS.IMP_INT_IMP + CAS.IMP_INT_VDO_EX + CAS.IMP_CTAS_ORD '+coCRLF+
           '                ELSE 0 '+coCRLF+
           '                END '+coCRLF+
           '               ) TOT_ADEUDO, '+coCRLF+
//FIN HERJA 23.12.2010


           '               (SELECT TASA_APLICADA FROM CR_INTERES WHERE ID_CREDITO = CAS.ID_CREDITO AND NUM_PERIODO = ( SELECT MAX(NUM_PERIODO) FROM CR_INTERES WHERE ID_CREDITO =  ' + coCRLF +
           '                CAS.ID_CREDITO AND SIT_INTERES IN (''AC'', ''IM'') ) ) AS TASA_TOTAL, ' + coCRLF +
           '               0                                 AS VALOR_TASA, '+  coCRLF +
//           '               (SELECT TASA_APLICADA FROM CR_FND_INTERES WHERE ID_CREDITO = CAS.ID_CREDITO AND NUM_PERIODO = ( SELECT MAX(NUM_PERIODO) FROM CR_FND_INTERES WHERE ID_CREDITO =  ' + coCRLF +
           '               (SELECT MAX(TASA_APLICADA) FROM CR_FND_INTERES WHERE ID_CREDITO = CAS.ID_CREDITO AND NUM_PERIODO = ( SELECT MAX(NUM_PERIODO) FROM CR_FND_INTERES WHERE ID_CREDITO =  ' + coCRLF +
           '                CAS.ID_CREDITO AND SIT_INTERES IN (''AC'', ''IM'') ) ) AS TASA_FND_TOT ' + coCRLF +

{ROIM JULIO 2009 SE AGREGAN CAMPOS}
           '              ,CCTO.ROE_BRUTA, ' + coCRLF +
           '               CCTO.ROE_NETA, ' + coCRLF +
           '               CCTO.PCT_REQ_CAP_MER, ' + coCRLF +
           '               CCTO.PCT_REQ_CAP_CRE, ' + coCRLF +
           '               CCTO.PCT_CAPITALIZ, ' + coCRLF +
           '               CCTO.IMP_INGRESOS_ACR, ' + coCRLF +
           '               CCTO.NO_CONSUL_BURO, ' + coCRLF +
           '               CCTO.F_AUT_COMITE, ' + coCRLF +
           '               CCTO.F_VENCIMIENTO AS F_VENTO_AUTO, ' + coCRLF +
           '               CAC.NUM_EMPLEADOS, ' + coCRLF +
           '               CAC.CVE_SENICREB, ' + coCRLF +
           '               CSEN.DESC_SENICREB, ' + coCRLF +

{ROIM MARZO 2010 SE AGREGAN CAMPOS}
           '               CLC.CVE_LOCAL_CNBV, ' + coCRLF +
           '               CLC.DESC_LOCAL_CNBV ' + coCRLF +
{//ROIM}
{RIRA4281 AGO 2010 SE AGREGA CAMPO}
           '               ,CCTO.CVE_ANALISTA_RES AS CVE_ANALISTA_RES ' + coCRLF +

           '                ,(SELECT  (CASE  WHEN COUNT(ID_ACREDITADO) = 0 THEN ''  '' ' + coCRLF +
           '                     WHEN COUNT(ID_ACREDITADO) > 0 THEN ''En Recuperación'' ' + coCRLF +
           '                     ELSE ''CE'' ' + coCRLF +
           '                     END) AS Status_1  ' + coCRLF +
           '                FROM CR_ACRE_RE WHERE '+ SQLFecha(dFecha)+' >= F_ALTA_RECU ' + coCRLF +
//           '                AND ('+SQLFecha(dFecha)+' <= F_BAJA_RECU OR F_BAJA_RECU IS NULL) ' + coCRLF +
           '                AND F_BAJA_RECU IS NULL ' + coCRLF +
           '                AND ID_ACREDITADO = CTO.ID_TITULAR) AS status ' + coCRLF +
{//RIRA4281}

{//ROIM}

           '        FROM CR_CON_ADEUDO_SDO   CAS, ' + coCRLF +
           '             CR_CREDITO          CRE, ' + coCRLF +
// RABA JUL 2015 B-6
// SE CAMBIAN LAS TABLAS CR_CONTRATO Y CR_PRODUCTO POR CONSULTAS QUE OBTIENEN DATOS MODIFICADOS HISTORICOS
//           '             CR_CONTRATO         CCTO, ' + coCRLF +
//           '             CR_PRODUCTO         CPR, ' + coCRLF +
           '             Table (PKGCRBitacoraViews.VW_CR_Contrato_Prod ('+SQLFecha(dFecha)+')) CCTO, '+coCRLF+
           '             Table (PKGCRBitacoraViews.VW_CR_Producto_Cat_Min ('+SQLFecha(dFecha)+')) CPR, ' + coCRLF +
// FIN RABA JUL 2015 B-6
           '             CR_PROD_SUB_TIPO    CPS, ' + coCRLF +
           '             CR_FND_CREDITO      CFN, ' + coCRLF +
           '             CONTRATO            CTO, ' + coCRLF +
           '             CR_ACREDITADO       CAC, ' + coCRLF +
           '             MONEDA              MON, ' + coCRLF +
           '             CR_GRUPO_ECO        CGE, ' + coCRLF +
           '             CR_CAT_MINIMO       CCM, ' + coCRLF +
           '             CRE_PRESUPUESTO     CRP, ' + coCRLF +
           '             PERSONA             ASO, ' + coCRLF +

{ROIM MARZO 2010 SE AGREGAN CAMPOS}
           '             CR_LOCAL_CNBV       CLC, ' + coCRLF +
{//ROIM}

{ROIM JULIO 2009 SE AGREGAN CAMPOS}
           '             CRE_SENICREB        CSEN, ' + coCRLF +
{//ROIM}
{
           ' ( SELECT *  FROM ( SELECT P.ID_PERSONA,P.CVE_PER_JURIDICA, PM.NOM_RAZON_SOCIAL NOMBRE, P.CVE_TIPO_SECTOR'+coCRLF +
           '   FROM (SELECT ID_PERSONA, NOM_RAZON_SOCIAL FROM PERSONA_MORAL) PM, PERSONA P WHERE P.ID_PERSONA = PM.ID_PERSONA'+coCRLF +
           '       UNION ALL SELECT P.ID_PERSONA,P.CVE_PER_JURIDICA, PF.NOMBRE, P.CVE_TIPO_SECTOR'+coCRLF +
           '         FROM (SELECT ID_PERSONA, ( APELLIDO_PATERNO||'' ''||APELLIDO_MATERNO||'' ''||NOMBRE_PERSONA ) NOMBRE FROM PERSONA_FISICA)PF, PERSONA P'+coCRLF +
           '         WHERE P.ID_PERSONA = PF.ID_PERSONA) '+coCRLF +
           ' ) TIT, '+coCRLF +
}
           '             PERSONA             ADM ' + coCRLF +
//           '             PERSONA             ADM, ' + coCRLF + C_QUERY_CTAS_ICRE + C_QUERY_CTAS +
           '        WHERE CTO.ID_EMPRESA = ' + sEmpresa + coCRLF +
           '          AND CAS.F_CIERRE   = ' + SQLFecha(dFecha)+ coCRLF;

//           If (Trim(sCtaOrigen)<>'')   Then sSQL:= sSQL + '          AND CPR.CVE_TIPO_CRED_BC = ' + sCtaOrigen + coCRLF;

   sSQL := sSQL +

           '          AND CRE.ID_CREDITO         = CAS.ID_CREDITO ' + coCRLF +
           '          AND CCTO.ID_CONTRATO       = CRE.ID_CONTRATO ' + coCRLF +
           '          AND CPR.CVE_PRODUCTO_CRE   = CCTO.CVE_PRODUCTO_old ' + coCRLF +      //RABA JUL 2015 B-6
           '          AND CFN.ID_CREDITO(+)      = CRE.ID_CREDITO ' + coCRLF +
           '          AND CCM.CVE_CAT_MINIMO     = CPR.CVE_CLAS_CONTAB_old ' + coCRLF +    //RABA JUL 2015 B-6
           '          AND MON.CVE_MONEDA         = CCTO.CVE_MONEDA ' + coCRLF +
           '          AND CTO.ID_CONTRATO        = CCTO.ID_CONTRATO ' + coCRLF +
           '          AND CAC.ID_ACREDITADO      = CTO.ID_TITULAR ' + coCRLF +
           '          AND CGE.CVE_GRUPO_ECO (+)  = CAC.CVE_GRUPO_ECO ' + coCRLF + //HERJA
           '          AND CPR.CVE_PRODUCTO_CRE   = CPS.CVE_PRODUCTO_CRE ' + coCRLF +
           '          AND CRP.CVE_PRESUPUESTO    = CPR.CVE_PRESUPUESTO ' + coCRLF +
           '          AND CTO.ID_PERS_ASOCIAD    = ASO.ID_PERSONA(+) ' + coCRLF +
           '          AND CRE.ID_PROM_ADM        = ADM.ID_PERSONA(+) ' + coCRLF +
//           '          AND TIT.ID_PERSONA          = CTO.ID_TITULAR ' + coCRLF +
           '          AND CPR.CVE_PRODUCTO_CRE    = CPS.CVE_PRODUCTO_CRE ' + coCRLF +
{ROIM JULIO 2009 SE AGREGAN CAMPOS}
           '          AND CSEN.CVE_SENICREB   (+) = CAC.CVE_SENICREB ' + coCRLF +
{//ROIM}
{ROIM MARZO 2010 SE AGREGAN CAMPOS}
           '          AND CLC.CVE_LOCAL_CNBV  (+) = CAC.CVE_LOCAL_CNBV ' + coCRLF +
{//ROIM}

           {
           '          AND CPR.CVE_PRODUCTO_CRE    = TABCTA.CVE_PRODUCTO_CRE(+)  ' + coCRLF +
           '          AND TABCTAICRE.ID_EMPRESA(+)= CTO.ID_EMPRESA' + coCRLF +
           '          AND TABCTAICRE.CVE_PRODUCTO_CRE = CPR.CVE_PRODUCTO_CRE ' + coCRLF +
           '          AND TABCTAICRE.CVE_MONEDA(+)= CTO.CVE_MONEDA'+ coCRLF +
            }
           '      )DATOS ' + coCRLF +
           ' WHERE 1 = 1' + coCRLF;
           If (Trim(sDisp)<>'')        Then sSQL := sSQL + '   AND DATOS.CREDITO    = '+ sDisp + coCRLF;
           If (Trim(sMoneda)<>'')      Then sSQL := sSQL + '   AND DATOS.CVE_MONEDA = ' + sMoneda + coCRLF ;
           If (Trim(sGpoProd)<>'')     Then sSQL := sSQL + '   AND DATOS.PRODUCTO_GPO = ' + SQLStr(sGpoProd) + coCRLF ;
           If (Trim(sProducto)<>'')    Then sSQL := sSQL + '   AND DATOS.PRODUCTO   = ' + SQLStr(sProducto) + coCRLF;
           If (Trim(sContrato)<>'')    Then sSQL := sSQL + '   AND DATOS.CONTRATO   = ' + sContrato + coCRLF;
           If (Trim(sGpoEconomico)<>'')Then sSQL := sSQL + '   AND DATOS.CVE_GRUPO  = ' + SQLStr(sGpoEconomico) + coCRLF;
           If (Trim(sAcreditado)<>'')  Then sSQL := sSQL + '   AND DATOS.TITULAR    = ' + sAcreditado + coCRLF;
           If (Trim(sCtaOrigen)<>'')   Then sSQL := sSQL + '   AND DATOS.CTA_ORIGEN = '+ SQLStr(sCtaOrigen) + coCRLF;
           if (Trim(sTipRecu)='0')     Then sSQL := sSQL + '   AND DATOS.STATUS = '+ SQLStr(sStatus) + coCRLF;
           if (Trim(sTipRecu)='1')     Then sSQL := sSQL + '   AND NOT DATOS.STATUS = '+ SQLStr(sStatus) + coCRLF;

   sSQL:= sSQL +  ' ORDER BY CVE_MONEDA, CVE_GRUPO, NOMBRE, CONTRATO, CREDITO ' + coCRLF;

   Result:= sSQL;

End;

procedure TQrConsAdeudo.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var vlTipoCambio: Double;
begin
      PrintBand := True;
      qrlValorTasaRefer.Caption := '0.000';
      IF qyConsAdeudo.FieldByName('TASA_TOTAL').AsFloat > 0 THEN BEGIN
        if qyConsAdeudo.FieldByName('OPERADOR_STASA').AsString = '+' then
           qrlValorTasaRefer.Caption := FormatFloat('###0.000000', qyConsAdeudo.FieldByName('TASA_TOTAL').AsFloat - qyConsAdeudo.FieldByName('SOBRETASA').AsFloat)
        else if qyConsAdeudo.FieldByName('OPERADOR_STASA').AsString = '-' then
           qrlValorTasaRefer.Caption := FormatFloat('###0.000000', qyConsAdeudo.FieldByName('TASA_TOTAL').AsFloat + qyConsAdeudo.FieldByName('SOBRETASA').AsFloat)
        else if qyConsAdeudo.FieldByName('OPERADOR_STASA').AsString = '*' then
           qrlValorTasaRefer.Caption := FormatFloat('###0.000000', qyConsAdeudo.FieldByName('TASA_TOTAL').AsFloat / qyConsAdeudo.FieldByName('SOBRETASA').AsFloat)
        else if qyConsAdeudo.FieldByName('OPERADOR_STASA').AsString = '/' then
           qrlValorTasaRefer.Caption := FormatFloat('###0.000000', qyConsAdeudo.FieldByName('TASA_TOTAL').AsFloat * qyConsAdeudo.FieldByName('SOBRETASA').AsFloat)
        else qrlValorTasaRefer.Caption := '0.000';
      END;

      If sArchivo <>'' Then Begin
         Writeln(F,
                  qyConsAdeudo.FieldByName('CVE_MONEDA').AsString + #09 +
                  qyConsAdeudo.FieldByName('DESC_MONEDA').AsString + #09 +
                  qyConsAdeudo.FieldByName('CVE_GRUPO').AsString + #09 +
                  qyConsAdeudo.FieldByName('DESC_GPO').AsString + #09 +
                  qyConsAdeudo.FieldByName('ID_PROM_ASOC').AsString + #09 +
                  qyConsAdeudo.FieldByName('PROM_ASOC').AsString + #09 +
                  qyConsAdeudo.FieldByName('ID_PROM_ADM').AsString + #09 +
                  qyConsAdeudo.FieldByName('PROM_ADM').AsString + #09 +
                  qyConsAdeudo.FieldByName('TITULAR').AsString + #09 +
                  qyConsAdeudo.FieldByName('NOMBRE').AsString + #09 +
                  qyConsAdeudo.FieldByName('CONTRATO').AsString + #09 +
                  qyConsAdeudo.FieldByName('CREDITO').AsString + #09 +
                  qyConsAdeudo.FieldByName('PRODUCTO').AsString + #09 +
                  qyConsAdeudo.FieldByName('DESC_PROD').AsString + #09 +
                  qyConsAdeudo.FieldByName('CTA_ORIGEN').AsString + #09 +
                  FormatDateTime('dd/mm/yyyy',qyConsAdeudo.FieldByName('F_AUTORIZA').AsDateTime) + #09+
                  FormatDateTime('dd/mm/yyyy',qyConsAdeudo.FieldByName('F_VENCIMIENTO').AsDateTime) + #09+
                  qyConsAdeudo.FieldByName('CVE_TASA').AsString + #09 +
                  qrlValorTasaRefer.Caption + #09+
                  qyConsAdeudo.FieldByName('OPERADOR_STASA').AsString + #09 +
                  //qyConsAdeudo.FieldByName('SOBRETASA').String + #09 +
                  FormatFloat('###0.000',qyConsAdeudo.FieldByName('SOBRETASA').AsFloat) + #09 +
                  FormatFloat('###0.000000',qyConsAdeudo.FieldByName('TASA_TOTAL').AsFloat) + #09+
                  FormatFloat('###,###,###,###,###,##0.00',qyConsAdeudo.FieldByName('IMP_AUTORIZADO').AsFloat)+ #09+
                  FormatFloat('###,###,###,###,###,##0.00',qyConsAdeudo.FieldByName('VIGENTE_CP').AsFloat)    + #09+
                  FormatFloat('###,###,###,###,###,##0.00',qyConsAdeudo.FieldByName('IMPAGADO_CP').AsFloat)   + #09+
                  FormatFloat('###,###,###,###,###,##0.00',qyConsAdeudo.FieldByName('EXIGIBLE_CP').AsFloat)   + #09+
                  FormatFloat('###,###,###,###,###,##0.00',qyConsAdeudo.FieldByName('NOEXIGIBLE_CP').AsFloat) + #09+
                  FormatFloat('###,###,###,###,###,##0.00',qyConsAdeudo.FieldByName('VIGENTE_IN').AsFloat)    + #09+
                  FormatFloat('###,###,###,###,###,##0.00',qyConsAdeudo.FieldByName('IMPAGADO_IN').AsFloat)   + #09+
                  FormatFloat('###,###,###,###,###,##0.00',qyConsAdeudo.FieldByName('EXIGIBLE_IN').AsFloat)   + #09+
                  FormatFloat('###,###,###,###,###,##0.00',qyConsAdeudo.FieldByName('CTA_ORD_IN').AsFloat)    + #09+
                  FormatFloat('###,###,###,###,###,##0.00',qyConsAdeudo.FieldByName('MORATORIOS').AsFloat)    + #09+
                  FormatFloat('###,###,###,###,###,##0.00',qyConsAdeudo.FieldByName('IMP_OTROS').AsFloat)     + #09+
                  FormatFloat('###,###,###,###,###,##0.00',qyConsAdeudo.FieldByName('TOT_ADEUDO').AsFloat)    + #09+
                  qyConsAdeudo.FieldByName('CVE_FND_ENT_DES').AsString + #09 +
                  qyConsAdeudo.FieldByName('CVE_FND_PROGRAMA').AsString + #09 + //HERJA 23.12.2010
                  FormatFloat('###0.0000',qyConsAdeudo.FieldByName('SDO_VIG_TOTAL').AsFloat) + #09+
                  qyConsAdeudo.FieldByName('PCT_REDESCONTADO').AsString + #09 +
                  FormatFloat('###0.0000',qyConsAdeudo.FieldByName('TASA_FND_TOT').AsFloat) + #09+
                  qyConsAdeudo.FieldByName('CAT_MINIMO').AsString + #09+
                  qyConsAdeudo.FieldByName('DESC_CAT_MINIMO').AsString + #09+
                  qyConsAdeudo.FieldByName('CVE_MERC_OBJ').AsString + #09+

{ROIM JULIO 2009 SE AGREGAN CAMPOS}
                  qyConsAdeudo.FieldByName('MERCADO_OBJ').AsString+ #09+
                  FormatFloat('###0.0000',qyConsAdeudo.FieldByName('ROE_BRUTA').AsFloat) + #09+
                  FormatFloat('###0.0000',qyConsAdeudo.FieldByName('ROE_NETA').AsFloat) + #09+
                  FormatFloat('###0.0000',qyConsAdeudo.FieldByName('PCT_REQ_CAP_MER').AsFloat) + #09+
                  FormatFloat('###0.0000',qyConsAdeudo.FieldByName('PCT_REQ_CAP_CRE').AsFloat) + #09+
                  FormatFloat('###0.0000',qyConsAdeudo.FieldByName('PCT_CAPITALIZ').AsFloat) + #09+
                  FormatFloat('###,###,###,###,###,##0.00',qyConsAdeudo.FieldByName('IMP_INGRESOS_ACR').AsFloat)+ #09+
                  qyConsAdeudo.FieldByName('NO_CONSUL_BURO').AsString + #09+
                  qyConsAdeudo.FieldByName('F_AUT_COMITE').AsString + #09+
                  qyConsAdeudo.FieldByName('F_VENTO_AUTO').AsString + #09+
                  qyConsAdeudo.FieldByName('NUM_EMPLEADOS').AsString + #09+
                  qyConsAdeudo.FieldByName('CVE_SENICREB').AsString + #09+
                  qyConsAdeudo.FieldByName('DESC_SENICREB').AsString
{ROIM MARZO 2010 SE AGREGAN CAMPOS}
                   + #09+
                  qyConsAdeudo.FieldByName('CVE_LOCAL_CNBV').AsString + #09+
                  qyConsAdeudo.FieldByName('DESC_LOCAL_CNBV').AsString
{//ROIM}
                 + #09+ qyConsAdeudo.FieldByName('CVE_ANALISTA_RES').AsString
//
                 + #09+ qyConsAdeudo.FieldByName('STATUS').AsString
);

        End;

   IF qyConsAdeudo.FieldByName('CVE_MONEDA').AsFloat = C_DLLS THEN
      vlTipoCambio := vgTCambioMesAnt
   ELSE IF qyConsAdeudo.FieldByName('CVE_MONEDA').AsFloat = 800 THEN
      vlTipoCambio := vgTCambioUDIS
   ELSE
      vlTipoCambio := 1;

   vgTot_CP_Vig   := vgTot_CP_Vig + (qyConsAdeudo.FieldByName('VIGENTE_CP').AsFloat * vlTipoCambio);
   vgTot_CP_Imp   := vgTot_CP_Imp + (qyConsAdeudo.FieldByName('IMPAGADO_CP').AsFloat* vlTipoCambio);
   vgTot_CP_Vdo   := vgTot_CP_Vdo + (qyConsAdeudo.FieldByName('EXIGIBLE_CP').AsFloat* vlTipoCambio);
   vgTot_CP_NEx   := vgTot_CP_NEx + (qyConsAdeudo.FieldByName('NOEXIGIBLE_CP').AsFloat* vlTipoCambio);
   vgTot_IN_Vig   := vgTot_IN_Vig + (qyConsAdeudo.FieldByName('VIGENTE_IN').AsFloat* vlTipoCambio);
   vgTot_IN_Imp   := vgTot_IN_Imp + (qyConsAdeudo.FieldByName('IMPAGADO_IN').AsFloat* vlTipoCambio);
   vgTot_IN_Vdo   := vgTot_IN_Vdo + (qyConsAdeudo.FieldByName('EXIGIBLE_IN').AsFloat* vlTipoCambio);
   vgTot_IN_Nex   := vgTot_IN_Nex + (qyConsAdeudo.FieldByName('CTA_ORD_IN').AsFloat* vlTipoCambio);
   vgTot_Moras    := vgTot_Moras  + (qyConsAdeudo.FieldByName('MORATORIOS').AsFloat* vlTipoCambio);
   vgTot_Otros    := vgTot_Otros  + (qyConsAdeudo.FieldByName('IMP_OTROS').AsFloat* vlTipoCambio);
   vgTotal_adeudo := vgTotal_adeudo + (qyConsAdeudo.FieldByName('TOT_ADEUDO').AsFloat* vlTipoCambio);
   vgTot_Sdo_Fdeo := vgTot_Sdo_Fdeo + (qyConsAdeudo.FieldByName('SDO_VIG_TOTAL').AsFloat* vlTipoCambio);

   if VLContrato <>  qyConsAdeudo.FieldByName('CONTRATO').AsFloat then
   begin
        VLImpAutAc := VLImpAutAc + qyConsAdeudo.FieldByName('IMP_AUTORIZADO').AsFloat;
        VLImpAutGE := VLImpAutGE + qyConsAdeudo.FieldByName('IMP_AUTORIZADO').AsFloat;
        VLImpAutMo := VLImpAutMo + qyConsAdeudo.FieldByName('IMP_AUTORIZADO').AsFloat;
        VLImpAunTG := VLImpAunTG + qyConsAdeudo.FieldByName('IMP_AUTORIZADO').AsFloat* vlTipoCambio;
        VLContrato := qyConsAdeudo.FieldByName('CONTRATO').AsFloat;
   end;

end;

procedure TQrConsAdeudo.QRFooterAcreditadoBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
{
   If sArchivo <>'' Then Begin
      Writeln(F, #09#09#09 + 'Total por Acreditado' +#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr26.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr1.Value.dblResult) +#09 +
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr2.Value.dblResult) +#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr3.Value.dblResult) +#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr4.Value.dblResult) +#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr8.Value.dblResult) +#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr7.Value.dblResult) +#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr6.Value.dblResult) +#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr5.Value.dblResult) +#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr9.Value.dblResult) +#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr10.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr11.Value.dblResult)+#09+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr12.Value.dblResult)+#09
             );
   End
   Else      PrintBand := True;
   }

   QRLabel42.Caption :=  FormatFloat('###,###,###,###,###,##0.00',VLImpAutAc);
   VLImpAutAc := 0;
end;

procedure TQrConsAdeudo.qrgrpFooterMonedaBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin

   If sArchivo <>'' Then Begin
      Writeln(F, #09#09#09 + 'Total por Moneda' +#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09+
                  FormatFloat('###,###,###,###,###,##0.00',VLImpAutMo)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr38.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr37.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr36.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr35.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr34.value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr33.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr32.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr31.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr30.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr29.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr28.Value.dblResult)+#09+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr27.Value.dblResult)+#09
             );
   End;

   QRLabel38.Caption :=  FormatFloat('###,###,###,###,###,##0.00',VLImpAutMo);
   VLImpAutMo := 0;

end;

procedure TQrConsAdeudo.qrgrpFooterGpoEconomicoBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
{
   If sArchivo <>'' Then Begin
      Writeln(F, #09#09#09 + 'Total por Grupo Economico' +#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr25.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr24.Value.dblResult)+#09 +
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr23.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr22.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr21.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr20.value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr19.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr18.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr17.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr16.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr15.Value.dblResult)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr14.Value.dblResult)+#09+#09+
                  FormatFloat('###,###,###,###,###,##0.00',QRExpr13.Value.dblResult)+#09
             );
   End;
   }

   QRLabel40.Caption :=  FormatFloat('###,###,###,###,###,##0.00',VLImpAutGE);
   VLImpAutGE := 0;


end;

procedure TQrConsAdeudo.SummaryBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   If sArchivo <>'' Then Begin
      Writeln(F, #09#09#09 + 'Total General' +#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09#09+
                  FormatFloat('###,###,###,###,###,##0.00',vgTot_CP_Vig)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',vgTot_CP_Imp)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',vgTot_CP_Vdo)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',vgTot_CP_NEx)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',vgTot_IN_Vig)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',vgTot_IN_Imp)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',vgTot_IN_Vdo)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',vgTot_IN_Nex)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',vgTot_Moras)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',vgTot_Otros)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',vgTotal_adeudo)+#09+
                  FormatFloat('###,###,###,###,###,##0.00',vgTot_Sdo_Fdeo)+#09
             );
   End;

   Tot_CP_Vig.Caption   := FormatFloat('###,###,###,###,###,##0.00',vgTot_CP_Vig);
   Tot_CP_Imp.Caption   := FormatFloat('###,###,###,###,###,##0.00',vgTot_CP_Imp);
   Tot_CP_Exi.Caption   := FormatFloat('###,###,###,###,###,##0.00',vgTot_CP_Vdo);
   Tot_CP_NEx.Caption   := FormatFloat('###,###,###,###,###,##0.00',vgTot_CP_NEx);
   Tot_IN_Vig.Caption   := FormatFloat('###,###,###,###,###,##0.00',vgTot_IN_Vig);
   Tot_IN_Imp.Caption   := FormatFloat('###,###,###,###,###,##0.00',vgTot_IN_Imp);
   Tot_IN_Exig.Caption  := FormatFloat('###,###,###,###,###,##0.00',vgTot_IN_Vdo);
   Tot_IN_CtaOrd.Caption:= FormatFloat('###,###,###,###,###,##0.00',vgTot_IN_Nex);
   Tot_Moras.Caption    := FormatFloat('###,###,###,###,###,##0.00',vgTot_Moras);
   Tot_Otros.Caption    := FormatFloat('###,###,###,###,###,##0.00',vgTot_Otros);
   Total_adeudo.Caption := FormatFloat('###,###,###,###,###,##0.00',vgTotal_adeudo);
   Tot_Sdo_Fdeo.Caption := FormatFloat('###,###,###,###,###,##0.00',vgTot_Sdo_Fdeo);

   If qyConsAdeudo.Eof Then Begin
      If Trim(sArchivo)<>'' Then Begin
         sArchivo:='';
         bGenArch:= True;
         CloseFile(F);
      End;
   End;

   QRLabel41.Caption :=  FormatFloat('###,###,###,###,###,##0.00',VLImpAunTG);
   VLImpAunTG := 0;

end;

procedure TQrConsAdeudo.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
      vgTot_CP_Vig   := 0;
      vgTot_CP_Imp   := 0;
      vgTot_CP_Vdo   := 0;
      vgTot_CP_NEx   := 0;
      vgTot_IN_Vig   := 0;
      vgTot_IN_Imp   := 0;
      vgTot_IN_Vdo   := 0;
      vgTot_IN_Nex   := 0;
      vgTot_Moras    := 0;
      vgTot_Otros    := 0;
      vgTotal_adeudo := 0;
      vgTot_Sdo_Fdeo := 0;


      VLImpAutGE := 0;
      VLImpAutMo := 0;
      VLImpAunTG := 0;
      VLContrato := 0;
end;

End.
