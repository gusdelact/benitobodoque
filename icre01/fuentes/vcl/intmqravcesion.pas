// MODIFICADO 18 MAY 04 : QUITA LOS DOCUMENTOS CANCELADOS DE LOS AVISOS
// MODIFICADO 24 SEP 04 : BUSCA POR FECHA DE AUTORIZACION
// MODIFICADO 21 DIC 04 : INCORPORA FILTRO EMISOR PROVEEDOR

unit IntMQrAvCesion;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls, Dialogs,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, IntHead, InterApl,
  IntQRPreview, IntGencre;

type
  TQrAvCesion = class(TQuickRep)
    QRGroup1: TQRGroup;
    qyAvCesion: TQuery;
    QRBand2: TQRBand;
    qrlFecha: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel29: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel30: TQRLabel;
    QRLConcepto: TQRLabel;
    QRLConceptoIVA: TQRLabel;
    QRLTotal: TQRLabel;
    QRShape1: TQRShape;
    QRNombre: TQRLabel;
    QRLRFC: TQRLabel;
    QRDireccion: TQRLabel;
    QRColonia: TQRLabel;
    QRDelegacion: TQRLabel;
    QRCP: TQRLabel;
    QRCiudad: TQRLabel;
    QRCuenta: TQRLabel;
    qyAvCesionID_CESION: TFloatField;
    qyAvCesionNOM_EMISOR: TStringField;
    qyAvCesionNOM_PROVEEDOR: TStringField;
    qyAvCesionRFC_E: TStringField;
    qyAvCesionRFC_P: TStringField;
    qyAvCesionDIRECCION_E: TStringField;
    qyAvCesionCOLONIA_E: TStringField;
    qyAvCesionDELEGACION_E: TStringField;
    qyAvCesionCODIGO_POSTAL_E: TStringField;
    qyAvCesionCIUDAD_E: TStringField;
    qyAvCesionDIRECCION_P: TStringField;
    qyAvCesionCOLONIA_P: TStringField;
    qyAvCesionDELEGACION_P: TStringField;
    qyAvCesionCODIGO_POSTAL_P: TStringField;
    qyAvCesionCIUDAD_P: TStringField;
    qyAvCesionDESC_L_PRODUCTO: TStringField;
    qyAvCesionCTA_EMI: TStringField;
    qyAvCesionCTA_PROV: TStringField;
    qyAvCesionDESC_MONEDA: TStringField;
    qyAvCesionIMP_CAPITAL: TFloatField;
    qyAvCesionIMP_INTERES: TFloatField;
    qyAvCesionIMP_IVA: TFloatField;
    qyAvCesionIMP_TOTAL_INT: TFloatField;
    qyAvCesionAVISO: TStringField;
    qyAvCesionF_ALTA: TDateTimeField;
    qyAvCesionCERO: TFloatField;
    qyAvCesionCONCEPTO: TFloatField;
    qyAvCesionIVA: TFloatField;
    qyAvCesionIMPORTE_TOT: TFloatField;
    qyAvCesionF_AUTORIZA: TDateTimeField;
    QRConcepto: TQRLabel;
    QRIvaConcepto: TQRLabel;
    QRImpTotal: TQRLabel;
    QRRFC: TQRLabel;
    QRImageCARGO: TQRImage;
    QRImageABONO: TQRImage;
    QRLFechaSello: TQRLabel;
    qyAvCesionB_APLICA_IVA: TStringField;
    qyAvCesionCVE_PER_JURIDICA: TStringField;
    qyAvCesionPCT_IVA: TFloatField;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrlFechaPrint(sender: TObject; var Value: String);
    procedure QuickRepAfterPrint(Sender: TObject);
    procedure QRLFechaSelloPrint(sender: TObject; var Value: String);
  private
    VLRelacion : String;
    Apli       : TInterApli;
  public

    Function FormaQuery(sF_Inicio, sF_Fin : String;
                        sEmisor, sProveedor : String;
                        iIdCesionFo, iIdCesionFf : Integer;
                        sAviso, sRelacion : String; iCopias : Integer; sCesiones, sOrden : String ): String;
  end;

const coCRLF = #13#10;

var
  QrAvCesion: TQrAvCesion;
  vgApli: TInterApli;

Procedure RepAvisosxCesion( sF_Inicio, sF_Fin   : String;
                            sEmisor     : String;
                            sProveedor  : String;
                            sIdCesionFo : Integer;
                            sIdCesionFf : Integer;
                            sAviso      : String;
                            sRelacion   : String;
                            iCopias     : Integer;
                            sCesiones   : String; // Cesiones a Ignorar para su Impresión
                            sOrden      : String;
                            pAPli       : TInterApli;
                            pPreview    : Boolean);

