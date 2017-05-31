unit IntMQrSgCobr;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview;
Const
   coCRLF      = #13#10;
type
  TQrSgCobr = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    ColumnHeaderBand1: TQRBand;
    qySegCobranza: TQuery;
    QRShape1: TQRShape;
    QRLabel9: TQRLabel;
    QRShape2: TQRShape;
    QRLabel13: TQRLabel;
    QRShape3: TQRShape;
    QRLabel15: TQRLabel;
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
    qrlPromotor: TQRLabel;
    dbNom_Promotor: TQRDBText;
    QRDBText1: TQRDBText;
    qySegCobranzaID_CREDITO: TFloatField;
    qySegCobranzaOPERADO: TStringField;
    qySegCobranzaID_SEGUIMIENTO: TFloatField;
    qySegCobranzaDESC_SEGUIMIENTO: TStringField;
    qySegCobranzaIMP_TOTAL: TFloatField;
    qySegCobranzaSIT_CREDITO: TStringField;
    qySegCobranzaSIT_SEGUIMIENTO: TStringField;
    qySegCobranzaID_PROM_ADM: TFloatField;
    qySegCobranzaNOM_PROMOTOR_ADM: TStringField;
    qySegCobranzaID_PERS_ASOCIAD: TFloatField;
    qySegCobranzaNOM_PROMOTOR_ASO: TStringField;
    qySegCobranzaDESC_L_PRODUCTO: TStringField;
    qySegCobranzaCVE_TIPO_PAGO: TStringField;
    qySegCobranzaDESC_MONEDA: TStringField;
    qySegCobranzaNOM_TITULAR: TStringField;
    qySegCobranzaCENTRO: TStringField;
    qySegCobranzaCVE_NAF_TIT: TStringField;
    qySegCobranzaCHEQ_TIT: TStringField;
    qySegCobranzaSDO_TIT: TFloatField;
    qySegCobranzaCHEQ_NOM_TIT_T: TStringField;
    qySegCobranzaNOM_PROVEEDOR: TStringField;
    qySegCobranzaNAFIN_PROV: TFloatField;
    qySegCobranzaCHEQ_PROV: TStringField;
    qySegCobranzaSDO_PROV: TFloatField;
    qySegCobranzaCHEQ_NOM_TIT_P: TStringField;
    qySegCobranzaCVE_PRODUCTO_CRE: TStringField;
    qySegCobranzaB_OPERADO_NAFIN: TStringField;
    qySegCobranzaID_PROVEEDOR: TFloatField;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    qySegCobranzaTX_DESC_INSTRUC: TStringField;
    QRLabel23: TQRLabel;
    SummaryBand: TQRBand;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    qySegCobranzaCVE_MONEDA: TFloatField;
    dbNombre_Promotor: TQRDBText;
    qySegCobranzaID_CESION: TFloatField;
    qySegCobranzaTIPO_PAGO: TStringField;
    qySegCobranzaPROGRAMADO: TFloatField;
    qySegCobranzaANTICIPADO: TFloatField;
    qySegCobranzaIMPAGADO: TFloatField;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr15: TQRExpr;
    qySegCobranzaNO_ID: TFloatField;
    qySegCobranzaSUMA_TOTAL: TFloatField;
    qySegCobranzaTOT_ID_PROG: TFloatField;
    qySegCobranzaTOT_ID_ANT: TFloatField;
    qySegCobranzaTOT_ID_IMP: TFloatField;
    qySegCobranzaTOT_NI_PROG: TFloatField;
    qySegCobranzaTOT_NI_IMP: TFloatField;
    qySegCobranzaTOT_CA_PROG: TFloatField;
    qySegCobranzaTOT_NI_ANT: TFloatField;
    qySegCobranzaTOT_CA_ANT: TFloatField;
    qySegCobranzaTOT_CA_IMP: TFloatField;
    qySegCobranzaID_TITULAR: TFloatField;
    QRShape10: TQRShape;
    dbTipo_Pago: TQRDBText;
    QRLabel3: TQRLabel;
    QRShape12: TQRShape;
    QRLabel5: TQRLabel;
    dbTitular: TQRDBText;
    QRLabel7: TQRLabel;
    dbChequeraTit: TQRDBText;
    QRLabel8: TQRLabel;
    dbSaldoTit: TQRDBText;
    QRLabel10: TQRLabel;
    dbTitularTit: TQRDBText;
    QRLabel11: TQRLabel;
    dbNom_Proveedor: TQRDBText;
    QRLabel12: TQRLabel;
    dbNumNAFINSA: TQRDBText;
    QRLabel14: TQRLabel;
    dbCheqProveedor: TQRDBText;
    QRLabel16: TQRLabel;
    dbSaldoProveedor: TQRDBText;
    QRLabel19: TQRLabel;
    dbTit_Proveedor: TQRDBText;
    QRDBText9: TQRDBText;
    QRShape11: TQRShape;
    dbMoneda: TQRDBText;
    QRLabel4: TQRLabel;
    QRShape9: TQRShape;
    dbProducto: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    qrlNam_Tit: TQRLabel;
    dbTitNumNafinsa: TQRDBText;
    dbCentro: TQRDBText;
    QRShape13: TQRShape;
    QRGroupPromotor: TQRGroup;
    QRGroupMoneda: TQRGroup;
    QRGroupTipoPag: TQRGroup;
    QRGroupProd: TQRGroup;
    QRGroupTitular: TQRGroup;
    QRGroupProveedor: TQRGroup;
    QRSubDiv: TQRGroup;
    QRFootEmis: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel31: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRFootSubdiv: TQRBand;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRExpr16: TQRExpr;
    QRExpr17: TQRExpr;
    QRExpr18: TQRExpr;
    QRFootProv: TQRBand;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRExpr19: TQRExpr;
    QRExpr20: TQRExpr;
    QRExpr21: TQRExpr;
    QRFootTipoPago: TQRBand;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRExpr22: TQRExpr;
    QRExpr23: TQRExpr;
    QRExpr24: TQRExpr;
    qyMonitorCobranza: TQuery;
    qyMonitorCobranzaID_CREDITO: TFloatField;
    qyMonitorCobranzaIMP_IDE_PROGRAMADO: TFloatField;
    qyMonitorCobranzaIMP_COB_PROGRAMADO: TFloatField;
    qyMonitorCobranzaIMP_IDE_ANTICIPADO: TFloatField;
    qyMonitorCobranzaIMP_COB_ANTICIPADO: TFloatField;
    qyMonitorCobranzaIMP_IDE_IMPAGADO: TFloatField;
    qyMonitorCobranzaIMP_COB_IMPAGADO: TFloatField;
    SummaryChildBand: TQRChildBand;
    QRMemoIMP_IDE_IMPAGADO: TQRMemo;
    qrlblIDEIMP: TQRLabel;
    QRMemoIMP_COB_IMPAGADO: TQRMemo;
    qrlblCOBIMP: TQRLabel;
    qrlblImpagado: TQRLabel;
    qrlblProgramado: TQRLabel;
    qrlblCOBPROG: TQRLabel;
    QRMemoIMP_COB_PROGRAMADO: TQRMemo;
    QRMemoIMP_IDE_PROGRAMADO: TQRMemo;
    qrlblCOBANT: TQRLabel;
    QRMemoIMP_COB_ANTICIPADO: TQRMemo;
    QRMemoIMP_IDE_ANTICIPADO: TQRMemo;
    qrlblIDEANT: TQRLabel;
    qrlblAnticipado: TQRLabel;
    qrlblCesionCredito: TQRLabel;
    QRMemoID_CREDITO: TQRMemo;
    qrlblTitulo: TQRLabel;
    qrshpTitulo: TQRShape;
    qrlblIDEPROG: TQRLabel;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;



    procedure qySegCobranzaCalcFields(DataSet: TDataSet);
    procedure QRSubDivBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroupTipoPagBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure SummaryChildBandBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
  public
    Function FormaQuery(sF_Seguimiento,sProducto,sMoneda,
                        sAcreditado,sPromAsoc,sPromAdmon,sTipoCob,
                        sSituacion, sEmpresa, sSucursal:String):String;
  end;

