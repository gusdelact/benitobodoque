unit IntMQrDocEmi;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview,
  //UNIDAD DE CALCULO DEL IVA
  UnTasaimp  ;

type
  TQrDocEmi = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    PFooterMoneda: TQRBand;
    QRInterEncabezado1: TQRInterEncabezado;
    ColumnHeaderBand1: TQRBand;
    QRBandCasoAB: TQRBand;
    QRLabel11: TQRLabel;
    QRExpr1: TQRExpr;
    QRBandProveedor: TQRBand;
    QRBandCasoC: TQRBand;
    QRBandEmisor: TQRBand;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr10: TQRExpr;
    QRLabel4: TQRLabel;
    QRExpr24: TQRExpr;
    QRLabel7: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel23: TQRLabel;
    QRShape11: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText18: TQRDBText;
    QRLabel38: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel37: TQRLabel;
    QRDBText15: TQRDBText;
    qyRelDocEmi: TQuery;
    QRDBText8: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText27: TQRDBText;
    QRLabel40: TQRLabel;
    QRExpr11: TQRExpr;
    QRLabel41: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel42: TQRLabel;
    QRDBText23: TQRDBText;
    QRLabel43: TQRLabel;
    QRDBText26: TQRDBText;
    QRDBText35: TQRDBText;
    QRLabel44: TQRLabel;
    QRDBText36: TQRDBText;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRDBText37: TQRDBText;
    QRExpr3: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr16: TQRExpr;
    QRExpr17: TQRExpr;
    QRExpr18: TQRExpr;
    QRExpr20: TQRExpr;
    QRExpr21: TQRExpr;
    QRExpr22: TQRExpr;
    QRExpr23: TQRExpr;
    QRDBText38: TQRDBText;
    QRLabel12: TQRLabel;
    QRShape1: TQRShape;
    QRDBText17: TQRDBText;
    QRLabel5: TQRLabel;
    QRShape2: TQRShape;
    QRDBText10: TQRDBText;
    QRDBText40: TQRDBText;
    QRLabel3: TQRLabel;
    QRShape3: TQRShape;
    QRDBText39: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel1: TQRLabel;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRLabel47: TQRLabel;
    QRDBText41: TQRDBText;
    QRLabel49: TQRLabel;
    QRDBText43: TQRDBText;
    QRLabel50: TQRLabel;
    QRDBText44: TQRDBText;
    QRLabel52: TQRLabel;
    QRDBText47: TQRDBText;
    QRLabel53: TQRLabel;
    QRDBText48: TQRDBText;
    QRLabel54: TQRLabel;
    QRDBText49: TQRDBText;
    QRDBText50: TQRDBText;
    QRDBText51: TQRDBText;
    QRLabel56: TQRLabel;
    QRDBText52: TQRDBText;
    QRDBText46: TQRDBText;
    QRDBText45: TQRDBText;
    QRLabel51: TQRLabel;
    QRDBText42: TQRDBText;
    QRLabel48: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel26: TQRLabel;
    QRDBText31: TQRDBText;
    QRLabel39: TQRLabel;
    QRDBText34: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText30: TQRDBText;
    QRDBText32: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBText33: TQRDBText;
    QRLabel28: TQRLabel;
    QRDBText53: TQRDBText;
    QRLabel34: TQRLabel;
    QRDBText54: TQRDBText;
    QRShape12: TQRShape;
    QRGroupEmisor: TQRGroup;
    QRGroupEmisorSub: TQRGroup;
    QRGroupProvedor: TQRGroup;
    QRGroupCesion: TQRGroup;
    QRGroupCesion1: TQRGroup;
    QRGroupMoneda: TQRGroup;
    QRBandEmisorSub: TQRBand;
    QRLabel35: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel57: TQRLabel;
    QRExpr6: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr19: TQRExpr;
    QRExpr25: TQRExpr;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;


  private
  public
    Function FormaQuery(sF_LiqIni,sF_LiqFin,sF_ComIni,sF_ComFin,
                        sMoneda,sEmisor,sProveedor,sPromotor,sAutorizacion,
                        sDisposicion,sSituacion,sOrden,sGrupo,
                        sEmpresa, sSucursal:String;
   // ASTECI HERJA 16/12/2009  cambio de IVA de 15 a 16
                        pAPli     : TInterApli):String;
   // FIN cambio de IVA de 15 a 16
    Procedure ReglasDeRep(sF_LiqIni,sF_LiqFin,sF_ComIni,sF_ComFin,
                        sMoneda,sEmisor,sProveedor,sPromotor,sAutorizacion,
                        sDisposicion,sSituacion,sOrden,sGrupo:String);
  end;