//function RegistraEmailAviso(nID_CREDITO : Integer; pbMail, strID_DOCUMENTO, strCVE_AVISO : String;
//                            nCopias : Integer;  Apli : TInterApli) : Integer;

Implementation
{$R *.DFM}

Procedure RepAvisosxCesion( sF_Inicio, sF_Fin   : String;
                            sEmisor     : String;
                            sProveedor  : String;
                            sIdCesionFo : Integer;
                            sIdCesionFf : Integer;
                            sAviso      : String;
                            sRelacion   : String;
                            iCopias     : Integer;
                            sCesiones   : String; // Cesiones a Ignorar para su Impresión
                            sOrden      : String;
                            pAPli       : TInterApli;
                            pPreview    : Boolean);
Var
    QrAvCesion: TQrAvCesion;
    Preview     : TIntQRPreview;
Begin
    QrAvCesion:=TQrAvCesion.Create(Nil);
    Preview := TIntQRPreview.CreatePreview(Application, QrAvCesion);
    vgApli := pApli;
    Try
        QrAvCesion.VLRelacion := sRelacion;
        QrAvCesion.qyAvCesion.DatabaseName := pApli.DataBaseName;
        QrAvCesion.qyAvCesion.SessionName := pApli.SessionName;
        QrAvCesion.Apli := pApli;

        QrAvCesion.qyAvCesion.Active:=False;
        QrAvCesion.qyAvCesion.SQL.Text:= QrAvCesion.FormaQuery(sF_Inicio, sF_Fin,
                                                    sEmisor, sProveedor, // lols
                                                    sIdCesionFo, sIdCesionFf,
                                                    sAviso   , sRelacion ,  iCopias, sCesiones, sOrden);

            QrAvCesion.qrlFecha.Caption:= FormatDateTime('"MÉXICO D.F. A " dd " DE " mmmm " DEL " yyyy',
                            pAPli.DameFechaEmpresaDia('D000'));

            {If  Trim(sAviso)='ABONO' Then //LOLS
            Begin
                QrAvCesion.QRLConcepto.Caption := 'CAPITAL';
                QrAvCesion.QRLConceptoIVA.Caption := 'IVA DE CAPITAL';
                QrAvCesion.QRLTotal.Caption := 'CAPITAL';
            end
            else
            Begin
                QrAvCesion.QRLConcepto.Caption := 'INTERESES COBRADOS POR ANTICIPADO';
                QrAvCesion.QRLConceptoIVA.Caption := 'IVA DE INTERESES';
                QrAvCesion.QRLTotal.Caption := 'IMPORTE';
            end;}


        QrAvCesion.PrinterSettings.Copies := iCopias;
        QrAvCesion.qyAvCesion.Active:=True;
        QrAvCesion.qyAvCesion.SQL.SaveToFile('c:\aviso.txt');

        If Not QrAvCesion.qyAvCesion.IsEmpty Then
         Begin
          If pPreview Then
              QrAvCesion.Preview
          Else
              QrAvCesion.Print;
         End
       Else
        ShowMessage('No hay datos que mostrar');

    Finally
        QrAvCesion.qyAvCesion.Close;
        QrAvCesion.free;
    End;

    If Assigned(Preview) Then Preview.Free;
End;
{
function RegistraEmailAviso(nID_CREDITO : Integer; pbMail, strID_DOCUMENTO, strCVE_AVISO : String;
                            nCopias : Integer;  Apli : TInterApli) : Integer;
var Stp : TStoredProc;
Begin
 Result := 0;
 Stp := TStoredProc.Create(Nil);
 If Assigned(Stp) Then
  With Stp Do
   Try
     DataBaseName := Apli.DataBaseName;
     SessionName := Apli.SessionName;
     StoredProcName := 'PKGCRPERIODO.STPACTIMPRAVISO';
     Params.Clear;
     Params.CreateParam(ftInteger,'PEID_CREDITO',ptInput);
     Params.CreateParam(ftString,'PEID_DOCUMENTO',ptInput);
     Params.CreateParam(ftString,'PECVE_AVISO',ptInput);
     Params.CreateParam(ftInteger,'PENUM_IMPRESION',ptInput);
     Params.CreateParam(ftString,'PB_MAIL',ptInput);
     Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
     Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
     Params.CreateParam(ftInteger,'PSRESULTADO',ptOutput);

     // Actualiza el número de Impresión en la tabla "CR_CTRL_AVISO"
     ParamByName('PEID_CREDITO').AsInteger := nID_CREDITO;
     ParamByName('PEID_DOCUMENTO').AsString := strID_DOCUMENTO;
     ParamByName('PECVE_AVISO').AsString := strCVE_AVISO;
     ParamByName('PENUM_IMPRESION').AsInteger := nCopias;
     ParamByName('PB_MAIL').AsString := 'V';     
     ParamByName('PEBCOMMIT').AsString := 'V';
     ExecProc;
     If (ParamByName('PSRESULTADO').AsInteger <> 0) Then
       ShowMessage(ParamByName('PSTXRESULTADO').AsString);
     Result := ParamByName('PSRESULTADO').AsInteger;
   Finally
      Stp.Free;
   End;
End;
}