var
  QrSgCobr: TQrSgCobr;

Procedure RepSegCobranza(   sF_Seguimiento,sProducto,sMoneda,
                            sAcreditado,sPromAsoc,sPromAdmon,sTipoCob,
                            sSituacion, sEmpresa, sSucursal:String;
                            pAPli     : TInterApli;
                            pPreview  : Boolean);
Implementation
{$R *.DFM}

Procedure RepSegCobranza(  sF_Seguimiento,sProducto,sMoneda,
                            sAcreditado,sPromAsoc,sPromAdmon,sTipoCob,
                            sSituacion, sEmpresa, sSucursal:String;
                            pAPli     : TInterApli;
                            pPreview  : Boolean);
Var
    QrSgCobr: TQrSgCobr;
    Preview     : TIntQRPreview;
Begin
    QrSgCobr:=TQrSgCobr.Create(Nil);
    Preview := TIntQRPreview.CreatePreview(Application, QrSgCobr);
    Try

        QrSgCobr.QRInterEncabezado1.Apli:=pApli;
        QrSgCobr.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
        QrSgCobr.QRInterEncabezado1.NomReporte:='IntMQrSgCobr';
        QrSgCobr.QRInterEncabezado1.Titulo1:='Seguimiento de Cobranza';
        If Trim(sF_Seguimiento)<>'' Then
            QrSgCobr.QRInterEncabezado1.Titulo2:='Del día: '+  sF_Seguimiento;
        QrSgCobr.qySegCobranza.DatabaseName := pApli.DataBaseName;
        QrSgCobr.qySegCobranza.SessionName := pApli.SessionName;

        If (Trim(sPromAsoc)='')and(Trim(sPromAdmon)='') Then Begin
            QrSgCobr.QRGroupPromotor.Enabled:=False;
            QrSgCobr.QRGroupPromotor.Expression:='';
        End Else If (Trim(sPromAsoc)<>'')Then Begin
            QrSgCobr.QRGroupPromotor.Enabled:=True;
            QrSgCobr.QRGroupPromotor.Expression:='qySegCobranza.ID_PERS_ASOCIAD';
            QrSgCobr.dbNom_Promotor.DataField:= 'ID_PERS_ASOCIAD';
            QrSgCobr.dbNombre_Promotor.DataField:= 'NOM_PROMOTOR_ASO';
            QrSgCobr.qrlPromotor.Caption:='Promotor Asociado';
        End Else If (Trim(sPromAdmon)<>'')Then Begin
            QrSgCobr.QRGroupPromotor.Enabled:=True;
            QrSgCobr.QRGroupPromotor.Expression:='qySegCobranza.ID_PROM_ADM';
            QrSgCobr.dbNom_Promotor.DataField:= 'ID_PROM_ADM';
            QrSgCobr.dbNombre_Promotor.DataField:= 'NOM_PROMOTOR_ADM';
            QrSgCobr.qrlPromotor.Caption:='Promotor Admón';
        End;
        QrSgCobr.qySegCobranza.Active:=False;
        QrSgCobr.qySegCobranza.SQL.Text:= QrSgCobr.FormaQuery(sF_Seguimiento,sProducto,
                        sMoneda,sAcreditado,sPromAsoc,sPromAdmon,sTipoCob,sSituacion,
                        sEmpresa, sSucursal);
        QrSgCobr.qySegCobranza.Active:=True;

         //Posiciona el Cursor en el útimo registro
         // SATV4766
         With QrSgCobr.qyMonitorCobranza Do
          Begin
          DatabaseName := pApli.DataBaseName;
          SessionName := pApli.SessionName;
          ParamByName('PFECHA').AsDateTime := StrToDate(sF_Seguimiento);
          Active := True;
          End;


        If pPreview Then
            QrSgCobr.Preview
        Else
            QrSgCobr.Print;
    Finally
        // SATV4766 se cierran los cursores de los Queries
        QrSgCobr.qySegCobranza.Close;
        QrSgCobr.qyMonitorCobranza.Close;        

        QrSgCobr.free;

        If Assigned(Preview) Then
         Preview.Free;
    End;