var
  QrDocEmi: TQrDocEmi;

// ASTECI HERJA 16/12/2009  cambio de IVA de 15 a 16
  kTasaIVA : string;
//Fin HERJA IVA

Procedure RepRelDocEmi(  sF_LiqIni,sF_LiqFin,sF_ComIni,sF_ComFin,
                            sMoneda,sEmisor,sProveedor,sPromotor,sAutorizacion,
                            sDisposicion,sSituacion,sOrden,sGrupo,
                            sEmpresa, sSucursal:String;
                            pAPli     : TInterApli;
                            pPreview  : Boolean);
Implementation
{$R *.DFM}

Procedure RepRelDocEmi(  sF_LiqIni,sF_LiqFin,sF_ComIni,sF_ComFin,
                            sMoneda,sEmisor,sProveedor,sPromotor,sAutorizacion,
                            sDisposicion,sSituacion,sOrden,sGrupo,
                            sEmpresa, sSucursal:String;
                            pAPli     : TInterApli;
                            pPreview  : Boolean);
Var
    QrDocEmi: TQrDocEmi;
    VLTitulo : String;
    Preview     : TIntQRPreview;
Begin
    VLTitulo := '';
    QrDocEmi:=TQrDocEmi.Create(Nil);
    Preview := TIntQRPreview.CreatePreview(Application, QrDocEmi);
    Try

        QrDocEmi.QRInterEncabezado1.Apli:=pApli;
        QrDocEmi.QRInterEncabezado1.IdEmpresa:= pAPli.IdEmpresa;
        QrDocEmi.QRInterEncabezado1.NomReporte:= 'IntMQrDocEmi';
        QrDocEmi.QRInterEncabezado1.Titulo1:='Relación de Documentos por Emisor';

        QrDocEmi.ReglasDeRep(sF_LiqIni,sF_LiqFin,sF_ComIni,sF_ComFin,
                        sMoneda,sEmisor,sProveedor,sPromotor,sAutorizacion,
                        sDisposicion,sSituacion,sOrden,sGrupo);

        //Pone titulo
        If ((Trim(sF_LiqIni)<>'') or (Trim(sF_LiqFin)<>'')) Then
        begin
             VLTitulo := VLTitulo + ' F Venc: ';
             If Trim(sF_LiqIni)<>'' Then
                VLTitulo := VLTitulo + sF_LiqIni;
             If Trim(sF_LiqFin)<>'' Then
             begin
                  If Trim(sF_LiqIni)<>'' Then
                     VLTitulo := VLTitulo + ' al ';
                  VLTitulo := VLTitulo + sF_LiqFin;
             end;
        end;
        If ((Trim(sF_ComIni)<>'') or (Trim(sF_ComIni)<>'')) Then
        begin
             VLTitulo := VLTitulo + ' F Compra: ';
             If Trim(sF_ComIni)<>'' Then
                VLTitulo := VLTitulo + sF_ComIni;
             If Trim(sF_ComIni)<>'' Then
             begin
                  If Trim(sF_ComIni)<>'' Then
                     VLTitulo := VLTitulo + ' al ';
                  VLTitulo := VLTitulo + sF_ComFin;
             end;
        end;

        If (Trim(sMoneda)<>'') Then
            VLTitulo := VLTitulo + ' Por Moneda';
        If (Trim(sEmisor)<>'') Then
            VLTitulo := VLTitulo + ' Por Emisor';
        If (Trim(sProveedor)<>'') Then
            VLTitulo := VLTitulo + ' Por Prov.';
        If (Trim(sPromotor)<>'') Then
            VLTitulo := VLTitulo + ' Por Prom. Adm.';
        If (Trim(sAutorizacion)<>'') Then
            VLTitulo := VLTitulo + ' Por Autorización';
        If (Trim(sDisposicion)<>'') Then
            VLTitulo := VLTitulo + ' Por Disposición';
        If (Trim(sSituacion)<>'') Then
            VLTitulo := VLTitulo + ' Por Situación';

        QrDocEmi.QRInterEncabezado1.Titulo2 := VLTitulo;

        QrDocEmi.qyRelDocEmi.DatabaseName := pApli.DataBaseName;
        QrDocEmi.qyRelDocEmi.SessionName := pApli.SessionName;
        QrDocEmi.qyRelDocEmi.Active:=False;
        QrDocEmi.qyRelDocEmi.SQL.Text:= QrDocEmi.FormaQuery(sF_LiqIni,sF_LiqFin,sF_ComIni,sF_ComFin,
                            sMoneda,sEmisor,sProveedor,sPromotor,sAutorizacion,
                            sDisposicion,sSituacion,sOrden,sGrupo,sEmpresa, sSucursal,
   // ASTECI HERJA 16/12/2009  cambio de IVA de 15 a 16
                            pAPli);
   // FIN cambio de IVA de 15 a 16

        QrDocEmi.qyRelDocEmi.SQL.SaveToFile('C:\Emisor-Proveedor.sql');

        QrDocEmi.qyRelDocEmi.Active:=True;

        If pPreview Then
            QrDocEmi.Preview
        Else
            QrDocEmi.Print;
    Finally
        QrDocEmi.free;
    End;