Function TQrAvCesion.FormaQuery(sF_Inicio, sF_Fin : String;
                                sEmisor, sProveedor : String;
                                iIdCesionFo, iIdCesionFf : Integer;
                                sAviso, sRelacion : String; iCopias : Integer; sCesiones, sOrden : String ): String;
var
    sSQLCargo,sSQLAbono,sSQLTotal:String;
    sIdCesion:String;
Begin
    if sEmisor <> '' then
      sEmisor := 'AND CE.ID_ACREDITADO = ' + sEmisor;
    if sProveedor <> '' then
      sProveedor := 'AND CPV.ID_ACREDITADO = ' + sProveedor;
    //

    sIdCesion:= 'BETWEEN ' + IntToStr(iIdCesionFo) + ' AND ' + IntToStr(iIdCesionFf);
    sSQLCargo:= '';
    sSQLAbono:= '';
    sSQLTotal:= '';
    sSQLAbono:=   ' SELECT CCE.ID_CESION, '+ coCRLF +
                  '        DECODE(PCE.CVE_PER_JURIDICA,''PM'',PCE.NOMBRE,PE.APELLIDO_PATERNO||'' ''||PE.APELLIDO_MATERNO||'' ''||PE.NOMBRE_PERSONA) NOM_EMISOR, '+ coCRLF +
                  '        PP.NOMBRE NOM_PROVEEDOR, '+ coCRLF +
                  '        (RFC.SIGLAS_RFC||''-''||RFC.F_RFC||''-''||RFC.HOMOCLAVE_RFC) RFC_E, '+ coCRLF +
                  '        (RFC_P.SIGLAS_RFC||''-''||RFC_P.F_RFC||''-''||RFC_P.HOMOCLAVE_RFC) RFC_P, '+ coCRLF +
                  '        DME.CALLE_NUMERO DIRECCION_E, '+ coCRLF +
                  '        DME.COLONIA COLONIA_E, '+ coCRLF +
                  '        PBDE.DESC_POBLACION DELEGACION_E, '+ coCRLF +
                  '        DME.CODIGO_POSTAL CODIGO_POSTAL_E, '+ coCRLF +
                  '        PBCE.DESC_POBLACION CIUDAD_E, '+ coCRLF +
                  '        DMP.CALLE_NUMERO DIRECCION_P, '+ coCRLF +
                  '        DMP.COLONIA COLONIA_P, '+ coCRLF +
                  '        PBDP.DESC_POBLACION DELEGACION_P, '+ coCRLF +
                  '        DMP.CODIGO_POSTAL CODIGO_POSTAL_P, '+ coCRLF +
                  '        PBCP.DESC_POBLACION CIUDAD_P, '+ coCRLF +
                  '        CPR.DESC_L_PRODUCTO, '+ coCRLF +
//                  ' CE.CUENTA_BANCO CTA_EMI, '+
                  '        SUBSTR(PKGCRPERIODO.STPObtChqCte(CCE.ID_EMISOR,CCE.CVE_EMISOR_NAFIN,CCE.ID_CESION,''AC'',''AD'',''CR''),1,20) CTA_EMI,'+ coCRLF +