End;

Function TQrSgCobr.FormaQuery(  sF_Seguimiento,sProducto,sMoneda,
                        sAcreditado,sPromAsoc,sPromAdmon,sTipoCob,
                        sSituacion, sEmpresa, sSucursal:String):String;
Var
    sSQL:String; //slLista:TStringList;
Begin

    sSQL:=  ' SELECT '+ coCRLF +
            ' SUBDIV.ID_CESION, '+ coCRLF +
            ' CBS.ID_CREDITO, '+ coCRLF +
//            ' SUBDIV.B_OPERADO_NAFIN, '+ coCRLF +
            ' DECODE(SUBDIV.B_OPERADO_NAFIN,NULL,''F'',SUBDIV.B_OPERADO_NAFIN) B_OPERADO_NAFIN,'+ coCRLF +
//            ' DECODE(CCE.B_OPERADO_NAFIN,''F'',''PROPIOS'',''V'',''NAFIN'','''') OPERADO, '+ coCRLF +
            ' DECODE(SUBDIV.B_OPERADO_NAFIN,''F'',''PROPIOS'',''V'',''NAFIN'') OPERADO,'+ coCRLF +
            ' CBS.ID_SEGUIMIENTO, '+ coCRLF +
            ' CSE.DESC_SEGUIMIENTO, '+ coCRLF +
            ' CBS.IMP_TOTAL, '+ coCRLF +
            ' CBS.TX_DESC_INSTRUC, '+ coCRLF +
            ' CC.SIT_CREDITO, '+ coCRLF +
            ' CBS.SIT_SEGUIMIENTO, '+ coCRLF +
            ' CPR.CVE_PRODUCTO_CRE, '+ coCRLF +
            ' CPR.DESC_L_PRODUCTO, '+ coCRLF +
            ' CBS.CVE_TIPO_PAGO, '+ coCRLF +
            ' DECODE(CBS.CVE_TIPO_PAGO,''MD'',''PROGRAMADA'',''AN'',''ANTICIPADA'',''IM'',''IMPAGADA'',''NO IDENTIFICADO'') TIPO_PAGO, '+ coCRLF +
            ' DECODE(CBS.CVE_TIPO_PAGO,''MD'',CBS.IMP_TOTAL,0) PROGRAMADO, '+ coCRLF +
            ' DECODE(CBS.CVE_TIPO_PAGO,''AN'',CBS.IMP_TOTAL,0) ANTICIPADO, '+ coCRLF +
            ' DECODE(CBS.CVE_TIPO_PAGO,''IM'',CBS.IMP_TOTAL,0) IMPAGADO, '+ coCRLF +
            ' DECODE(CBS.CVE_TIPO_PAGO,''MD'',0,''AN'',0,''IM'',0,CBS.IMP_TOTAL) NO_ID, '+ coCRLF +
            ' CTO.CVE_MONEDA, '+ coCRLF +
            ' M.DESC_MONEDA, CTO.ID_TITULAR, ' + coCRLF;

            If Trim(sPromAsoc)<>'' Then
                sSQL:= sSQL+ ' 0 ID_PROM_ADM, '+ coCRLF +
                ' '' '' NOM_PROMOTOR_ADM, '+ coCRLF +
                ' CTO.ID_PERS_ASOCIAD, '+ coCRLF +
                ' PPRC.NOMBRE NOM_PROMOTOR_ASO, ' + coCRLF
            Else If Trim(sPromAdmon)<>'' Then
                sSQL:= sSQL+ ' CC.ID_PROM_ADM, '+ coCRLF +
                ' PPR.NOMBRE NOM_PROMOTOR_ADM, '+ coCRLF +
                ' 0 ID_PERS_ASOCIAD, '+ coCRLF +
                ' '' '' NOM_PROMOTOR_ASO, ' + coCRLF
            Else
                sSQL:= sSQL+ ' 0 ID_PROM_ADM, '+ coCRLF +
                ' '' '' NOM_PROMOTOR_ADM, '+ coCRLF +
                ' 0 ID_PERS_ASOCIAD, '+ coCRLF +
                ' '' '' NOM_PROMOTOR_ASO, ' +  coCRLF;

            sSQL:= sSQL+ ' DECODE(PCE.CVE_PER_JURIDICA,''PM'',PCE.NOMBRE,PTIT.APELLIDO_PATERNO||'' ''||PTIT.APELLIDO_MATERNO||'' ''||PTIT.NOMBRE_PERSONA) NOM_TITULAR, '+ coCRLF +
            ' SUBDIV.ID_EMISOR, '+ coCRLF +
            ' NVL(SUBDIV.CVE_EMISOR_NAFIN,0) CVE_NAF_TIT, '+ coCRLF +
            ' SUBDIV.ID_PROVEEDOR, '+ coCRLF +
            ' SUBDIV.NOMBRE_EMISOR CENTRO, '+ coCRLF +