End;

Function TQrDocEmi.FormaQuery(  sF_LiqIni,sF_LiqFin,sF_ComIni,sF_ComFin,
                        sMoneda,sEmisor,sProveedor,sPromotor,sAutorizacion,
                        sDisposicion,sSituacion,sOrden,sGrupo,
                        sEmpresa, sSucursal:String;
   // ASTECI HERJA 16/12/2009  cambio de IVA de 15 a 16
                        pAPli     : TInterApli):String;
   // FIN cambio de IVA de 15 a 16
Var
    sSQL:String;
    VLBFVen, VLBFCom  : String;
Begin
   // ASTECI HERJA 16/12/2009  cambio de IVA de 15 a 16
   kTasaIVA :=  fDameIVA(pAPli);
   //Fin HERJA IVA

    VLBFVen := 'F';
    VLBFCom  := 'F';
    sSQL:=  ' SELECT '+
            ' CD.ID_DOCUMENTO, '+
            ' CC.ID_CREDITO, '+
            ' CD.CVE_TIPO_INTERES, '+
            ' CD.ID_CESION, '+
            ' CD.F_COMPRA, '+
            ' CD.IMP_NOMINAL, '+
            ' CD.IMP_COMPRA, '+
            ' CD.TASA_DESCUENTO, '+
            ' CD.TASA_AFORO, '+
            ' CD.SIT_DOCUMENTO, '+
            ' CTD.DESC_DOCUMENTO, '+
            ' CCA.F_VENCIMIENTO, '+
            ' CCA.F_PROG_PAGO, '+
            ' CCA.F_PAGO, '+
            ' CCA.PLAZO, '+
            ' CCA.IMP_CAPITAL IMP_AFORADO, '+
            ' CR.IMP_REMANENTE, '+
            ' NVL(CCI.IMP_INTERES,0) IMP_INTERES, '+
            ' CTO.CVE_MONEDA, '+
            ' M.DESC_MONEDA, '+
            ' CCE.ID_EMISOR, '+
            ' CCE.CVE_EMISOR_NAFIN, '+
            ' CCE.ID_PROVEEDOR, '+
            ' CCE.SIT_CESION, '+
            ' PCE.CVE_PER_JURIDICA, '+
            ' DECODE(PCE.CVE_PER_JURIDICA,''PM'',PCE.NOMBRE,PE.APELLIDO_PATERNO||'' ''||PE.APELLIDO_MATERNO||'' ''||PE.NOMBRE_PERSONA) NOM_EMISOR, '+
            ' CE.NOMBRE_EMISOR, '+
//            ' CE.CUENTA_BANCO CHEQUERA_EMI, '+
            ' PKGCRPERIODO.STPObtChqCte(CCE.ID_EMISOR,CCE.CVE_EMISOR_NAFIN,CCE.ID_CESION,''AC'',''AD'',''CR'') CHEQUERA_EMI,'+
            ' PP.NOMBRE NOM_PROVEEDOR, '+