//                  ' CPV.CUENTA_BANCO CTA_PROV, '+
                  '        SUBSTR(PKGCRPERIODO.STPObtChqCte(CCE.ID_PROVEEDOR,NULL,CCE.ID_CESION,''PR'',''AD'',''AB''),1,20) CTA_PROV, '+ coCRLF +
                  '        M.DESC_MONEDA, '   + coCRLF +
                  '        SCAP.IMP_CAPITAL, '+ coCRLF +
                  '        0 IMP_INTERES, '   + coCRLF +
                  '        0 IMP_IVA, '       + coCRLF +
                  '        0 IMP_TOTAL_INT, ' + coCRLF +
                  '        ''ABONO'' AVISO, ' + coCRLF +
                  '        CCE.F_ALTA, '      + coCRLF +        // LOLS 24 09 2004
                  '        CCE.F_AUTORIZA, '  + coCRLF +        // LOLS 24 09 2004
                  '        0 CERO,0 CONCEPTO,0 IVA,0 IMPORTE_TOT, '+ coCRLF +
                  //        --/< EASA4011    16 AGO 2006 Solicitud de IVA
                  '        CPR.B_APLICA_IVA,  '  + coCRLF +
                  '        PP.CVE_PER_JURIDICA,'  + coCRLF +
                  '        0 PCT_IVA'  + coCRLF +
                  //        -- EASA4011 >/
                  ' FROM CR_CESION     CCE, ' + coCRLF +
                  '      PERSONA_FISICA  PE, '+ coCRLF +
                  '      PERSONA       PCE, ' + coCRLF +
                  '      PERSONA       PP, '  + coCRLF +
                  '      RFC, '      + coCRLF +
                  '      RFC RFC_P, '+ coCRLF +
                  '      CR_CREDITO    CC, '  + coCRLF +
                  '      CONTRATO      CTO, ' + coCRLF +
                  '      DOMICILIO     DME, ' + coCRLF +
                  '      POBLACION     PBDE, '+ coCRLF +
                  '      POBLACION     PBCE, '+ coCRLF +
                  '      DOMICILIO     DMP, ' + coCRLF +
                  '      POBLACION     PBDP, '+ coCRLF +
                  '      POBLACION     PBCP, '+ coCRLF +
                  '      CR_CONTRATO   CCTO, '+ coCRLF +
                  '      CR_PRODUCTO   CPR, ' + coCRLF +
                  '      CR_EMISOR     CE, '  + coCRLF +
                  '      CR_PROVEEDOR  CPV, ' + coCRLF +
                  '      MONEDA        M, '   + coCRLF +
                  '      (SELECT SUM(IMP_CAPITAL) IMP_CAPITAL, ID_CREDITO '+ coCRLF +
                  '        FROM CR_CAPITAL '+ coCRLF +
                  '        WHERE ID_CREDITO  '+ sIdCesion + coCRLF +
                  '          AND SIT_CAPITAL <> ''CA'' '  + coCRLF + // PERIODOS CANCELADOS  // LOLS 18 MAY 2004
                  '        GROUP BY ID_CREDITO) SCAP '+ coCRLF +
                  ' WHERE CCE.ID_CESION  '+  sIdCesion + coCRLF +
                  '   AND CCE.SIT_CESION <> ''CA''  '  + coCRLF +
                  sEmisor  + coCRLF + sProveedor + coCRLF + // LOLS 21 12 2004
                  '   AND PE.ID_PERSONA(+)     = CCE.ID_EMISOR '+ coCRLF +
                  '   AND PCE.ID_PERSONA       = CCE.ID_EMISOR '+ coCRLF +
                  '   AND PP.ID_PERSONA        = CCE.ID_PROVEEDOR '+ coCRLF +
                  '   AND RFC.ID_PERSONA(+)    = PCE.ID_PERSONA '+ coCRLF + // PE. X PCE. LOLS
                  '   AND RFC_P.ID_PERSONA(+)  = PP.ID_PERSONA '+ coCRLF +
                  '   AND CC.ID_CREDITO        = CCE.ID_CESION '      + coCRLF +
                  '   AND CTO.ID_CONTRATO      = CC.ID_CONTRATO '   + coCRLF +
                  '   AND DMP.ID_DOMICILIO     = PP.ID_DOMICILIO ' + coCRLF +
                  '   AND PBDP.CVE_POBLACION   = DMP.CVE_CIUDAD '+ coCRLF +
                  '   AND PBCP.CVE_POBLACION   = DMP.CVE_ESTADO '+ coCRLF +   //--DM.CVE_CIUDAD '+
                  '   AND DME.ID_DOMICILIO     = CTO.ID_DOMICILIO '+ coCRLF +
                  '   AND PBDE.CVE_POBLACION   = DME.CVE_CIUDAD '+ coCRLF +
                  '   AND PBCE.CVE_POBLACION   = DME.CVE_ESTADO '+ coCRLF +   //--DM.CVE_CIUDAD '+
                  '   AND CCTO.ID_CONTRATO     = CC.ID_CONTRATO '  + coCRLF +
                  '   AND CCTO.FOL_CONTRATO    = CC.FOL_CONTRATO '+ coCRLF +
                  '   AND CPR.CVE_PRODUCTO_CRE = CCTO.CVE_PRODUCTO_CRE '+ coCRLF +
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
                  '   AND CE.CVE_FND_ENT_DES   = CCE.CVE_FND_ENT_DES '+ coCRLF +
                  '   AND CE.ID_ACREDITADO     = CCE.ID_EMISOR '+ coCRLF +