//            ' CE.CUENTA_BANCO CHEQ_TIT, '+ coCRLF +
//            ' SUBSTR(PKGCRPERIODO.STPObtChqCte(CCE.ID_EMISOR,CCE.CVE_EMISOR_NAFIN,CCE.ID_CESION,''AC'',''AD'',''CR''),1,20) CHEQ_TIT,'+ coCRLF +
            ' SUBSTR(PKGCRPERIODO.STPObtChqCte(SUBDIV.ID_EMISOR,NVL(SUBDIV.CVE_EMISOR_NAFIN,0),SUBDIV.ID_CESION,'+ coCRLF +
            ' DECODE(SUBDIV.TIPO_ACRED, NULL,''AC'', TIPO_ACRED),''AD'',''CR''),1,20) CHEQ_TIT,'+ coCRLF +
            ' PP.NOMBRE NOM_PROVEEDOR, '+ coCRLF +
//            ' CP.CUENTA_BANCO CHEQ_PROV, '+
//            ' SUBSTR(PKGCRPERIODO.STPObtChqCte(CCE.ID_PROVEEDOR,NULL,CCE.ID_CESION,''PR'',''AD'',''AB''),1,20) CHEQ_PROV, '+ coCRLF +
            ' SUBSTR(PKGCRPERIODO.STPObtChqCte(SUBDIV.ID_PROVEEDOR,NULL,SUBDIV.ID_CESION,''PR'',''AD'',''AB''),1,20) CHEQ_PROV,'+ coCRLF +
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
//            ' CP.ID_PROV_NAFINSA NAFIN_PROV, '+ coCRLF +
            ' CP.ID_PROV_EXTERNO NAFIN_PROV, '+ coCRLF +
{/ROIM}
//            ' PKGDPVISTASERV.SPTObtSaldo(CE.CUENTA_BANCO,''D000'') SDO_TIT, '+
//            ' PKGDPVISTASERV.SPTObtSaldo(PKGCRPERIODO.STPObtChqCte(CCE.ID_EMISOR,CCE.CVE_EMISOR_NAFIN,CCE.ID_CESION,''AC'',''AD'',''CR''),''D000'') SDO_TIT, '+ coCRLF +
            ' PKGDPVISTASERV.SPTObtSaldo(PKGCRPERIODO.STPObtChqCte(SUBDIV.ID_EMISOR,SUBDIV.CVE_EMISOR_NAFIN,SUBDIV.ID_CESION,'+ coCRLF +
            ' DECODE(SUBDIV.TIPO_ACRED, NULL,''AC'', TIPO_ACRED),''AD'',''CR''),''D000'') SDO_TIT,'+ coCRLF +
//            ' PKGDPVISTASERV.SPTObtSaldo(CP.CUENTA_BANCO,''D000'') SDO_PROV, '+
//            ' PKGDPVISTASERV.SPTObtSaldo(PKGCRPERIODO.STPObtChqCte(CCE.ID_PROVEEDOR,NULL,CCE.ID_CESION,''PR'',''AD'',''AB''),''D000'') SDO_PROV, '+ coCRLF +
            ' PKGDPVISTASERV.SPTObtSaldo(PKGCRPERIODO.STPObtChqCte(SUBDIV.ID_PROVEEDOR,NULL,SUBDIV.ID_CESION,''PR'',''AD'',''AB''),''D000'') SDO_PROV,'+ coCRLF +
            ' DECODE(PCET.CVE_PER_JURIDICA,''PM'',PCET.NOMBRE,PCCHE.APELLIDO_PATERNO||'' ''||PCCHE.APELLIDO_MATERNO||'' ''||PCCHE.NOMBRE_PERSONA) CHEQ_NOM_TIT_T, '+ coCRLF +
            ' DECODE(PCEP.CVE_PER_JURIDICA,''PM'',PCEP.NOMBRE,PCCHP.APELLIDO_PATERNO||'' ''||PCCHP.APELLIDO_MATERNO||'' ''||PCCHP.NOMBRE_PERSONA) CHEQ_NOM_TIT_P '+ coCRLF +

            ' FROM '+ coCRLF +
            ' CR_BIT_SEGUIMIENTO CBS, '+ coCRLF +