//            ' CP.CUENTA_BANCO CHEQUERA_PRO, '+
            ' PKGCRPERIODO.STPObtChqCte(CCE.ID_PROVEEDOR,NULL,CCE.ID_CESION,''PR'',''AD'',''AB'') CHEQUERA_PROV, '+
            ' PKGCRPERIODO.STPObtChqCte(CCE.ID_PROVEEDOR,NULL,CCE.ID_CESION,''PR'',''LQ'',''AB'') CHEQUERA_PROV_L, '+
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
//            ' CP.ID_PROV_NAFINSA, '+
            ' CP.ID_PROV_EXTERNO ID_PROV_NAFINSA, '+
{/ROIM}
            ' CC.ID_PROM_ADM, '+
            ' PPR.NOMBRE NOM_PROMOTOR, '+
            ' CCE.PCT_COMISION, '+
         //CORRECCION DE IVA DE 15 A 16
         //ASTECI HERJA 16/12/2009
         //   ' (CD.IMP_NOMINAL * CCE.PCT_COMISION * CCA.PLAZO * 1.15 / 36000) IMP_COMIS_IVA, '+
            ' (CD.IMP_NOMINAL * CCE.PCT_COMISION * CCA.PLAZO * 1.'+kTasaIVA+' / 36000) IMP_COMIS_IVA, '+
         //FIN DE CORRECCION
            ' 0 NUMERO_FACTURA, '+