//                  '   AND CE.CVE_EMISOR_NAFIN  = CCE.CVE_EMISOR_NAFIN '+ coCRLF +
                  '   AND CE.CVE_EMISOR_EXT    = CCE.CVE_EMISOR_NAFIN '+ coCRLF +
                  '   AND CPV.CVE_FND_ENT_DES  = CCE.CVE_FND_ENT_DES '+ coCRLF +
                  '   AND CPV.ID_ACREDITADO    = CCE.ID_PROVEEDOR '+ coCRLF +
{/ROIM}
                  '   AND M.CVE_MONEDA         = CTO.CVE_MONEDA '+ coCRLF +
                  '   AND SCAP.ID_CREDITO      = CCE.ID_CESION ';
    If ( Trim(sF_Inicio) <> '' )  OR  ( Trim(sF_Fin)  <> '' ) Then
        sSQLAbono:= sSQLAbono+' AND CCE.F_AUTORIZA >= TO_DATE('''+ sF_Inicio +''',''DD/MM/YYYY'')'+
        '  AND CCE.F_AUTORIZA <= TO_DATE('''+ sF_Fin +''',''DD/MM/YYYY'')' ;

    sSQLCargo:=  ' SELECT '+ coCRLF +
                 '        CCE.ID_CESION, '+ coCRLF +
                 '        DECODE(PCE.CVE_PER_JURIDICA,''PM'',PCE.NOMBRE,PE.APELLIDO_PATERNO||'' ''||PE.APELLIDO_MATERNO||'' ''||PE.NOMBRE_PERSONA) NOM_EMISOR, '+ coCRLF +
                 '        PP.NOMBRE NOM_PROVEEDOR, '+ coCRLF +
                 '        (RFC.SIGLAS_RFC||''-''||RFC.F_RFC||''-''||RFC.HOMOCLAVE_RFC) RFC_E, '+ coCRLF +
                 '        (RFC_P.SIGLAS_RFC||''-''||RFC_P.F_RFC||''-''||RFC_P.HOMOCLAVE_RFC) RFC_P, '+ coCRLF +
                 '        DME.CALLE_NUMERO DIRECCION_E, '+ coCRLF +
                 '        DME.COLONIA COLONIA_E, '+ coCRLF +
                 '        PBDE.DESC_POBLACION DELEGACION_E, '+ coCRLF +
                 '        DME.CODIGO_POSTAL CODIGO_POSTAL_E, '+ coCRLF +
                 '        PBCE.DESC_POBLACION CIUDAD_E, '+ coCRLF +
                 '        DMP.CALLE_NUMERO DIRECCION_P, '+ coCRLF +
                 '        DMP.COLONIA COLONIA_P, '+ coCRLF +
                 '        PBDP.DESC_POBLACION DELEGACION_P, '+ coCRLF +
                 '        DMP.CODIGO_POSTAL CODIGO_POSTAL_P, '+ coCRLF +
                 '        PBCP.DESC_POBLACION CIUDAD_P, '+ coCRLF +
                 '        CPR.DESC_L_PRODUCTO, '+ coCRLF +
//                  ' CE.CUENTA_BANCO CTA_EMI, '+
                 '        SUBSTR(PKGCRPERIODO.STPObtChqCte(CCE.ID_EMISOR,CCE.CVE_EMISOR_NAFIN,CCE.ID_CESION,''AC'',''AD'',''CR''),1,20) CTA_EMI,'+ coCRLF +
//                  ' CPV.CUENTA_BANCO CTA_PROV, '+
                 '        SUBSTR(PKGCRPERIODO.STPObtChqCte(CCE.ID_PROVEEDOR,NULL,CCE.ID_CESION,''PR'',''AD'',''AB''),1,20) CTA_PROV, '+ coCRLF +
                 '        M.DESC_MONEDA, '+ coCRLF +
                 '        0 IMP_CAPITAL,'+ coCRLF +
                 '        SINT.IMP_INTERES, '+ coCRLF +
                 '        SIIV.IMP_IVA, '+ coCRLF +
                 '        (SINT.IMP_INTERES + SIIV.IMP_IVA) IMP_TOTAL_INT, '+ coCRLF +
                 '        ''CARGO'' AVISO, '+ coCRLF +
                 '        CCE.F_ALTA, '    + coCRLF +     // 24 09 2004
                 '        CCE.F_AUTORIZA, '+ coCRLF +     // 24 09 2004
                 '        0 CERO,0 CONCEPTO,0 IVA,0 IMPORTE_TOT, '+ coCRLF +
                  //        --/< EASA4011    16 AGO 2006 Solicitud de IVA
                 '        CPR.B_APLICA_IVA,  '  + coCRLF +
                 '        PP.CVE_PER_JURIDICA,'  + coCRLF +
                 '        0 PCT_IVA'  + coCRLF +
                  //        -- EASA4011 >/
                 ' FROM '+ coCRLF +
                 '      CR_CESION     CCE, '  + coCRLF +
                 '      PERSONA_FISICA  PE, ' + coCRLF +
                 '      PERSONA       PCE, '  + coCRLF +
                 '      PERSONA       PP, '   + coCRLF +
                 '      RFC, '                + coCRLF +
                 '      RFC RFC_P, '          + coCRLF +
                 '      CR_CREDITO    CC, '   + coCRLF +
                 '      CONTRATO      CTO, '  + coCRLF +
                 '      DOMICILIO     DME, '  + coCRLF +
                 '      POBLACION     PBDE, ' + coCRLF +
                 '      POBLACION     PBCE, ' + coCRLF +
                 '      DOMICILIO     DMP, '  + coCRLF +
                 '      POBLACION     PBDP, ' + coCRLF +
                 '      POBLACION     PBCP, ' + coCRLF +
                 '      CR_CONTRATO   CCTO, ' + coCRLF +
                 '      CR_PRODUCTO   CPR, '  + coCRLF +
                 '      CR_EMISOR     CE, '   + coCRLF +
                 '      CR_PROVEEDOR  CPV, '  + coCRLF +
                 '      MONEDA        M, '    + coCRLF +
                 '      (SELECT SUM(IMP_INTERES) IMP_INTERES, ID_CREDITO '+ coCRLF +
                 '       FROM CR_INTERES '                        + coCRLF +
                 '       WHERE ID_CREDITO  '+  sIdCesion          + coCRLF +
                 '         AND SIT_INTERES <> ''CA'' '            + coCRLF + // PERIODOS CANCELADOS  // LOLS 18 MAY 2004
                 '       GROUP BY ID_CREDITO) SINT, '             + coCRLF +
                 '      (SELECT SUM(IMP_IVA) IMP_IVA, ID_CREDITO '+ coCRLF +
                 '       FROM CR_INTERES '                + coCRLF +
                 '       WHERE ID_CREDITO '+  sIdCesion   + coCRLF +
                 '         AND SIT_INTERES <> ''CA'' '             + coCRLF + // PERIODOS CANCELADOS  // LOLS 18 MAY 2004
                 '       GROUP BY ID_CREDITO) SIIV '      + coCRLF +
                 ' WHERE CCE.ID_CESION '+    sIdCesion        + coCRLF +
                 '   AND CCE.SIT_CESION <> ''CA''  '+  coCRLF +
                 sEmisor  + coCRLF + sProveedor + coCRLF + // LOLS 21 12 2004
                 '   AND PE.ID_PERSONA(+)     = CCE.ID_EMISOR '   + coCRLF +
                 '   AND PCE.ID_PERSONA       = CCE.ID_EMISOR '     + coCRLF +
                 '   AND PP.ID_PERSONA        = CCE.ID_PROVEEDOR '   + coCRLF +
                 '   AND RFC.ID_PERSONA(+)    = PCE.ID_PERSONA '  + coCRLF + // PE. X PCE. LOLS
                 '   AND RFC_P.ID_PERSONA(+)  = PP.ID_PERSONA '+ coCRLF +
                 '   AND CC.ID_CREDITO        = CCE.ID_CESION '      + coCRLF +
                 '   AND CTO.ID_CONTRATO      = CC.ID_CONTRATO '   + coCRLF +
                 '   AND DME.ID_DOMICILIO     = CTO.ID_DOMICILIO '+ coCRLF +
                 '   AND PBDE.CVE_POBLACION   = DME.CVE_CIUDAD '+ coCRLF +
                 '   AND PBCE.CVE_POBLACION   = DME.CVE_ESTADO '+ coCRLF +   //--DM.CVE_CIUDAD '+
                 '   AND DMP.ID_DOMICILIO     = PP.ID_DOMICILIO ' + coCRLF +
                 '   AND PBDP.CVE_POBLACION   = DMP.CVE_CIUDAD '+ coCRLF +
                 '   AND PBCP.CVE_POBLACION   = DMP.CVE_ESTADO '+ coCRLF +   //--DM.CVE_CIUDAD '+
                 '   AND CCTO.ID_CONTRATO     = CC.ID_CONTRATO '  + coCRLF +
                 '   AND CCTO.FOL_CONTRATO    = CC.FOL_CONTRATO '+ coCRLF +
                 '   AND CPR.CVE_PRODUCTO_CRE = CCTO.CVE_PRODUCTO_CRE '+ coCRLF +
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
                 '   AND CE.CVE_FND_ENT_DES   = CCE.CVE_FND_ENT_DES '            + coCRLF +
                 '   AND CE.ID_ACREDITADO     = CCE.ID_EMISOR '            + coCRLF +
//                 '   AND CE.CVE_EMISOR_NAFIN  = CCE.CVE_EMISOR_NAFIN '  + coCRLF +
                 '   AND CE.CVE_EMISOR_EXT  = CCE.CVE_EMISOR_NAFIN '  + coCRLF +
                 '   AND CPV.CVE_FND_ENT_DES   = CCE.CVE_FND_ENT_DES '            + coCRLF +
                 '   AND CPV.ID_ACREDITADO    = CCE.ID_PROVEEDOR '        + coCRLF +
{/ROIM}
                 '   AND M.CVE_MONEDA         = CTO.CVE_MONEDA '  + coCRLF +
                 '   AND SINT.ID_CREDITO      = CCE.ID_CESION '+ coCRLF +
                 '   AND SIIV.ID_CREDITO      = CCE.ID_CESION ';

    If ( Trim(sF_Inicio)<>'' ) OR ( Trim(sF_Fin)<>'' )Then
        sSQLCargo:= sSQLCargo+' AND CCE.F_AUTORIZA >= TO_DATE('''+ sF_Inicio +''',''DD/MM/YYYY'')'+
                              ' AND CCE.F_AUTORIZA <= TO_DATE('''+ sF_Fin +''',''DD/MM/YYYY'')';

    If (Trim(sCesiones) <> '') Then
      sSQLCargo:= sSQLCargo+' AND CC.ID_CREDITO NOT IN ('+sCesiones+')';

    If  Trim(sAviso)='ABONO' Then Begin
        sSQLTotal:=sSQLAbono + ' UNION ALL ' + sSQLAbono;
        //sSQLTotal:=sSQLAbono + ' UNION ALL ' + sSQLAbono  // LOLS
        IF Trim(sOrden) = 'EM' THEN
           sSQLTotal:=sSQLTotal + ' ORDER BY F_AUTORIZA, ID_CESION'
        ELSE
           sSQLTotal:=sSQLTotal + ' ORDER BY F_AUTORIZA,NOM_PROVEEDOR, ID_CESION';
    end
    Else If Trim(sAviso)='CARGO'Then Begin
        //sSQLTotal:=sSQLCargo + ' UNION ALL ' + sSQLCargo  // LOLS
        sSQLTotal:=sSQLCargo + ' UNION ALL ' + sSQLCargo;

        IF Trim(sOrden) = 'EM' THEN
           sSQLTotal:=sSQLTotal + ' ORDER BY F_AUTORIZA,ID_CESION'
        ELSE
           sSQLTotal:=sSQLTotal + ' ORDER BY F_AUTORIZA,NOM_PROVEEDOR, ID_CESION';
    end
    Else If Trim(sAviso)='' Then Begin
        sSQLTotal:=sSQLAbono + ' UNION ALL ' + sSQLCargo;
        sSQLTotal:=sSQLTotal + ' UNION ALL ' + sSQLTotal;
        //sSQLTotal:=sSQLTotal + ' ORDER BY AVISO ';   //LOLS
//        sSQLTotal:=sSQLTotal + ' ORDER BY AVISO, ID_CESION';
        IF Trim(sOrden) = 'EM' THEN
           sSQLTotal:=sSQLTotal + ' ORDER BY AVISO, F_AUTORIZA,ID_CESION'
        ELSE
           sSQLTotal:=sSQLTotal + ' ORDER BY AVISO, F_AUTORIZA,NOM_PROVEEDOR, ID_CESION'
    End;

    Result:= sSQLTotal;
End;
procedure TQrAvCesion.QRBand2BeforePrint(Sender: TQRCustomBand;  var PrintBand: Boolean);
begin
        If ((Trim(VLRelacion)='EP') AND (qyAvCesionAVISO.AsString='CARGO')) Then Begin
            //PROVEEDOR
            QRNombre.Caption := qyAvCesionNOM_PROVEEDOR.AsString;
            QRRFC.Caption := qyAvCesionRFC_P.AsString;
            QRDireccion.Caption := qyAvCesionDIRECCION_P.AsString;
            QRColonia.Caption := qyAvCesionCOLONIA_P.AsString;
            QRDelegacion.Caption := qyAvCesionDELEGACION_P.AsString;
            QRCP.Caption := qyAvCesionCODIGO_POSTAL_P.AsString;
            QRCuenta.Caption := qyAvCesionCTA_PROV.AsString;
            QRCiudad.Caption := qyAvCesionCIUDAD_P.AsString;
            QRConcepto.Caption := FormatFloat('###,###,###,###,###,###,##0.00',qyAvCesionIMP_INTERES.asFloat);
            QRIvaConcepto.Caption := FormatFloat('###,###,###,###,###,###,##0.00',qyAvCesionIMP_IVA.asFloat);
            QRImpTotal.Caption := FormatFloat('###,###,###,###,###,###,##0.00',qyAvCesionIMP_TOTAL_INT.asFloat);
        End Else Begin
            //EMISOR
            QRNombre.Caption := qyAvCesionNOM_EMISOR.AsString;
            QRRFC.Caption := qyAvCesionRFC_E.AsString;
            QRDireccion.Caption := qyAvCesionDIRECCION_E.AsString;
            QRColonia.Caption := qyAvCesionCOLONIA_E.AsString;;
            QRDelegacion.Caption := qyAvCesionDELEGACION_E.AsString;
            QRCP.Caption := qyAvCesionCODIGO_POSTAL_E.AsString;
            QRCuenta.Caption := qyAvCesionCTA_EMI.AsString;
            QRCiudad.Caption := qyAvCesionCIUDAD_E.AsString;
            QRConcepto.Caption := FormatFloat('###,###,###,###,###,###,##0.00',qyAvCesionIMP_CAPITAL.asFloat);
            QRIvaConcepto.Caption := FormatFloat('###,###,###,###,###,###,##0.00',qyAvCesionCERO.asFloat);
            QRImpTotal.Caption := FormatFloat('###,###,###,###,###,###,##0.00',qyAvCesionIMP_CAPITAL.asFloat);
        End;


        // DETERMINA LA ETIQUETA DE ACUERDO AL TIPO DE AVISO
        If  Trim(qyAvCesionAVISO.AsString)='ABONO' Then //LOLS
        Begin
            QRLConcepto.Caption := 'CAPITAL';
            //<EASA4011 18 AGO 2006 Capital no lleva IVA
//            QRLConceptoIVA.Caption := 'IVA DE CAPITAL';
            QRLConceptoIVA.Caption := '';
//            QRIvaConcepto.Enabled := False;
            QRIvaConcepto.Caption := '';
            // EASA4011 >/
            QRLTotal.Caption := 'CAPITAL';
            QRImageABONO.Enabled := True;
            QRImageCARGO.Enabled := False;
        end
        else
        Begin
            QRLConcepto.Caption := 'INTERESES COBRADOS POR ANTICIPADO';
            //<EASA4011 18 AGO 2006 Capital no lleva IVA
            QRLConceptoIVA.Caption := 'IVA ';
            QRIvaConcepto.Enabled := True;
            IF Trim(qyAvCesionB_APLICA_IVA.AsString)= 'F' THEN BEGIN
              IF Trim(qyAvCesionCVE_PER_JURIDICA.AsString)= 'PM' THEN BEGIN
                 QRLConceptoIVA.Caption := QRLConceptoIVA.Caption + ' EXENTO'
              END;
            END;
            // EASA4011 >/
            QRLTotal.Caption := 'IMPORTE';
            QRImageABONO.Enabled := False;
            QRImageCARGO.Enabled := True;
        end;
end;

procedure TQrAvCesion.qrlFechaPrint(sender: TObject; var Value: String);
begin
  Value:= FormatDateTime('"México D.F. a " dd " de " mmmm " del " yyyy',
                         qyAvCesion.FieldByName('F_AUTORIZA').AsDateTime );   // qyAvCesion.FieldByName('F_ALTA').AsDateTime ); // LOLS 24 09 2004
end;

procedure TQrAvCesion.QuickRepAfterPrint(Sender: TObject);
Var vlMsg : String;
begin
  If qyAvCesion.Active Then
   Begin
   qyAvCesion.First;
   While Not qyAvCesion.Eof Do
    Begin
{
    RegistraEmailAviso(qyAvCesion.FieldByName('ID_CESION').AsInteger, 'F','0',
                       qyAvCesion.FieldByName('AVISO').AsString,
                       PrinterSettings.Copies, Apli);
}
    StpInsertUpdAv(qyAvCesion.FieldByName('AVISO').AsString,
                   qyAvCesion.FieldByName('ID_CESION').AsString,
                   '0','F','SOLO IMPRESION EN PAPEL','',qyAvCesion.FieldByName('F_AUTORIZA').AsString,  PrinterSettings.Copies,
                   vgApli, vlMsg);
    qyAvCesion.Next;
    Application.ProcessMessages;
    End;
   End;
end;

procedure TQrAvCesion.QRLFechaSelloPrint(sender: TObject;
  var Value: String);
begin
  Value:= FormatDateTime('dd" "mmm" "yyyy',
                         qyAvCesion.FieldByName('F_AUTORIZA').AsDateTime );   // qyAvCesion.FieldByName('F_ALTA').AsDateTime ); // 24 09 2004
end;

End.