//            ' CR_CESION      CCE, '+ coCRLF +
            ' CR_SEGUIMIENTO   CSE, '+ coCRLF +
            ' CR_CREDITO    CC, '+ coCRLF ;

            If Trim(sPromAdmon)<>'' Then
                sSQL:= sSQL+ ' PERSONA       PPR, ' + coCRLF
            Else If Trim(sPromAsoc)<>'' Then
                sSQL:= sSQL+ ' PERSONA       PPRC, ' + coCRLF;

            sSQL:= sSQL+ ' CR_CONTRATO   CCTO, '+ coCRLF +
            ' CR_PRODUCTO   CPR, '+ coCRLF +
            ' CONTRATO      CTO, '+ coCRLF +
            ' MONEDA        M, '+ coCRLF +
            ' PERSONA_FISICA PTIT, '+ coCRLF +
            ' PERSONA       PCE, '+ coCRLF +
//            ' CR_EMISOR     CE, '+ coCRLF +
            ' PERSONA       PP, '+ coCRLF +
            ' CR_PROVEEDOR  CP, '+ coCRLF +
            ' CONTRATO      CCHE, '+ coCRLF +
            ' PERSONA_FISICA PCCHE, '+ coCRLF +
            ' PERSONA       PCET, '+ coCRLF +
            ' CONTRATO      CCHP, '+ coCRLF +
            ' PERSONA_FISICA PCCHP, '+ coCRLF +
            ' PERSONA       PCEP, '+ coCRLF +
            ' ( SELECT SUB.CVE_SUB_DIVISION CVE_EMISOR_NAFIN, '+ coCRLF +
            '          SUB.NOMBRE_SUB_DIV NOMBRE_EMISOR, '+ coCRLF +
            '          ID_ACREDITADO ID_EMISOR, '+ coCRLF +
            '          PROCAM.ID_CREDITO  ID_CESION, '+ coCRLF +
            '          0 ID_PROVEEDOR, '+ coCRLF +
            '          ''F'' B_OPERADO_NAFIN, ''AP'' TIPO_ACRED, '+ coCRLF +
            '          SUB.ID_PERSONA '+ coCRLF +
            '   FROM CR_SUBDIV_PROCAM SUB, CR_PROCAMPO PROCAM '+ coCRLF +
            '   WHERE PROCAM.CVE_SUB_DIVISION = SUB.CVE_SUB_DIVISION '+ coCRLF +
            '   UNION '+ coCRLF +
            '   SELECT CS.CVE_EMISOR_NAFIN, '+ coCRLF +
            '          CE.NOMBRE_EMISOR ID_EMISOR, '+ coCRLF +
            '          CE.ID_ACREDITADO , '+ coCRLF +
            '          CS.ID_CESION, '+ coCRLF +
            '          CS.ID_PROVEEDOR, '+ coCRLF +
            '          CS.B_OPERADO_NAFIN, ''AC'' TIPO_ACRED, '+ coCRLF +
            '          CE.ID_ACREDITADO ID_PERSONA '+ coCRLF +
            '   FROM CR_EMISOR CE, CR_CESION CS '+ coCRLF +
            '   WHERE CS.ID_EMISOR = CE.ID_ACREDITADO '+ coCRLF +
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
            '   AND CS.CVE_FND_ENT_DES = CE.CVE_FND_ENT_DES ' + coCRLF +
//            '   AND CS.CVE_EMISOR_NAFIN = CE.CVE_EMISOR_NAFIN ' + coCRLF +
            '   AND CS.CVE_EMISOR_NAFIN = CE.CVE_EMISOR_EXT ' + coCRLF +
{/ROIM}
            '   )SUBDIV '+ coCRLF +
//            ' WHERE CCE.ID_CESION (+)= CBS.ID_CREDITO '+ coCRLF +
            ' WHERE SUBDIV.ID_CESION(+)= CBS.ID_CREDITO '+ coCRLF +
            ' AND   CSE.CVE_SEGUIMIENTO = CBS.CVE_SEGUIMIENTO '+ coCRLF +
            ' AND   CC.ID_CREDITO = CBS.ID_CREDITO ' + coCRLF;

            If Trim(sPromAdmon)<>'' Then
                sSQL:= sSQL+ ' AND   PPR.ID_PERSONA = CC.ID_PROM_ADM ' + coCRLF
            Else If Trim(sPromAsoc)<>'' Then
                sSQL:= sSQL+ ' AND   PPRC.ID_PERSONA = CTO.ID_PERS_ASOCIAD ' + coCRLF;

            sSQL:= sSQL+ ' AND   CCTO.ID_CONTRATO = CC.ID_CONTRATO '+ coCRLF +
            ' AND   CCTO.FOL_CONTRATO = CC.FOL_CONTRATO '+ coCRLF +
            ' AND   CPR.CVE_PRODUCTO_CRE = CCTO.CVE_PRODUCTO_CRE '+ coCRLF +
            ' AND   CTO.ID_CONTRATO = CC.ID_CONTRATO '+ coCRLF +
            ' AND   M.CVE_MONEDA = CTO.CVE_MONEDA '+ coCRLF +
            ' AND   PTIT.ID_PERSONA(+)= CTO.ID_TITULAR '+ coCRLF +
            ' AND   PCE.ID_PERSONA = CTO.ID_TITULAR '+ coCRLF +
//            ' AND   CE.ID_ACREDITADO(+) = CCE.ID_EMISOR '+ coCRLF +
//            ' AND   CE.CVE_EMISOR_NAFIN(+) = CCE.CVE_EMISOR_NAFIN '+ coCRLF +
//            ' AND   PP.ID_PERSONA(+) = CCE.ID_PROVEEDOR '+ coCRLF +
            ' AND   PP.ID_PERSONA(+)= SUBDIV.ID_PROVEEDOR '+ coCRLF +