//            ' CE.CUENTA_BANCO CHEQUERA_ABONO, '+
            ' PKGCRPERIODO.STPObtChqCte(CCE.ID_EMISOR,CCE.CVE_EMISOR_NAFIN,CCE.ID_CESION,''AC'',''AD'',''AB'') CHEQUERA_EMI,'+
            ' CC.IMP_DISPUESTO, '+
            ' CC.SDO_INSOLUTO, '+
            ' IMP_CAPITAL_VDO '+
            
            ' FROM '+
            ' CR_DOCUMENTO  CD, '+
            ' CR_TIPO_DOCTO CTD, '+
            ' CR_CAPITAL    CCA, '+
            ' CR_INTERES    CCI, '+
            ' CR_REMANENTE  CR, '+
            ' CR_CREDITO    CC, '+
            ' CONTRATO      CTO, '+
            ' MONEDA        M, '+
            ' CR_CESION     CCE, '+
            ' PERSONA_FISICA PE, '+
            ' PERSONA       PCE, '+
            ' CR_EMISOR     CE, '+
            ' PERSONA       PP, '+
            ' CR_PROVEEDOR  CP, '+
            ' PERSONA       PPR, '+
            ' CR_CONTRATO, '+
            ' CR_PRODUCTO '+

            ' WHERE CTD.CVE_DOCUMENTO = CD.CVE_DOCUMENTO '+
            ' AND   CCA.ID_CREDITO = CD.ID_CESION '+
            ' AND   CCA.NUM_PERIODO = CD.NUM_PERIODO_DOC '+
            ' AND   CCI.ID_CREDITO = CD.ID_CESION '+
            ' AND   CCI.NUM_PERIODO = CD.NUM_PERIODO_DOC '+
            ' AND   CR.ID_CESION (+)= CD.ID_CESION '+
            ' AND   CR.ID_DOCUMENTO (+)= CD.ID_DOCUMENTO '+
            ' AND   CR.CVE_TIPO_REMAN (+)= ''RE'' '+
            ' AND   CC.ID_CREDITO = CD.ID_CESION '+
            ' AND   CTO.ID_CONTRATO = CC.ID_CONTRATO '+
            ' AND   M.CVE_MONEDA = CTO.CVE_MONEDA '+
            ' AND   CCE.ID_CESION = CD.ID_CESION '+
            ' AND   PE.ID_PERSONA(+)= CCE.ID_EMISOR '+
            ' AND   PCE.ID_PERSONA = CCE.ID_EMISOR '+
            ' AND   CE.ID_ACREDITADO = CCE.ID_EMISOR '+
            ' AND   CE.CVE_EMISOR_EXT = CCE.CVE_EMISOR_NAFIN '+
            ' AND   PP.ID_PERSONA = CCE.ID_PROVEEDOR '+
            ' AND   CP.ID_ACREDITADO = CCE.ID_PROVEEDOR '+
            ' AND   PPR.ID_PERSONA = CC.ID_PROM_ADM '+
            ' AND   CC.ID_CONTRATO = CR_CONTRATO.ID_CONTRATO '+
            ' AND   CC.FOL_CONTRATO = CR_CONTRATO.FOL_CONTRATO '+
            ' AND   CR_CONTRATO.CVE_PRODUCTO_CRE = CR_PRODUCTO.CVE_PRODUCTO_CRE ';


    If (Trim(sF_LiqIni)<>'')And(Trim(sF_LiqFin)<>'') Then Begin
        sSQL:= sSQL + ' AND CCA.F_VENCIMIENTO BETWEEN TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_LiqIni))+
        ''',''DD/MM/YYYY'')  AND TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_LiqFin))+
        ''',''DD/MM/YYYY'')';
        VLBFVen := 'V';
    End Else If (Trim(sF_LiqIni)<>'')And(Trim(sF_LiqFin)='') Then Begin
        sSQL:= sSQL + ' AND CCA.F_VENCIMIENTO > TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_LiqIni))+
        ''',''DD/MM/YYYY'')';
        VLBFVen := 'V';
    End Else If (Trim(sF_LiqIni)='')And(Trim(sF_LiqFin)<>'') Then Begin
        sSQL:= sSQL + ' AND CCA.F_VENCIMIENTO < TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_LiqFin))+
        ''',''DD/MM/YYYY'')';
        VLBFVen := 'V';
    End;

    If (Trim(sF_ComIni)<>'')And(Trim(sF_ComFin)<>'') Then Begin
        sSQL:= sSQL + ' AND CD.F_COMPRA BETWEEN TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_ComIni))+
        ''',''DD/MM/YYYY'')  AND TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_ComFin))+
        ''',''DD/MM/YYYY'')';
        VLBFCom  := 'V';
    End Else If (Trim(sF_ComIni)<>'')And(Trim(sF_ComFin)='') Then Begin
        sSQL:= sSQL + ' AND CD.F_COMPRA > TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_ComIni))+
        ''',''DD/MM/YYYY'')';
        VLBFCom  := 'V';
    End Else If (Trim(sF_ComIni)='')And(Trim(sF_ComFin)<>'') Then Begin
        sSQL:= sSQL + ' AND CD.F_COMPRA < TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(sF_ComFin))+
        ''',''DD/MM/YYYY'')';
        VLBFCom  := 'V';
    End;

    If (Trim(sMoneda)<>'') Then
        sSQL:= sSQL + ' AND   CTO.CVE_MONEDA ='+sMoneda;
    If (Trim(sEmisor)<>'') Then
        sSQL:= sSQL + ' AND   CCE.ID_EMISOR  ='+sEmisor;
    If (Trim(sProveedor)<>'') Then
        sSQL:= sSQL + ' AND CCE.ID_PROVEEDOR  ='+ sProveedor;
    If (Trim(sPromotor)<>'') Then
        sSQL:= sSQL + ' AND   CC.ID_PROM_ADM  ='+ sPromotor;
    If (Trim(sAutorizacion)<>'') Then
        sSQL:= sSQL + ' AND   CTO.ID_CONTRATO ='+ sAutorizacion;
    If (Trim(sDisposicion)<>'') Then
        sSQL:= sSQL + ' AND   CC.ID_CREDITO   ='+ sDisposicion;
    If (Trim(sSituacion)<>'') Then
        sSQL:= sSQL + ' AND   CD.SIT_DOCUMENTO='''+ sSituacion +'''';
    If (Trim(sEmpresa)<>'') Then
        sSQL:= sSQL + ' AND CR_PRODUCTO.ID_EMPRESA='+ Trim(sEmpresa);

    If Trim(sOrden)='C' Then Begin  //credito
        If Trim(sGrupo)='P' Then    //proveedor
            sSQL:= sSQL + ' ORDER BY CTO.CVE_MONEDA,CCE.ID_PROVEEDOR,CCE.ID_EMISOR,CCE.ID_CESION'
        Else If Trim(sGrupo)='E' Then   //emisor
            sSQL:= sSQL + ' ORDER BY CTO.CVE_MONEDA,CCE.ID_EMISOR,CCE.ID_PROVEEDOR,CCE.ID_CESION'
        Else If Trim(sGrupo)='C' Then   //cesion
            sSQL:= sSQL + ' ORDER BY CTO.CVE_MONEDA,CCE.ID_CESION';
    End Else Begin                  //persona
        If Trim(sGrupo)='P' Then    //proveedor
            sSQL:= sSQL + ' ORDER BY CTO.CVE_MONEDA,NOM_PROVEEDOR,NOM_EMISOR,CCE.ID_CESION'
        Else If Trim(sGrupo)='E' Then   //emisor
            sSQL:= sSQL + ' ORDER BY CTO.CVE_MONEDA,NOM_EMISOR,NOM_PROVEEDOR,CCE.ID_CESION'
        Else If Trim(sGrupo)='C' Then   //cesion
            sSQL:= sSQL + ' ORDER BY CTO.CVE_MONEDA,NOM_EMISOR,NOM_PROVEEDOR,CCE.ID_CESION';
    End;

    if VLBFVen = 'F' then
            sSQL:= sSQL + ' ,CCA.F_VENCIMIENTO';

    if VLBFCom  = 'F' then
            sSQL:= sSQL + ' ,CD.F_COMPRA';

    Result:= sSQL;
End;

Procedure TQrDocEmi.ReglasDeRep(sF_LiqIni,sF_LiqFin,sF_ComIni,sF_ComFin,
                        sMoneda,sEmisor,sProveedor,sPromotor,sAutorizacion,
                        sDisposicion,sSituacion,sOrden,sGrupo:String);
Begin
    If Trim(sGrupo)='C' Then Begin
        Self.QRGroupEmisor.Enabled:= False;
        Self.QRBandEmisor.Enabled:= False;
        Self.QRGroupProvedor.Enabled:= False;
        Self.QRBandProveedor.Enabled:= False;
        Self.QRGroupEmisorSub.Enabled:= False;
        Self.QRBandEmisorSub.Enabled:= False;        
        Self.QRGroupCesion.Enabled:= False;
        Self.QRBandCasoAB.Enabled:=False;
        Self.QRGroupCesion1.Enabled:= True;
        Self.QRBandCasoC.Enabled:=True;
        Self.QRGroupProvedor.Expression:='';
        Self.QRGroupEmisor.Expression:='';
        Self.QRGroupEmisorSub.Expression:='';
        Self.QRGroupCesion1.Expression:='qyRelDocEmi.ID_CESION';
        Self.QRGroupCesion.Expression:='';
    End Else If Trim(sGrupo)='E' Then Begin
        Self.QRGroupEmisor.Enabled:= True;
        Self.QRBandEmisor.Enabled:= True;
        Self.QRGroupProvedor.Enabled:= True;
        Self.QRBandProveedor.Enabled:= True;
        Self.QRGroupEmisorSub.Enabled:= False;
        Self.QRBandEmisorSub.Enabled:= False;
        Self.QRGroupCesion.Enabled:= True;
        Self.QRGroupCesion.FooterBand:= QRBandCasoAB;
        Self.QRBandCasoAB.Enabled:=True;
        Self.QRGroupCesion1.Enabled:= False;
        Self.QRBandCasoC.Enabled:=False;
        Self.QRGroupProvedor.Expression:='qyRelDocEmi.ID_PROVEEDOR';
        Self.QRGroupEmisor.Expression:='qyRelDocEmi.ID_EMISOR';
        Self.QRGroupEmisorSub.Expression:='';
        Self.QRGroupCesion1.Expression:='';
        Self.QRGroupCesion.Expression:='qyRelDocEmi.ID_CESION';
    End Else If Trim(sGrupo)='P' Then Begin
        Self.QRGroupEmisor.Enabled:= False;
        Self.QRBandEmisor.Enabled:= False;
        Self.QRGroupProvedor.Enabled:= True;
        Self.QRBandProveedor.Enabled:= True;
        Self.QRGroupEmisorSub.Enabled:= True;
        Self.QRBandEmisorSub.Enabled:= True;
        Self.QRBandCasoAB.Enabled:=True;
        Self.QRGroupCesion.Enabled:= True;
        Self.QRGroupCesion.FooterBand:= QRBandCasoAB;
        Self.QRGroupCesion1.Enabled:= False;
        Self.QRBandCasoC.Enabled:=False;
        Self.QRGroupProvedor.Expression:='qyRelDocEmi.ID_PROVEEDOR';
        Self.QRGroupEmisor.Expression:='';
        Self.QRGroupEmisorSub.Expression:='qyRelDocEmi.ID_EMISOR';
        Self.QRGroupCesion1.Expression:='';
        Self.QRGroupCesion.Expression:='qyRelDocEmi.ID_CESION';
    End;
End;

End.