//            ' AND   CP.ID_ACREDITADO(+) = CCE.ID_PROVEEDOR '+ coCRLF +
            ' AND   CP.ID_ACREDITADO(+)= SUBDIV.ID_PROVEEDOR '+ coCRLF +
//            ' AND   CCHE.ID_CONTRATO(+) = CE.CUENTA_BANCO '+
//            ' AND   CCHE.ID_CONTRATO(+) = PKGCRPERIODO.STPObtChqCte(CCE.ID_EMISOR,CCE.CVE_EMISOR_NAFIN,CCE.ID_CESION,''AC'',''AD'',''CR'') '+ coCRLF +
            ' AND   CCHE.ID_CONTRATO(+) = PKGCRPERIODO.STPObtChqCte(SUBDIV.ID_EMISOR,NVL(SUBDIV.CVE_EMISOR_NAFIN,0),SUBDIV.ID_CESION,DECODE(SUBDIV.TIPO_ACRED, NULL,''AC'', TIPO_ACRED),''AD'',''CR'') '+ coCRLF +
            ' AND   PCCHE.ID_PERSONA(+) = CCHE.ID_TITULAR '+ coCRLF +
            ' AND   PCET.ID_PERSONA(+) = CCHE.ID_TITULAR '+ coCRLF +
//            ' AND   CCHP.ID_CONTRATO (+)= CP.CUENTA_BANCO '+
//            ' AND   CCHP.ID_CONTRATO (+)= PKGCRPERIODO.STPObtChqCte(CCE.ID_PROVEEDOR,NULL,CCE.ID_CESION,''PR'',''AD'',''AB'') '+ coCRLF +
            ' AND   CCHP.ID_CONTRATO (+)= PKGCRPERIODO.STPObtChqCte(SUBDIV.ID_PROVEEDOR,NULL,SUBDIV.ID_CESION,''PR'',''AD'',''AB'') '+ coCRLF +
            ' AND   PCCHP.ID_PERSONA (+)= CCHP.ID_TITULAR'+ coCRLF +
            ' AND   PCEP.ID_PERSONA(+) = CCHP.ID_TITULAR'+  coCRLF;

    If (Trim(sF_Seguimiento)<>'') Then Begin
        sSQL:= sSQL + ' AND CBS.F_COBRANZA = TO_DATE('''+
               FormatDateTime('DD/MM/YYYY',StrToDate(sF_Seguimiento))+''',''DD/MM/YYYY'')' + coCRLF;
    End;

    If (Trim(sProducto)<>'') Then
        sSQL:= sSQL + ' AND   CPR.CVE_PRODUCTO_CRE ='''+sProducto+''''+ coCRLF;
    If (Trim(sMoneda)<>'') Then
        sSQL:= sSQL + ' AND   CTO.CVE_MONEDA  ='+sMoneda+ coCRLF;
    If (Trim(sAcreditado)<>'') Then
        //sSQL:= sSQL + ' AND CP.ID_ACREDITADO  ='+ sAcreditado+ coCRLF;
        sSQL:= sSQL + ' AND CTO.ID_TITULAR  ='+ sAcreditado+ coCRLF;
    If (Trim(sPromAsoc)<>'') Then
        sSQL:= sSQL + ' AND   CTO.ID_PERS_ASOCIAD ='+ sPromAsoc + coCRLF;
    If (Trim(sPromAdmon)<>'') Then
        sSQL:= sSQL + ' AND   CC.ID_PROM_ADM ='+ sPromAdmon + coCRLF;
    If (Trim(sTipoCob)<>'') Then
        sSQL:= sSQL + ' AND   CBS.CVE_TIPO_PAGO ='''+ sTipoCob+'''' + coCRLF;
    If (Trim(sSituacion)<>'') Then
        sSQL:= sSQL + ' AND   CBS.SIT_SEGUIMIENTO ='''+ sSituacion +'''' + coCRLF;
    If (Trim(sEmpresa)<>'') Then
        sSQL:= sSQL + ' AND   CPR.ID_EMPRESA ='+ Trim(sEmpresa) + coCRLF;


    sSQL:= sSQL + ' ORDER BY DESC_MONEDA, TIPO_PAGO, DESC_L_PRODUCTO, NOM_TITULAR, SUBDIV.CVE_EMISOR_NAFIN, NOM_PROVEEDOR, CBS.ID_CREDITO';

{    slLista:= TStringList.Create;
    slLista.Clear;
    slLista.Add(sSQL);
    slLista.SaveToFile('c:\sql.txt');
    slLista.Free;      }

    Result:= sSQL;
End;

procedure TQrSgCobr.qySegCobranzaCalcFields(DataSet: TDataSet);
begin
    If (Trim(qySegCobranzaID_CESION.AsString) ='') Then Begin
        qrlNam_Tit.Enabled:=False;
        dbTitNumNafinsa.Enabled:=False;
//        qrlCentro.Enabled:=False;
        dbCentro.Enabled:=False;
        QRGroupProveedor.Enabled:=False;
        QRGroupProveedor.Expression:='';
    End Else Begin
        qrlNam_Tit.Enabled:=True;
        dbTitNumNafinsa.Enabled:=True;
//        qrlCentro.Enabled:=True;
        dbCentro.Enabled:=True;
        QRGroupProveedor.Enabled:=True;
        QRGroupProveedor.Expression:='qySegCobranza.ID_PROVEEDOR';        
    End;

    If qySegCobranzaSIT_SEGUIMIENTO.AsString='ID' Then Begin

        If qySegCobranzaCVE_TIPO_PAGO.AsString='MD' Then
            qySegCobranzaTOT_ID_PROG.AsFloat:= qySegCobranzaTOT_ID_PROG.AsFloat + qySegCobranzaIMP_TOTAL.AsFloat
        Else If qySegCobranzaCVE_TIPO_PAGO.AsString='AN' Then
            qySegCobranzaTOT_ID_ANT.AsFloat:= qySegCobranzaTOT_ID_ANT.AsFloat + qySegCobranzaIMP_TOTAL.AsFloat
        Else If qySegCobranzaCVE_TIPO_PAGO.AsString='IM' Then
            qySegCobranzaTOT_ID_IMP.AsFloat:= qySegCobranzaTOT_ID_IMP.AsFloat + qySegCobranzaIMP_TOTAL.AsFloat;

    End Else If qySegCobranzaSIT_SEGUIMIENTO.AsString='NI' Then Begin

        If qySegCobranzaCVE_TIPO_PAGO.AsString='MD' Then
            qySegCobranzaTOT_NI_PROG.AsFloat:= qySegCobranzaTOT_NI_PROG.AsFloat + qySegCobranzaIMP_TOTAL.AsFloat
        Else If qySegCobranzaCVE_TIPO_PAGO.AsString='AN' Then
            qySegCobranzaTOT_NI_ANT.AsFloat:= qySegCobranzaTOT_NI_ANT.AsFloat + qySegCobranzaIMP_TOTAL.AsFloat
        Else If qySegCobranzaCVE_TIPO_PAGO.AsString='IM' Then
            qySegCobranzaTOT_NI_IMP.AsFloat:= qySegCobranzaTOT_NI_IMP.AsFloat + qySegCobranzaIMP_TOTAL.AsFloat;

    End Else If qySegCobranzaSIT_SEGUIMIENTO.AsString='CA' Then Begin

        If qySegCobranzaCVE_TIPO_PAGO.AsString='MD' Then
            qySegCobranzaTOT_CA_PROG.AsFloat:= qySegCobranzaTOT_CA_PROG.AsFloat + qySegCobranzaIMP_TOTAL.AsFloat
        Else If qySegCobranzaCVE_TIPO_PAGO.AsString='AN' Then
            qySegCobranzaTOT_CA_ANT.AsFloat:= qySegCobranzaTOT_CA_ANT.AsFloat + qySegCobranzaIMP_TOTAL.AsFloat
        Else If qySegCobranzaCVE_TIPO_PAGO.AsString='IM' Then
            qySegCobranzaTOT_CA_IMP.AsFloat:= qySegCobranzaTOT_CA_IMP.AsFloat + qySegCobranzaIMP_TOTAL.AsFloat;
    End;
end;

procedure TQrSgCobr.QRSubDivBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
     PrintBand := qySegCobranzaCVE_NAF_TIT.AsString <> '0';
end;

procedure TQrSgCobr.QRGroupTipoPagBeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
     if qySegCobranzaCVE_TIPO_PAGO.AsString= 'MD' then
     begin
        //Programado
        QRLabel37.Enabled := True;        QRExpr19.Enabled := True;
        QRLabel33.Enabled := True;        QRExpr16.Enabled := True;
        QRLabel6.Enabled := True;         QRExpr1.Enabled := True;
        QRLabel41.Enabled := True;        QRExpr22.Enabled := True;
        //Anticipado
        QRLabel38.Enabled := False;        QRExpr20.Enabled := False;
        QRLabel34.Enabled := False;        QRExpr17.Enabled := False;
        QRLabel21.Enabled := False;        QRExpr2.Enabled := False;
        QRLabel42.Enabled := False;        QRExpr23.Enabled := False;
        //Impagado
        QRLabel39.Enabled := False;        QRExpr21.Enabled := False;
        QRLabel35.Enabled := False;        QRExpr18.Enabled := False;
        QRLabel31.Enabled := False;        QRExpr3.Enabled := False;
        QRLabel43.Enabled := False;        QRExpr24.Enabled := False;
     end
     Else If qySegCobranzaCVE_TIPO_PAGO.AsString='AN' Then
     begin
        //Programado
        QRLabel37.Enabled := False;        QRExpr19.Enabled := False;
        QRLabel33.Enabled := False;        QRExpr16.Enabled := False;
        QRLabel6.Enabled := False;         QRExpr1.Enabled := False;
        QRLabel41.Enabled := False;        QRExpr22.Enabled := False;
        //Anticipado
        QRLabel38.Enabled := True;         QRExpr20.Enabled := True;
        QRLabel34.Enabled := True;         QRExpr17.Enabled := True;
        QRLabel21.Enabled := True;         QRExpr2.Enabled := True;
        QRLabel42.Enabled := True;         QRExpr23.Enabled := True;
        //Impagado
        QRLabel39.Enabled := False;        QRExpr21.Enabled := False;
        QRLabel35.Enabled := False;        QRExpr18.Enabled := False;
        QRLabel31.Enabled := False;        QRExpr3.Enabled := False;
        QRLabel43.Enabled := False;        QRExpr24.Enabled := False;
     end
     Else If qySegCobranzaCVE_TIPO_PAGO.AsString='IM' Then
     begin
        //Programado
        QRLabel37.Enabled := False;        QRExpr19.Enabled := False;
        QRLabel33.Enabled := False;        QRExpr16.Enabled := False;
        QRLabel6.Enabled := False;         QRExpr1.Enabled := False;
        QRLabel41.Enabled := False;        QRExpr22.Enabled := False;
        //Anticipado
        QRLabel38.Enabled := False;        QRExpr20.Enabled := False;
        QRLabel34.Enabled := False;        QRExpr17.Enabled := False;
        QRLabel21.Enabled := False;        QRExpr2.Enabled := False;
        QRLabel42.Enabled := False;        QRExpr23.Enabled := False;
        //Impagado
        QRLabel39.Enabled := True;         QRExpr21.Enabled := True;
        QRLabel35.Enabled := True;         QRExpr18.Enabled := True;
        QRLabel31.Enabled := True;         QRExpr3.Enabled := True;
        QRLabel43.Enabled := True;         QRExpr24.Enabled := True;
     end;
end;

procedure TQrSgCobr.SummaryChildBandBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var Bmp : TBitmap;
    nHeight : Integer;
    bVisible : Boolean;
begin
  With (qyMonitorCobranza) Do
   If Active Then
   Try
    Bmp := TBitmap.Create;
    If Assigned (Bmp)Then
     Begin
     Bmp.Canvas.Font := QRMemoID_CREDITO.Font;
     nHeight := Bmp.Canvas.TextHeight('A');
     Bmp.Free;
     End
    Else
     nHeight := 20;

    Last; PrintBand := qyMonitorCobranza.RecordCount > 0;

    QRMemoID_CREDITO.Height :=  RecordCount * nHeight;
    SummaryChildBand.Height := 100 + QRMemoID_CREDITO.Height;

    // Inicializa el tamaño de los créditos
    QRMemoID_CREDITO.Height := QrMemoID_CREDITO.Height;
    QRMemoIMP_IDE_PROGRAMADO.Height := QrMemoID_CREDITO.Height;
    QRMemoIMP_COB_PROGRAMADO.Height := QrMemoID_CREDITO.Height;
    QRMemoIMP_IDE_ANTICIPADO.Height := QrMemoID_CREDITO.Height;
    QRMemoIMP_COB_ANTICIPADO.Height := QrMemoID_CREDITO.Height;
    QRMemoIMP_IDE_IMPAGADO.Height := QrMemoID_CREDITO.Height;
    QRMemoIMP_COB_IMPAGADO.Height := QrMemoID_CREDITO.Height;

    //Inicializa los componentes TMEMOS
    QRMemoID_CREDITO.Lines.Clear;
    QRMemoIMP_IDE_PROGRAMADO.Lines.Clear;
    QRMemoIMP_COB_PROGRAMADO.Lines.Clear;
    QRMemoIMP_IDE_ANTICIPADO.Lines.Clear;
    QRMemoIMP_COB_ANTICIPADO.Lines.Clear;
    QRMemoIMP_IDE_IMPAGADO.Lines.Clear;
    QRMemoIMP_COB_IMPAGADO.Lines.Clear;

    First;
    While Not Eof Do
     Begin
     // Agrega los Datos
     QRMemoID_CREDITO.Lines.Add( Format('%16.0f',[FieldByName('ID_CREDITO').AsFloat]) );
     QRMemoIMP_IDE_PROGRAMADO.Lines.Add( Format('%16.2n',[FieldByName('IMP_IDE_PROGRAMADO').AsFloat ]));
     QRMemoIMP_COB_PROGRAMADO.Lines.Add( Format('%16.2n',[FieldByName('IMP_COB_PROGRAMADO').AsFloat ]));
     QRMemoIMP_IDE_ANTICIPADO.Lines.Add( Format('%16.2n',[FieldByName('IMP_IDE_ANTICIPADO').AsFloat ]));
     QRMemoIMP_COB_ANTICIPADO.Lines.Add( Format('%16.2n',[FieldByName('IMP_COB_ANTICIPADO').AsFloat ]));
     QRMemoIMP_IDE_IMPAGADO.Lines.Add( Format('%16.2n',[FieldByName('IMP_IDE_IMPAGADO').AsFloat ]));
     QRMemoIMP_COB_IMPAGADO.Lines.Add( Format('%16.2n',[FieldByName('IMP_COB_IMPAGADO').AsFloat ]));

     Next;
     End;

   Finally
    Close;
   End;
end;

procedure TQrSgCobr.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
        //Programado
        QRLabel37.Enabled := True;        QRExpr19.Enabled := True;
        QRLabel33.Enabled := True;        QRExpr16.Enabled := True;
        QRLabel6.Enabled := True;         QRExpr1.Enabled := True;
        QRLabel41.Enabled := True;        QRExpr22.Enabled := True;
        //Anticipado
        QRLabel38.Enabled := True;        QRExpr20.Enabled := True;
        QRLabel34.Enabled := True;        QRExpr17.Enabled := True;
        QRLabel21.Enabled := True;        QRExpr2.Enabled := True;
        QRLabel42.Enabled := True;        QRExpr23.Enabled := True;
        //Impagado
        QRLabel39.Enabled := True;        QRExpr21.Enabled := True;
        QRLabel35.Enabled := True;        QRExpr18.Enabled := True;
        QRLabel31.Enabled := True;        QRExpr3.Enabled := True;
        QRLabel43.Enabled := True;        QRExpr24.Enabled := True;
end;

End.

